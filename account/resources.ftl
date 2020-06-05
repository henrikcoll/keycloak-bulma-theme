<#import "template.ftl" as layout>
<@layout.mainLayout active='authorization' bodyClass='authorization'; section>
    <script>
        function showHideActions(elm) {
            if (elm.style.display == 'none') {
                elm.style.display = '';
            } else {
                elm.style.display = 'none';
            }
        }
        function removeScopeElm(elm) {
            var td = elm.parentNode;
            var tr = td.parentNode;
            var tbody = tr.parentNode;

            td.removeChild(elm);

            var childCount = td.childNodes.length - 1;

            for (i = 0; i < td.childNodes.length; i++) {
                if (!td.childNodes[i].tagName || td.childNodes[i].tagName.toUpperCase() != 'DIV') {
                    td.removeChild(td.childNodes[i]);
                    childCount--;
                }
            }

            if (childCount <= 0) {
                tbody.removeChild(tr);
            }
        }

        function removeAllScopes(id) {
            var scopesElm = document.getElementsByName('removeScope-' + id);

            for (i = 0; i < scopesElm.length; i++) {
                var td = scopesElm[i].parentNode.parentNode;
                var tr = td.parentNode;
                var tbody = tr.parentNode;
                tbody.removeChild(tr);
            }
        }

        function selectAllCheckBoxes(formName, elm, name) {
            var shares = document.forms[formName].getElementsByTagName('input');

            for (i = 0; i < shares.length; i++) {
                if (shares[i].name == name) {
                    shares[i].checked = elm.checked;
                }
            }
        }
    </script>
	<h2 class="title is-2">${msg("myResources")}</h2>

    <#if authorization.resourcesWaitingApproval?size != 0>
		<h3 class="title is-3">${msg("needMyApproval")}</h3>
		<table class="table is-striped is-hoverable is-fullwidth">
			<thead>
				<tr>
					<th>${msg("resource")}</th>
					<th>${msg("requestor")}</th>
					<th>${msg("permissionRequestion")}</th>
					<th>${msg("action")}</th>
				</tr>
			</thead>
			<tbody>
				<#list authorization.resourcesWaitingApproval as resource>
					<#list resource.permissions as permission>
						<form action="${url.getResourceGrant(resource.id)}" name="approveForm-${resource.id}-${permission.requester.username}" method="post">
							<input type="hidden" name="action" value="grant">
							<input type="hidden" name="requester" value="${permission.requester.username}">
							<input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
							<tr>
								<td>
									<#if resource.displayName??>${resource.displayName}<#else>${resource.name}</#if>
								</td>
								<td>
									<#if permission.requester.email??>${permission.requester.email}<#else>${permission.requester.username}</#if>
								</td>
								<td>
									<#list permission.scopes as scope>
										<#if scope.scope??>
											<div class="search-box">
												<#if scope.scope.displayName??>
													${scope.scope.displayName}
												<#else>
													${scope.scope.name}
												</#if>
												<button class="button is-danger" type="button" id="grant-remove-scope-${resource.name}-${permission.requester.username}-${scope.scope.name}" name="removeScope-${resource.id}-${permission.requester.username}" onclick="removeScopeElm(this.parentNode);document.forms['approveForm-${resource.id}-${permission.requester.username}']['action'].value = 'deny';document.forms['approveForm-${resource.id}-${permission.requester.username}'].submit();"><i class="fa fa-times" aria-hidden="true"></i></button>
												<input type="hidden" name="permission_id" value="${scope.id}"/>
											</div>
										<#else>
											${msg("anyPermission")}
										</#if>
									</#list>
								</td>
								<td width="20%" align="middle" style="vertical-align: middle">
									<a href="#" id="grant-${resource.name}-${permission.requester.username}" onclick="document.forms['approveForm-${resource.id}-${permission.requester.username}']['action'].value = 'grant';document.forms['approveForm-${resource.id}-${permission.requester.username}'].submit();" type="submit" class="button is-ink">${msg("doApprove")}</a>
									<a href="#" id="deny-${resource.name}-${permission.requester.username}" onclick="removeAllScopes('${resource.id}-${permission.requester.username}');document.forms['approveForm-${resource.id}-${permission.requester.username}']['action'].value = 'deny';document.forms['approveForm-${resource.id}-${permission.requester.username}'].submit();" type="submit" class="button is-danger">${msg("doDeny")}</a>
								</td>
							</tr>
						</form>
					</#list>
				</#list>
			</tbody>
		</table>
    </#if>
	<h3 class="title is-3">${msg("myResourcesSub")}</h3>
	<table class="table is-striped is-hoverable is-fullwidth">
		<thead>
		<tr>
			<th>${msg("resource")}</th>
			<th>${msg("application")}</th>
			<th>${msg("peopleSharingThisResource")}</th>
		</tr>
		</thead>

		<tbody>
		<#if authorization.resources?size != 0>
			<#list authorization.resources as resource>
				<tr>
					<td>
						<a id="detail-${resource.name}" href="${url.getResourceDetailUrl(resource.id)}">
							<#if resource.displayName??>${resource.displayName}<#else>${resource.name}</#if>
						</a>
					</td>
					<td>
						<#if resource.resourceServer.baseUri??>
							<a href="${resource.resourceServer.baseUri}">${resource.resourceServer.name}</a>
						<#else>
							${resource.resourceServer.name}
						</#if>
					</td>
					<td>
						<#if resource.shares?size != 0>
							<a href="${url.getResourceDetailUrl(resource.id)}">${resource.shares?size} <i class="fa fa-users"></i></a>
						<#else>
							${msg("notBeingShared")}
						</#if>
					</td>
				</tr>
			</#list>
		<#else>
			<tr>
				<td colspan="4">${msg("notHaveAnyResource")}</td>
			</tr>
		</#if>
		</tbody>
	</table>
	<h3 class="title is-3">${msg("resourcesSharedWithMe")}</h3>
	<form action="${url.resourceUrl}" name="shareForm" method="post">
		<input type="hidden" name="action" value="cancel"/>
		<input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
		<table class="ttable is-striped is-hoverable is-fullwidth">
			<thead>
				<tr>
					<th width="5%"><input type="checkbox" onclick="selectAllCheckBoxes('shareForm', this, 'resource_id');" <#if authorization.sharedResources?size == 0>disabled="true"</#if></td>
					<th>${msg("resource")}</th>
					<th>${msg("owner")}</th>
					<th>${msg("application")}</th>
					<th>${msg("permission")}</th>
					<th>${msg("date")}</th>
				</tr>
			</thead>
			<tbody>
				<#if authorization.sharedResources?size != 0>
					<#list authorization.sharedResources as resource>
						<tr>
							<td>
								<input type="checkbox" name="resource_id" value="${resource.id}"/>
							</td>
							<td>
								<#if resource.displayName??>${resource.displayName}<#else>${resource.name}</#if>
							</td>
							<td>
								<#if resource.owner.email??>${resource.owner.email}<#else>${resource.owner.username}</#if>
							</td>
							<td>
								<a href="${resource.resourceServer.baseUri}">${resource.resourceServer.name}</a>
							</td>
							<td>
								<#if resource.permissions?size != 0>
									<ul>
										<#list resource.permissions as permission>
											<#list permission.scopes as scope>
												<#if scope.granted && scope.scope??>
													<li>
														<#if scope.scope.displayName??>
															${scope.scope.displayName}
														<#else>
															${scope.scope.name}
														</#if>
													</li>
												<#else>
													${msg("anyPermission")}
												</#if>
											</#list>
										</#list>
									</ul>
								<#else>
									Any action
								</#if>
							</td>
							<td>
								${resource.permissions[0].grantedDate?datetime}
							</td>
						</tr>
					</#list>
				<#else>
					<tr>
						<td colspan="6">${msg("noResourcesSharedWithYou")}</td>
					</tr>
				</#if>
			</tbody>
		</table>
	</form>
	<#if authorization.sharedResources?size != 0>
            <a href="#" onclick="document.forms['shareForm'].submit();" type="submit" class="button is-danger">${msg("doRemoveSharing")}</a>
	</#if>

    <#if authorization.resourcesWaitingOthersApproval?size != 0>
		<h3 class="title is-3">${msg("requestsWaitingApproval")}</h3>
        <div class="row">
            <div class="col-md-12">
                <i class="pficon pficon-info"></i> ${msg("havePermissionRequestsWaitingForApproval",authorization.resourcesWaitingOthersApproval?size)}
                <a href="#" onclick="document.getElementById('waitingApproval').style.display=''">${msg("clickHereForDetails")}</a>
                <div class="row">
                    <div class="col-md-12"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"></div>
                </div>
                <div class="row">
                    <div class="col-md-12"></div>
                </div>
                <div class="row" id="waitingApproval" style="display:none">
                    <div class="col-md-12">
                        <form action="${url.resourceUrl}" name="waitingApprovalForm" method="post">
                            <input type="hidden" name="action" value="cancelRequest"/>
                            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                            <table class="table is-striped is-hoverable is-fullwidth">
                                <thead>
                                    <tr>
                                        <th width="5%"><input type="checkbox" onclick="selectAllCheckBoxes('waitingApprovalForm', this, 'resource_id');" <#if authorization.resourcesWaitingOthersApproval?size == 0>disabled="true"</#if></th>
                                        <th>${msg("resource")}</th>
                                        <th>${msg("owner")}</th>
                                        <th>${msg("action")}</th>
                                        <th>${msg("date")}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#list authorization.resourcesWaitingOthersApproval as resource>
                                        <tr>
                                            <td>
                                                <input type="checkbox" name="resource_id" value="${resource.id}"/>
                                            </td>
                                            <td>
                                                <#if resource.displayName??>${resource.displayName}<#else>${resource.name}</#if>
                                            </td>
                                            <td>
                                                <#if resource.owner.email??>${resource.owner.email}<#else>${resource.owner.username}</#if>
                                            </td>
                                            <td>
                                                <ul>
                                                    <#list resource.permissions as permission>
                                                        <#list permission.scopes as scope>
                                                            <li>
                                                                <#if scope.scope??>
                                                                    <#if scope.scope.displayName??>
                                                                        ${scope.scope.displayName}
                                                                    <#else>
                                                                        ${scope.scope.name}
                                                                    </#if>
                                                                <#else>
                                                                    ${msg("anyPermission")}
                                                                </#if>
                                                            </li>
                                                        </#list>
                                                    </#list>
                                                </ul>
                                            </td>
                                            <td>
                                                ${resource.permissions[0].createdDate?datetime}
                                            </td>
                                        </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="col-md-12">
                        <a href="#" onclick="document.forms['waitingApprovalForm'].submit();" type="submit" class="btn btn-danger">${msg("doRemoveRequest")}</a>
                    </div>
                </div>
            </div>
        </div>
    </#if>

</@layout.mainLayout>