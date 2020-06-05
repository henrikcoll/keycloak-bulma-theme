<#import "template.ftl" as layout>
<@layout.mainLayout active='password' bodyClass='password'; section>
	<h2 class="title is-2">${msg("changePasswordHtmlTitle")}</h2>

    <form action="${url.passwordUrl}" class="form-horizontal" method="post">
        <input type="text" id="username" name="username" value="${(account.username!'')}" autocomplete="username" readonly="readonly" style="display:none;">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if password.passwordSet>
			<div class="field">
				<div class="control">
					<input type="password" class="input" id="password" name="password" autofocus autocomplete="current-password" placeholder="${msg("password")}">
				</div>
			</div>
        </#if>

		<div class="field">
			<div class="control">
				<input type="password" class="input" id="password-new" name="password-new" autocomplete="new-password" placeholder="${msg("passwordNew")}">
			</div>
		</div>

		<div class="field">
			<div class="control">
				<input type="password" class="input" id="password-confirm" name="password-confirm" autocomplete="new-password" placeholder="${msg("passwordConfirm")}">
			</div>
		</div>

		<div class="field">
			<div class="control">
				<button type="submit" class="button is-link" name="submitAction" value="Save">${msg("doSave")}</button>
			</div>
		</div>
    </form>

</@layout.mainLayout>
