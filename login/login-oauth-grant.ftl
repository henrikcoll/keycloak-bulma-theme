<!-- DONE -->
<#import "template.ftl" as layout>
<@layout.registrationLayout bodyClass="oauth"; section>
    <#if section = "header">
        <#if client.name?has_content>
            ${msg("oauthGrantTitle",advancedMsg(client.name))}
        <#else>
            ${msg("oauthGrantTitle",client.clientId)}
        </#if>
    <#elseif section = "form">
        <div id="kc-oauth" class="content">
            <h3>${msg("oauthGrantRequest")}</h3>
            <ul>
                <#if oauth.clientScopesRequested??>
                    <#list oauth.clientScopesRequested as clientScope>
                        <li>
                            <span>${advancedMsg(clientScope.consentScreenText)}</span>
                        </li>
                    </#list>
                </#if>
            </ul>

            <form class="form-actions" action="${url.oauthAction}" method="POST">
                <input type="hidden" name="code" value="${oauth.code}">
				<input class="button is-success" name="accept" id="kc-login" type="submit" value="${msg("doYes")}"/>
				<input class="button is-danger" name="cancel" id="kc-cancel" type="submit" value="${msg("doNo")}"/>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>
