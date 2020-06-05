<!-- DONE -->
<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        ${msg("termsTitle")}
    <#elseif section = "form">
    <div id="kc-terms-text">
        ${kcSanitize(msg("termsText"))?no_esc}
    </div>
    <form class="form-actions" action="${url.loginAction}" method="POST">
        <input class="button is-success" name="accept" id="kc-accept" type="submit" value="${msg("doAccept")}"/>
        <input class="button is-danger" name="cancel" id="kc-decline" type="submit" value="${msg("doDecline")}"/>
    </form>
    </#if>
</@layout.registrationLayout>
