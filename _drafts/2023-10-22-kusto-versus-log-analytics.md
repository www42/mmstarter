---
title: "Kusto versus Log Analytics"
date: 2023-10-22 21:31:07 +02:00
categories:
  - Azure
tags:
  - Kusto
image1: /assets/images/2023-10-22-kusto-versus-log-analytics/Azure-Analytics-Services.png
image2: /assets/images/2023-10-22-kusto-versus-log-analytics/KustoExplorer-Connect-to-LA.png
image3: /assets/images/2023-10-22-kusto-versus-log-analytics/KustoExplorer-Starting.png
---



# Kusto versus LA

## Two different things

<img src="{{ page.image1 | relative_url }}" alt="Azure Analytics Services" width="300"/>


|                   | Kusto | LA  |
| ----------------- | ----- | --- |
| Name              | Azure Data Explorer Cluster <br> ADE Cluster <br> ADX Cluster <br> Kusto Cluster | Log Analytics Workspace |
| Intended purpose  | Batch Data, Streaming Data, Telemetry, IoT, ... | Monitoring, Security (Sentinel) |
| ARM Resource Type | [`Microsoft.Kusto/Clusters`](https://learn.microsoft.com/en-us/azure/templates/microsoft.kusto/clusters?pivots=deployment-language-bicep)  | [`Microsoft.OperationalInsights/workspaces`](https://learn.microsoft.com/en-us/azure/templates/microsoft.operationalinsights/workspaces?pivots=deployment-language-bicep) |
| Cluster URL       | `https://<clusterName>.<region>.kusto.windows.net` | `https://ade.loganalytics.io/<ResourceId>` |





The Cluster URL of an LA workspace is `https://ade.loganalytics.io/<ResourceId>` where the Resource Id is constructed as follows:

```
<ResourceId> = subscriptions/<subscriptionID>/resourcegroups/<resourceGroupName>/providers/microsoft.operationalinsights/workspaces/<workspaceName>
```

Use this little PowerShell function to get the Resource Id of a workspace:

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


## Tools

|                       | Kusto | LA  | Description |
| -------------------   | ----- | --- | ----------- |
| Kusto Explorer        | Yes   | Yes | [OnceClick App](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/tools/kusto-explorer) |
| Azure Data Explorer   | Yes   | Yes | [Web App](https://dataexplorer.azure.com/) |
| Az.Kusto              | ?     | ?   | [PowerShell Module](https://www.powershellgallery.com/packages/Az.Kusto) |
| az kusto              | ?     | ?   | [Azure CLI  Extension](https://github.com/Azure/azure-cli-extensions/tree/main/src/kusto) |
| Jupyter Notebook      | ?     | ?   | [.ipynb](https://jupyter.org/) |
| Polyglot Notebook     | ?     | ?   | [ Polyglot NB in VS Code](https://code.visualstudio.com/docs/languages/polyglot) (fka .NET Interactive Notebooks) |


* Install
* Authenticate
* Connect
* Query


### Fun Facts

* Kusto is reportedly named after [Jacques-Yves Cousteau](https://en.wikipedia.org/wiki/Jacques_Cousteau) [ʒak iv kusto], the well-known French oceanographer and filmmaker.

<img src="{{ page.image3 | relative_url }}" alt="Kusto Explorer Starting" width="300"/>





### Kusto Explorer

 * Connect

Add a Connection with the Cluster URL (Kusto or LA), see above.


<img src="{{ page.image2 | relative_url }}" alt="Kusto Explorer connect to LA" width="300"/>





### Az.Kusto

```powershell
Get-AzKustoCluster | ft Name,Location,State,Uri

$rgName = 'rg-monitoring'
$clusterName = 'adecluster69118'

Get-AzKustoDatabase -ClusterName $clusterName -ResourceGroupName $rgName
```




## Misc


#### SC-200 Learning Path 4 Lab 1

Query an die URL anhängen

```
https://ade.loganalytics.io/subscriptions/<subscriptionID>/resourcegroups/<resourceGroupName>/providers/microsoft.operationalinsights/workspaces/<workspaceName>/search?query=SecurityEvent | where EventID == 4624 | where AccountType == "User" | where LogonType == "2" | where TimeGenerated > ago(1d) | summarize count() by Account, Computer, LogonType | sort by count_ desc
```



## References

[Markus Raatz: Spaß mit KQL und Azure Log Analytics][Markus Raatz]{:target="_blank"}

[Markus Raatz]: https://www.youtube.com/watch?v=ETFNmV6iwxE



[What is Azure Data Explorer? - Microsoft Learn](https://learn.microsoft.com/en-us/azure/data-explorer/data-explorer-overview?WT.mc_id=APC-AzureDataExplorerClusters)

[John Savill - Azure Data Explorer (ADX) Overview - YouTube](https://www.youtube.com/watch?v=2wFC9Kiu6Q8)

[Basic searching and string operators | Kusto King](https://www.kustoking.com/basic-searching-and-string-operators/)

[Polyglot Notebooks: JavaScript LangChain Azure OpenAI — Helmbergers](https://www.helmbergers.com/2023-07-12-polyglot-notebooks-javascript-langchain-azure-openai)

[Helmbergers Let's Code](https://www.unicular.com/helmbergers/)

[REST API overview - Azure Data Explorer | Microsoft Learn](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/api/rest/)

[Azure Data Explorer documentation - Azure Data Explorer | Microsoft Learn](https://learn.microsoft.com/en-us/azure/data-explorer/)

[Query data in Azure Monitor with Azure Data Explorer - Azure Data Explorer | Microsoft Learn](https://learn.microsoft.com/en-us/azure/data-explorer/query-monitor-data)

[Microsofts Polyglot Notebooks: Erweiterung für .NET Interactive in VS Code](https://www.dev-insider.de/microsoft-polyglot-notebooks-erweiterung-net-interactive-a-92c372f360ee80893a443e778d4d9f69/)

[ChatGPT auf Deinen Texten - ein Praxisbeispiel wird gezeigt - YouTube](https://www.youtube.com/watch?v=JTp9b_hH_HM)