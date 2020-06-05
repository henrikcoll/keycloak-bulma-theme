<#import "template.ftl" as layout>
    <@layout.registrationLayout; section>
        <#if section="header">
            ${msg("doLogIn")}
            <#elseif section="form">
                <form action="${url.loginAction}" method="post">
                    <!--<#if otpLogin.userOtpCredentials?size gt 1>
                        <div class="${properties.kcFormGroupClass!}">
                            <div class="${properties.kcInputWrapperClass!}">
                                <#list otpLogin.userOtpCredentials as otpCredential>
                                    <div class="${properties.kcSelectOTPListClass!}">
                                    <input type="hidden" value="${otpCredential.id}">
                                        <div class="${properties.kcSelectOTPListItemClass!}">
                                            <span class="${properties.kcAuthenticatorOtpCircleClass!}"></span>
                                            <h2 class="${properties.kcSelectOTPItemHeadingClass!}">
                                                ${otpCredential.userLabel}
                                            </h2>
                                        </div>
                                    </div>
                                </#list>
                            </div>
                        </div>
                    </#if>-->
					<div class="field">
						<div class="control">
							<input class="input" id="otp" name="otp" autocomplete="off" type="text" placeholder="${msg("loginOtpOneTime")}">
						</div>
					</div>

					<div class="field">
						<div class="control">
							<input class="button is-primary" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}">
						</div>
					</div>
                </form>
            <!--<script type="text/javascript" src="${url.resourcesPath}/node_modules/jquery/dist/jquery.min.js"></script>
            <script type="text/javascript">
            $(document).ready(function() {
                // Card Single Select
                $('.card-pf-view-single-select').click(function() {
                  if ($(this).hasClass('active'))
                  { $(this).removeClass('active'); $(this).children().removeAttr('name'); }
                  else
                  { $('.card-pf-view-single-select').removeClass('active');
                  $('.card-pf-view-single-select').children().removeAttr('name');
                  $(this).addClass('active'); $(this).children().attr('name', 'selectedCredentialId'); }
                });

                var defaultCred = $('.card-pf-view-single-select')[0];
                if (defaultCred) {
                    defaultCred.click();
                }
              });
            </script>-->
        </#if>
        </@layout.registrationLayout>