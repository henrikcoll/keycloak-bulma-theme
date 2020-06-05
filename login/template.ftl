<!-- DONE -->
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body>
	<nav class="navbar is-dark" role="navigation" aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item">
				<h1 class="title has-text-white">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</h1>
			</a>
		</div>
		<div id="navbarBasicExample" class="navbar-menu">
			<div class="navbar-end">
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
				<div class="column is-two-fifths">
					<div class="box">
						<h1 class="title"><#nested "header"></h1>
						<#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
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
						<#nested "form">
						<div id="kc-info" class="${properties.kcSignUpClass!}">
                  			<div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      			<#nested "info">
                  			</div>
              			</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
</#macro>
