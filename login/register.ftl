<!-- DONE -->
<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
			<div class="field">
				<div class="control">
					<input class="input" id="firstName" name="firstName" type="text" placeholder="${msg("firstName")}" value="${(register.formData.firstName!'')}">
				</div>
			</div>
			<div class="field">
				<div class="control">
					<input class="input" id="lastName" name="lastName" type="text" placeholder="${msg("lastName")}" value="${(register.formData.lastName!'')}">
				</div>
			</div>
			<div class="field">
				<div class="control">
					<input class="input" id="email" name="email" type="text" placeholder="${msg("email")}" value="${(register.formData.email!'')}" autocomplete="email">
				</div>
			</div>

			<#if !realm.registrationEmailAsUsername>
				<div class="field">
					<div class="control">
						<input class="input" id="username" name="username" type="text" placeholder="${msg("username")}" value="${(register.formData.username!'')}">
					</div>
				</div>
			</#if>

			<div class="field">
				<div class="control">
					<input class="input" id="password" name="password" type="password" placeholder="${msg("password")}" autocomplete="new-password">
				</div>
			</div>

            <#if passwordRequired??>
				<div class="field">
					<div class="control">
						<input class="input" id="password-confirm" name="password-confirm" type="password" placeholder="${msg("passwordConfirm")}" autocomplete="new-password">
					</div>
				</div>
            </#if>

            <!--<#if recaptchaRequired??>
				<div class="field">
					<div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
				</div>
            </#if>-->

			<div class="buttons">
				<input class="button is-primary" type="submit" value="${msg("doRegister")}"/>
				<a class="button" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
			</div>
        </form>
    </#if>
</@layout.registrationLayout>
