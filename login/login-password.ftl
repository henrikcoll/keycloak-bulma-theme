<!-- DONE -->
<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
		<form onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
			<div class="field">
				<div class="control">
					<input class="input is-primary" tabindex="2" name="password" id="password" type="password" autocomplete="off" placeholder="Primary input" placeholder="${msg("password")}">
				</div>
			</div>

			<div class="field">
				<div class="control">
					<#if realm.resetPasswordAllowed>
						<a tabindex="5" class="button" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
					</#if>
				</div>
			</div>
			<input tabindex="4" class="button is-primary" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
		</form>
    </#if>

</@layout.registrationLayout>
