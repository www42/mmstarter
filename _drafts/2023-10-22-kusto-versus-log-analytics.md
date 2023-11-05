---
title: "Kusto und LA Workspaces mit KQL abfragen"
date: 2023-10-22 21:31:07 +02:00
last_modified_at: 2023-11-05 09:59:00 +01:00
categories:
  - Azure
tags:
  - Kusto
  - Log Analytics
  - KQL
classes: wide
image1: /assets/images/2023-10-22-kusto-versus-log-analytics/Azure-Analytics-Services.png
image2: /assets/images/2023-10-22-kusto-versus-log-analytics/KustoExplorer-Connections_and_Query.png
image3: /assets/images/2023-10-22-kusto-versus-log-analytics/KustoExplorer-Starting.png
image4: /assets/images/2023-10-22-kusto-versus-log-analytics/AzureDataExplorer.png
---



# Zwei verschiedene Services

Kusto Cluster (Kusto) und Log Analytics Workspaces (LA) sind zwei verschiedene Big Data Services in Microsoft Azure. Daneben gibt es noch zahlreiche weitere Big Data Lösungen in Azure.

Kusto Cluster heißt seit einiger Zeit Azure Data Explorer Cluster (ADE Cluster). Er wird auch ADX Cluster genannt.

<img src="{{ page.image1 | relative_url }}" alt="Azure Analytics Services" width="1000"/>


Die beiden Services haben unterschiedliche Einsatzzwecke und sind für unterschiedliche Anwendungsfälle optimiert. 

|                   | Kusto | LA  |
| ----------------- | ----- | --- |
| Name              | Kusto Cluster <br> Azure Data Explorer Cluster <br> ADE Cluster <br> ADX Cluster | Log Analytics Workspace |
| Einsatzzweck      | Batch Data Processing <br> Streaming Data  Processing <br> Telemetry <br> IoT | Monitoring <br> Security (Sentinel) |
| ARM Resource Type | [`Microsoft.Kusto/Clusters`](https://learn.microsoft.com/en-us/azure/templates/microsoft.kusto/clusters?pivots=deployment-language-bicep){:target="_blank"}  | [`Microsoft.OperationalInsights/workspaces`](https://learn.microsoft.com/en-us/azure/templates/microsoft.operationalinsights/workspaces?pivots=deployment-language-bicep){:target="_blank"} |
| Cluster URL       | `https://<clusterName>.<region>.kusto.windows.net` | `https://ade.loganalytics.io/<ResourceId>` |


## Cluster URLs

Die Cluster URL (Engine Endpoint) benötigt man, um sich mit Tools auf den Cluster zu verbinden. Die Cluster URL eines LA Workspace ist (siehe Tabelle oben)
```
https://ade.loganalytics.io/<ResourceId>
``` 
wobei die Resource Id wie folgt aus dem Namen des Workspace gebildet werden kann:
```
<ResourceId> = subscriptions/<subscriptionID>/resourcegroups/<resourceGroupName>/providers/microsoft.operationalinsights/workspaces/<workspaceName>
```

Diese Resource ID kann man leicht im Azure Portal finden oder mit PowerShell abfragen:

```powershell
function Get-AzLogAnalyticsWorkspaceResourceId {
    param (
      [Parameter(Mandatory = $true)]
        [string]$ResourceGroupName,
        [Parameter(Mandatory = $true)]
        [string]$WorkspaceName
    )
    $workspace = Get-AzOperationalInsightsWorkspace -ResourceGroupName $ResourceGroupName -Name $WorkspaceName
    $workspace.ResourceId
}
```

## Zwei Cluster zum Ausprobieren

Zum Ausprobieren von KQL stellt Azure einen Kusto Cluster (*Storm Events*) und einen LA Workspace (*LA Demo*) mit Beispieldaten zur Verfügung. Beide Cluster sind kostenlos, Login mit *Work or School Account*.

| Kusto | LA |
| ----- | -- |
| Storm Events | LA Demo |
| [https://help.kusto.windows.net/Samples](https://help.kusto.windows.net/Samples){:target="_blank"} | [https://aka.ms/lademo](https://aka.ms/lademo){:target="_blank"} |

Man kann auch seinen eigenen, [kostenlosen Kusto Cluster anlegen](https://learn.microsoft.com/en-us/azure/data-explorer/start-for-free-web-ui){:target="_blank"}. Um [Data Ingestion](https://learn.microsoft.com/en-us/azure/data-explorer/ingest-data-overview){:target="_blank"} muß man sich dann selber kümmern.



# Tools

## Kusto Explorer

Kusto Explorer ist eine ClickOnce Application für Windows - Linux und MacOS User haben Pech. Installation und User Interface werden [hier](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/tools/kusto-explorer){:target="_blank"} beschrieben.

```powershell
https://aka.ms/ke
```

Die App ist in C# geschrieben und nutzt das [Kusto SDK](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/api/netfx/about-the-sdk){:target="_blank"}.

Man verbindet sich auf einen Cluster (Kusto oder LA) mit der Cluster URL, siehe oben.

<img src="{{ page.image2 | relative_url }}" alt="Kusto Explorer Connections and Query" width="1000"/>



## Azure Data Explorer

Als Web Applikation ist Azure Data Explorer über jeden Browser erreichbar. Das User Interface ist [hier](https://learn.microsoft.com/en-us/azure/data-explorer/web-ui-query-overview){:target="_blank"} beschrieben. Es ähnelt dem Kusto Explorer.

```
https://dataexplorer.azure.com
```

<img src="{{ page.image4 | relative_url }}" alt="Kusto Explorer Connections and Query" width="1000"/>




## Polyglot Notebooks

[Polyglot Notebooks in VS Code](https://code.visualstudio.com/docs/languages/polyglot){:target="_blank"}, früher *.NET Interactive Notebooks* genannt, sind eine Erweiterung Microsofts der bekannten und beliebten Jupyter Notebooks durch Microsoft. In einem Polyglot Notebook können mehrere Sprachen verwendet werden, z.B. C#, PowerShell, JavaScript und eben auch KQL.

Wie Polyglot Notebooks einen passemden Kernel finden wird [in diesem Artikel](https://www.dev-insider.de/microsoft-polyglot-notebooks-erweiterung-net-interactive-a-92c372f360ee80893a443e778d4d9f69/){:target="_blank"} sehr schön beschrieben, einschließlich der Geschichte von iPython und Jupyter seit dem Dreißigjährigen Krieg.

Die Magic Commands sind von Jupyter übernommen und gewöhnungsbedürftig - eben Magic, siehe [hier](https://code.visualstudio.com/docs/languages/dotnet#_magic-commands){:target="_blank"}.




# Fun Fact

Der Kusto Explorer verrät beim Start, wie Kusto zu seinem Namen kam. Kusto ist benannt nach dem bekannten französischen Tiefseeforscher [Jacques-Yves Cousteau](https://en.wikipedia.org/wiki/Jacques_Cousteau){:target="_blank"} [ʒak iv kusto]. Wir erfoschen schließlich auch die Tiefen unserer Daten 🤣.

<img src="{{ page.image3 | relative_url }}" alt="Kusto Explorer Starting" width="400"/>







# References

[Markus Raatz: Spaß mit KQL und Azure Log Analytics](https://www.youtube.com/watch?v=ETFNmV6iwxE){:target="_blank"}

[John Savill: Azure Data Explorer (ADX) Overview](https://www.youtube.com/watch?v=2wFC9Kiu6Q8){:target="_blank"}

[Microsoft Learn: Azure Data Explorer documentation](https://learn.microsoft.com/en-us/azure/data-explorer/){:target="_blank"}

[Microsoft Learn: What is Azure Data Explorer?](https://learn.microsoft.com/en-us/azure/data-explorer/data-explorer-overview?WT.mc_id=APC-AzureDataExplorerClusters){:target="_blank"}

[Microsoft Learn: Query data in Azure Monitor with Azure Data Explorer](https://learn.microsoft.com/en-us/azure/data-explorer/query-monitor-data){:target="_blank"}

[Microsoft Learn: Azure Data Explorer REST API overview](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/api/rest/){:target="_blank"}

[Kusto King: Basic searching and string operators](https://www.kustoking.com/basic-searching-and-string-operators/){:target="_blank"}

[Thomas Drilling: Dynamic Kernel Picker für VS Code Polyglot Notebooks](https://www.dev-insider.de/microsoft-polyglot-notebooks-erweiterung-net-interactive-a-92c372f360ee80893a443e778d4d9f69/){:target="_blank"}
