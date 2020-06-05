<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

	<h2 class="title is-2">${msg("editAccountHtmlTitle")}</h2>

    <form action="${url.accountUrl}" class="form-horizontal" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">

        <#if !realm.registrationEmailAsUsername>
			<div class="field">
				<div class="control">
					<input type="text" class="input" id="username" name="username" <#if !realm.editUsernameAllowed>disabled="disabled"</#if> value="${(account.username!'')}" placeholder="${msg("username")}">
				</div>
			</div>
        </#if>

		<div class="field">
			<div class="control">
				<input type="text" class="input" id="email" name="email" autofocus value="${(account.email!'')}" placeholder="${msg("email")}">
			</div>
		</div>

		<div class="field">
			<div class="control">
				<input type="text" class="input" id="firstName" name="firstName" value="${(account.firstName!'')}" placeholder="${msg("firstName")}">
			</div>
		</div>

		<div class="field">
			<div class="control">
				<input type="text" class="input" id="lastName" name="lastName" value="${(account.lastName!'')}" placeholder="${msg("lastName")}">
			</div>
		</div>

		<div class="field">
			<div class="control">
				<div class="buttons">
                    <button type="submit" class="button is-link" name="submitAction" value="Save">${msg("doSave")}</button>
                    <button type="submit" class="button" name="submitAction" value="Cancel">${msg("doCancel")}</button>
				</div>
			</div>
		</div>
    </form>

</@layout.mainLayout>
