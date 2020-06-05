<!-- DONE -->
<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
				<div class="field">
					<div class="control">
						<#if usernameEditDisabled??>
							<input tabindex="1" class="input" id="username" name="username" type="text" value="${(login.username!'')}" disabled>
						<#else>
							<input tabindex="1" class="input" id="username" name="username" type="text" value="${(login.username!'')}" autofocus autocomplete="off" placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>">
						</#if>
					</div>
				</div>
				<div class="field">
					<div class="control">
						<input tabindex="2" id="password" class="input" name="password" type="password" autocomplete="off" placeholder="${msg("password")}"/>
					</div>
				</div>
				<#if realm.rememberMe && !usernameEditDisabled??>
					<div class="field">
						<div class="control">
							<label class="checkbox">
								<#if login.rememberMe??>
									<input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
								<#else>
									<input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
								</#if>
								${msg("rememberMe")}
							</label>
						</div>
					</div>
				</#if>
				<div class="buttons">
					<input tabindex="4" class="button is-primary" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
					<#if realm.resetPasswordAllowed>
						<a class="button" tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a><br>
					</#if>
					<#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
						<a class="button" tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>
					</#if>
				</div>
				<#if realm.password && social.providers??>
					<div class="is-divider"></div>
					<div class="buttons">
						<#list social.providers as p>
							<a href="${p.loginUrl}" id="zocial-${p.alias}" class="button zocial ${p.providerId}"> <span>${p.displayName}</span></a>
						</#list>
					</div>
				</#if>
				<input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
            </form>
        </#if>
    </#if>

</@layout.registrationLayout>
