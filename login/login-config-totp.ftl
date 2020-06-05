<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayRequiredFields=true; section>

    <#if section = "header">
        ${msg("loginTotpTitle")}

    <#elseif section = "form">
	<div class="content">
		<ol>
			<li>
				<p>${msg("loginTotpStep1")}</p>

				<ul>
					<#list totp.policy.supportedApplications as app>
					<li>${app}</li>
					</#list>
				</ul>
			</li>

			<#if mode?? && mode = "manual">
				<li>
					<p>${msg("loginTotpManualStep2")}</p>
					<p><span>${totp.totpSecretEncoded}</span></p>
					<p><a href="${totp.qrUrl}" id="mode-barcode">${msg("loginTotpScanBarcode")}</a></p>
				</li>
				<li>
					<p>${msg("loginTotpManualStep3")}</p>
					<p>
						<ul>
							<li>${msg("loginTotpType")}: ${msg("loginTotp." + totp.policy.type)}</li>
							<li>${msg("loginTotpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
							<li>${msg("loginTotpDigits")}: ${totp.policy.digits}</li>
							<#if totp.policy.type = "totp">
								<li>${msg("loginTotpInterval")}: ${totp.policy.period}</li>
							<#elseif totp.policy.type = "hotp">
								<li>${msg("loginTotpCounter")}: ${totp.policy.initialCounter}</li>
							</#if>
						</ul>
					</p>
				</li>
			<#else>
				<li>
					<p>${msg("loginTotpStep2")}</p>
					<img src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
					<p><a href="${totp.manualUrl}" id="mode-manual">${msg("loginTotpUnableToScan")}</a></p>
				</li>
			</#if>
			<li>
				<p>${msg("loginTotpStep3")}</p>
				<p>${msg("loginTotpStep3DeviceName")}</p>
			</li>
		</ol>
	</div>

    <form action="${url.loginAction}" method="post">
		<div class="field">
			<div class="control">
				<input type="text" id="totp" name="totp" autocomplete="off" class="input is-danger" placeholder="${msg("authenticatorCode")}" />
				<input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
			</div>
		</div>
		<div class="field">
			<div class="control">
				<#if totp.otpCredentials?size gte 1>
					<input class="input is-warning" type="text" placeholder="${msg("loginTotpDeviceName")}">
				<#else>
					<input class="input" type="text" placeholder="${msg("loginTotpDeviceName")}">
				</#if>
			</div>
		</div>
		<div class="field">
			<div class="control">
				<#if isAppInitiatedAction??>
					<div class="buttons">
						<input type="submit"
							class="button is-primary"
							id="saveTOTPBtn" value="${msg("doSubmit")}"
						/>
						<button type="submit"
								class="button"
								id="cancelTOTPBtn" name="cancel-aia" value="true" />${msg("doCancel")}
						</button>
					</div>
				<#else>
					<input type="submit"
						class="button is-primary"
						id="saveTOTPBtn" value="${msg("doSubmit")}"
					/>
				</#if>
			</div>
		</div>
    </form>
    </#if>
</@layout.registrationLayout>
