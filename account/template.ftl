<#macro mainLayout active bodyClass>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>${msg("accountManagementTitle")}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico">
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script type="text/javascript" src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</head>
<body class="admin-console user ${bodyClass}">
	<nav class="navbar is-link" role="navigation" aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item">
				<h1 class="title has-text-white">${msg("accountManagementTitle")}</h1>
			</a>
		</div>
		<div id="navbarBasicExample" class="navbar-menu">
			<div class="navbar-start">
				<#if referrer?has_content && referrer.url?has_content><a class="navbar-item" href="${referrer.url}" id="referrer">${msg("backTo",referrer.name)}</a></#if>
			</div>
			<div class="navbar-end">
			
				<a class="navbar-item" href="${url.logoutUrl}">${msg("doSignOut")}</a>
				<#if realm.internationalizationEnabled  && locale.supported?size gt 1>
					<div class="navbar-item has-dropdown is-hoverable">
						<a class="navbar-link">
							${locale.current}
						</a>

						<div class="navbar-dropdown">
							<#list locale.supported as l>
								<a class="navbar-item" href="${l.url}">
									${l.label}
								</a>
                            </#list>
						</div>
					</div>
				</#if>
			</div>
		</div>
	</nav>
	<section class="section">
		<div class="container">
			<div class="columns is-centered">
				<div class="column is-one-quarter">
					<aside class="menu box">
						<ul class="menu-list">
							<li><a class="<#if active=='account'>is-active</#if>" href="${url.accountUrl}">${msg("account")}</a></li>
							<#if features.passwordUpdateSupported><li><a class="<#if active=='password'>is-active</#if>" href="${url.passwordUrl}">${msg("password")}</a></li></#if>
							<li><a class="<#if active=='totp'>is-active</#if>" href="${url.totpUrl}">${msg("authenticator")}</a></li>
							<#if features.identityFederation><li><a class="<#if active=='social'>is-active</#if>" href="${url.socialUrl}">${msg("federatedIdentity")}</a></li></#if>
							<li><a class="<#if active=='sessions'>is-active</#if>" href="${url.sessionsUrl}">${msg("sessions")}</a></li>
							<li><a class="<#if active=='applications'>is-active</#if>" href="${url.applicationsUrl}">${msg("applications")}</a></li>
							<#if features.log><li><a class="<#if active=='log'>is-active</#if>" href="${url.logUrl}">${msg("log")}</a></li></#if>
							<!--<#if realm.userManagedAccessAllowed && features.authorization><li><a class="<#if active=='authorization'>is-active</#if>" href="${url.resourceUrl}">${msg("myResources")}</a></li></#if>-->
						</ul>
					</aside>
				</div>
				<div class="column is-four-fifths">
					<div class="box">
						<#if message?has_content>
							<#if message.type = 'success'>
								<div class="notification is-success">${kcSanitize(message.summary)?no_esc}</div>
							</#if>
							<#if message.type = 'warning'>
								<div class="notification is-warning">${kcSanitize(message.summary)?no_esc}</div>
							</#if>
							<#if message.type = 'error'>
								<div class="notification is-danger">${kcSanitize(message.summary)?no_esc}</div>
							</#if>
							<#if message.type = 'info'>
								<div class="notification is-info">${kcSanitize(message.summary)?no_esc}</div>
							</#if>
						</#if>
						<#nested "content">
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
</#macro>