<!-- DONE -->
<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
        <form action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
				<div class="field">
					<div class="control">
						<input class="input" placeholder="${msg("username")}" type="text" id="username" name="username" value="${(user.username!'')}">
					</div>
				</div>
            </#if>
			<div class="field">
				<div class="control">
					<input type="text" id="email" name="email" value="${(user.email!'')}" class="input" placeholder="${msg("email")}">
				</div>
			</div>

			<div class="field">
				<div class="control">
					<input type="text" id="firstName" name="firstName" value="${(user.firstName!'')}" class="input" placeholder="${msg("firstName")}">
				</div>
			</div>

			<div class="field">
				<div class="control">
					<input type="text" id="lastName" name="lastName" value="${(user.lastName!'')}" class="input" placeholder="${msg("lastName")}">
				</div>
			</div>

			<div class="field">
				<div class="control">
					<#if isAppInitiatedAction??>
						<div class="buttons">
							<input class="button is-primary" type="submit" value="${msg("doSubmit")}" />
							<button class="button" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
						</div>
                    <#else>
                    	<input class="button is-primary" type="submit" value="${msg("doSubmit")}" />
                    </#if>
				</div>
			</div>
        </form>
    </#if>
</@layout.registrationLayout>
