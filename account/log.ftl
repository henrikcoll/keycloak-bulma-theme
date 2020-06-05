<#import "template.ftl" as layout>
<@layout.mainLayout active='log' bodyClass='log'; section>
	<h2 class="title is-2">${msg("accountLogHtmlTitle")}</h2>

    <table class="table is-striped is-hoverable is-fullwidth">
        <thead>
			<tr>
				<td>${msg("date")}</td>
				<td>${msg("event")}</td>
				<td>${msg("ip")}</td>
				<td>${msg("client")}</td>
				<td>${msg("details")}</td>
			</tr>
        </thead>

        <tbody>
        <#list log.events as event>
            <tr>
                <td>${event.date?datetime}</td>
                <td>${event.event}</td>
                <td>${event.ipAddress}</td>
                <td>${event.client!}</td>
                <td><#list event.details as detail>${detail.key} = ${detail.value} <#if detail_has_next>, </#if></#list></td>
            </tr>
        </#list>
        </tbody>

    </table>

</@layout.mainLayout>