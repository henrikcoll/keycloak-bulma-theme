<#import "template.ftl" as layout>
<@layout.mainLayout active='social' bodyClass='social'; section>
	<h2 class="title is-2">${msg("federatedIdentitiesHtmlTitle")}</h2>

    <div>
		<#list federatedIdentity.identities as identity>
			<div class="field is-grouped">
				<div class="field-label is-normal">
					<label class="label">${identity.displayName!}</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control is-expanded">
							<input disabled="true" class="input" value="${identity.userName!}">
						</p>
					</div>
					<div class="field">
						<p class="control">
							<#if identity.connected>
								<#if federatedIdentity.removeLinkPossible>
									<form action="${url.socialUrl}" method="post" class="form-inline">
										<input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
										<input type="hidden" id="action" name="action" value="remove">
										<input type="hidden" id="providerId" name="providerId" value="${identity.providerId!}">
										<button id="remove-link-${identity.providerId!}" class="button is-danger">${msg("doRemove")}</button>
									</form>
								</#if>
							<#else>
								<form action="${url.socialUrl}" method="post" class="form-inline">
									<input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
									<input type="hidden" id="action" name="action" value="add">
									<input type="hidden" id="providerId" name="providerId" value="${identity.providerId!}">
									<button id="add-link-${identity.providerId!}" class="button is-link">${msg("doAdd")}</button>
								</form>
							</#if>
						</p>
					</div>
				</div>
			</div>
		</#list>
    </div>

</@layout.mainLayout>
