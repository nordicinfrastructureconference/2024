# Azure Copilot Demo Prompts

As demonstrated at NIC Empower 2024 by Morten Knudsen and Jan Vidar Elven, a collection of Azure Copilot prompts.

## Keep in mind – current limitation

* You can only make 15 requests during any given chat, and you only have 10 chats in a 24 hour period
* Any action taken on more than 10 resources must be performed outside of Microsoft Copilot in Azure
* Some responses that display lists will be limited to the top five items.
* For some tasks and queries, using a resource's name will not work, and the Azure resource ID must be provided.
* Microsoft Copilot in Azure is currently available in English only

## Demo #1: Learn about Azure (Documentation)

(You can use both Microsoft Copilot and Azure Copilot)

```bash
What are the benefits and applications of Azure API Management?
How can I process real-time events in my application with Azure?
Outline steps to secure Azure Blob Storage with private endpoints and Azure Private Link
```

## Demo #2: Understand your Azure environment

Azure Resource Graph

```bash
Which VMs are running right now?
Show all VMs with Tag Environment = Prod
```

ARG – Policies

```bash
Which resources are non-compliant?
What policies are causing non-compliance?
```

Changes

```bash
Show resources that have been created or modified in the last 7 days
  Vs
List resources that have been created or modified in the last 7 days
```

Hallucination 😊

```bash
Please create script to show all changes during the last week
```

## Demo #3: Work smarter with Azure services

Azure Portal

```bash
Change my theme to dark mode
```

Storage Account

```bash
Does this storage account follow security best practices?

please enable point in time restore
```

Defender for Cloud

Recommendations:

```bash
Show risks for publicly exposed resources - Summarize with copilot + Apply filter
Show risks for critical resources - summarize with copilot
```

Azure Monitor

```bash
Give me a chart of OS disk latency statistics for the last week for vm mgmt1
Show me the CPU utilization trend over the past 24 hours for my VM dc1
Show me the disk write IOPS for my VM dc3 this week
```

Azure Monitor Investigator (Preview)

```bash
Had an alert in my domain controllers run an anomaly investigation for me on dc1
```

Azure Monitor Alerts

```bash
Show me all alerts triggered during the last 24 hours
Please summarize the azure monitor alerts I have received in the last 7 days
```

Missing backup

```bash
Show me all azure storage accounts where backup has not been configured
```

NOTE: Result: inaccurate response !!!

Execute commands

```bash
based on all subscriptions, please restart my VMs that have the tag 'Environment' = Prod

please create an azure monitor alert rule that sends an alert if the cpu reaches 60%
```

## Demo #4: Write and optimize code

Powershell

```bash
How to back up an Azure SQL single database to an Azure storage container using Azure PowerShell?
Help me write a PS script where after creating VM, deploy an AKS cluster on it.
How can I create a new resource group using PowerShell?
```

Azure CLI

```bash
I want to use Azure CLI to deploy and manage AKS using a private service endpoint
Create a virtual network with two subnets using the address space of 10.0.0.0/16 using az cli
How do I list all my VMs using Azure CLI?
```

## Demo #5: Case - Web Developer

```bash
please create an azure cli script to deploy an app-service in Norway East. App-service plan must be named appnic2024demo and use runtime php 8.3 and run on linux. I need to have the app service plan must be free. App service should be placed in resource group rg-demo-nic2024. Workers should be extra small. WebApp should be named WebAppNic2024demo
```

## Demo #5a: Case - Web Developer with Github Copilot for Azure with Codespaces

[SOURCE](https://github.com/JanVidarElven/github-copilot-for-azure-demo)

## Demo #6: Case - IT Administrator – Azure App Service – Troubleshooting

```bash
my users are telling web app scepman is performing slow. can you troubleshoot performance issues with the app and tell why it is slow
```

(takes 2-3 min)

```bash
can you confirm if there is a high CPU issue with my web app
please help me with recommendations on how to improve CPU performance on my app services?
Collect memory dump
I heard of auto-healing on azure app services. Should I enable auto heal on my web app?
What does this error mean for my Azure web app?
Service Health
Is there any outage or issues in Azure impacting me right now?
```

## Demo #7 – FinOps case

Cost Management

```bash
How does our cost this month compare to last months
Forecast my cost for the next 3 months
What's our Azure credits balance?
```

Cost / Resource Management

```bash
Please show all unattached disks in my environment – and create a script to delete them
Help me create a cost-efficient virtual machine
```

## Demo #8 – Case Learn – Web developer – Microsoft Copilot or Azure Copilot

```bash
I need to deploy the best solution to protect a new app service. Solution must include an application firewall that scans traffic from the internet targeted for my app service. The solution must be regional based only. Please create a script to deploy the solution
my app service must now scale globally. please explain all available global app service protection solutions that are available to protect my app service when it is global
please explain which solution is the cheapest - and contains the most security protections?
please show me examples of decision trees for compute and database choices in azure
```

## Demo #9 – Case Learn – IT Administrator – Microsoft Copilot or Azure Copilot

```bash
I have heard about Azure Storage Account has a SFTP feature, so you customers can upload files, but I'm curious to understand why Microsoft chose SFTP instead of FTPS – and understand the differences?
Which azure sql design options like sql database, managed instance or hyperscale provides the best availability. Solution must be based on PaaS. Include the guaranteed SLA
Which of the proposed solutions are the cheapest compared with the best availability?
```

## Demo #10 – Microsoft M365 Copilot

```bash
Please create a presentation where you are explaining about Azure Storage Account. Presentation must address the feature SFTP and show examples of how you can use SFTP to exchange files from customers and partners. Presentation must explain why the security is based on SFTP and the recommended baseline settings.
```
