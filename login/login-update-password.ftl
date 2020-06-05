<!-- DONE; NOT TESTED -->
<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <form action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

			<div class="field">
				<div class="control">
					<input type="password" id="password-new" name="password-new" class="input" autofocus autocomplete="new-password" placeholder="${msg("passwordNew")}">
				</div>
			</div>
			<div class="field">
				<div class="control">
					<input type="password" id="password-confirm" name="password-confirm" class="input" autofocus autocomplete="new-password" placeholder="${msg("passwordNew")}">
				</div>
			</div>

			<#if isAppInitiatedAction??>
				<input class="button is-primary" type="submit" value="${msg("doSubmit")}" />
				<button class="button" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
			<#else>
                    <input class="button is-primary" type="submit" value="${msg("doSubmit")}" />
			</#if>
        </form>
    </#if>
</@layout.registrationLayout>
