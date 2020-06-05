<!-- DONE -->
<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <form action="${url.loginAction}" method="post">
			<p style="padding-bottom: 0.75rem;">${msg("emailInstruction")}</p>
			<div class="field">
				<div class="control">
					<#if usernameEditDisabled??>
						<input type="text" id="username" name="username" class="input" autofocus value="${auth.attemptedUsername}"  placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"/>
					<#else>
						<input type="text" id="username" name="username" class="input" autofocus  placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"/>
					</#if>
				</div>
			</div>
            <div class="buttons">
				<input class="button is-primary" type="submit" value="${msg("doSubmit")}"/>
				<a class="button" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
			</div>
        </form>
    </#if>
</@layout.registrationLayout>
