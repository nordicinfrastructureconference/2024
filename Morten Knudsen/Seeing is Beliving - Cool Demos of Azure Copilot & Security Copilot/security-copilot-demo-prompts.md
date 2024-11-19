# Security Copilot Demo Prompts

As demonstrated at NIC Empower 2024 by Morten Knudsen and Jan Vidar Elven, a collection of Security Copilot prompts. Some of these prompts needs context explained in session, but left here for reference.

## Introduction

### Deploy Capacity

Azure Portal / Capacity

* Show Copilot for Security Capacity

Standalone version

* Show Plug-ins
* Show System Capabilities – Available Queries

### Copilot for Security Scalable Capacity Management

The following Excel and PowerShell script based "Copilot for Security Scalable Capacity Management for non-24×7 SOC scenario" solution developed by Morten Knudsen can be used for automating provisioning and scaling of SCU's:

[https://mortenknudsen.net/?p=3026](https://mortenknudsen.net/?p=3026)

### Deploy with Azure Pipelines

The following Azure DevOps pipeline can be used to create and scale up, and destroy or scale down SCU's, developed by Jan Vidar Elven:

[https://gist.github.com/JanVidarElven/11560f80895f577e4c4027faed95cc5a](https://gist.github.com/JanVidarElven/11560f80895f577e4c4027faed95cc5a)

## Security Copilot - Embedded Version

### Embedded Demo #1 - Entra ID – Risky User

[https://entra.microsoft.com/#view/Microsoft_AAD_IAM/RiskyUsersBlade](https://entra.microsoft.com/#view/Microsoft_AAD_IAM/RiskyUsersBlade)

### Embedded Demo #2 - Defender XDR – Security Incident

Important – we can take actions

### Embedded Demo #3 - Defender XDR - Script Analysis
  
Run script analysis embedded in alerts.

### Embedded Demo #4 - Defender XDR - Threat Intelligence

Threat Intelligence integration (portal):

Threats Analytics -> choose “Technique Profile: Antivirus tampering”

### Embedded Demo #5 – Intune

Device info, compare device, policy information and more.

### Embedded Demo #6 - Defender for Cloud

How can I secure my storage accounts ?

## Security Copilot - Standalone Version

### Standalone Demo #1 - Entra ID Sign-in

```bash
What is GuessWhoIam@2linkit.net sign-in history?

Are there any failed sign-in attempts during last 3 days? If so, what are the details?

What applications has the user accessed during these sign-in events?

Show hwo we can make a prompt book
```

### Standalone Demo #2 - Entra ID User Sign-in Analysis (promptbook)

Run via promptbook “Entra ID User Sign-in Analysis”

```bash

What is GuessWhoIam@2linkit.net sign-in history?
Are there any failed sign-in attempts? If so, what are the details?
What applications has the user accessed during these sign-in events?
What device(s) has the user used for these sign-ins? Are these devices compliant and managed?
What is the sign-in location and IP address used for sign-in?
What is the risk level during sign-in? Are there any detected risk events?
Does the user's sign-in satisfy the Multi-Factor Authentication (MFA) requirement?
What specific conditional access policies were applied during these sign-in events
When did the user last change their password?
Can you summarize the above investigation and provide a conclusion and recommendation
```

### Standalone Demo #3 - Defender XDR - Phishing Mail

Email Header Analysis (promptbook):

```bash
1. Can you triage the email header below and point out what you find suspicious? <emailheaders>
2. Can you list all the technical indicators in the above prompt that we can use for an investigation process
3. Return the reputation for all the domains in the list
4. Return the reputation for all the IP addresses in the list
5. Can you check if there any threat articles associated with any of the Domains or IPS from the list above
6. What about the sender and return path emails are they associated with any intelligence articles
7. Based on the email title, check if this email sent to other users?
8. Hunt my environment and determine if any of the users clicked any URL in the email above
9. Based on the above email investigation, summarize this investigation with all the investigation steps taken during this session. Also share supported evidence and let me know if this is a phishing email with certainty percentage: if the email is not suspicious give it 0-30% if it medium suspicious for phishing give it 30%-74% and if its high suspicious as phishing give it 75%-100%. Always include suspicious certainty percentage
```

#### More samples

[https://github.com/Azure/Copilot-For-Security/blob/main/Promptbook%20samples/Email%20header%20analysis%20and%20investigation%20Promptbook.md](https://github.com/Azure/Copilot-For-Security/blob/main/Promptbook%20samples/Email%20header%20analysis%20and%20investigation%20Promptbook.md)

### Standalone Demo #4 - Defender XDR – Security Incident

#### Incident Prioritization (prompt)

```bash
Give me the top 5 high severity incidents from Microsoft Defender XDR that I should prioritize today. Include the incident id and description. If there are not high severity incidents, give me the top medium severity incidents effecting the most users
```

#### Incident Summary - impact, recommendations (Prompt)

```bash
please create an incident summary for incident 2328 in defender
```

#### Investigation (prompt)

```bash
For the users involved in 2328, can you give me details about any risky user sign-ins in the past week?
Can you tell me if there are any other suspicious activities involving the user?
Can you summarize your findings about the user's suspicious activities including the incident it was involved in? Please include any indicators or vulnerabilities that were mentioned.
Can you give me a list of prioritized recommendations that I can do to remove the threat the user introduced in the network?
```

### Standalone Demo #5 – Defender XDR - Suspicious Script Analysis

```bash
Run promptbook “Suspicious script analysis”
```

### Standalone Demo #6 - Defender XDR - Threat Intelligence

#### Threat Intelligence integration (Prompt)

```bash
Summarize the latest threat intelligence report on ransomware attacks targeting the energy sector in Denmark, highlighting key indicators of compromise and suggested defence strategies
```

#### Threat Bulletins (Prompts)

```bash
Share the latest Threat articles published in the last 7 days in a table format
If there is any CVEs sighted in these articles, please provide a summary of these CVEs and sight the technologies impacted
Summarize the following articles and consolidate them in a Threat Bulletin format Named Threat bulletin with the current date. In the bulletin ensure to capture all details including the title summary, link, created date, also highlight the action items the Team should prioritize in relation to these article
```

### Standalone Demo #7 - Intune

#### Device Overview (Prompt)

```bash
Could you give me the total number of devices in Intune?
```

#### Compliance Overview (Prompt)

```bash
List all devices that are non-compliant with our security policies
```

#### Policy Management / Policy Impact (Prompt)

```bash
Summarize the impact of the ‘Windows Hello for Business cloud Kerberos trust’ policy on our laptops
Which devices are affected by the ‘Windows Hello for Business cloud Kerberos trust’ policy?
Create a policy that blocks users from using any removable storage devices on Windows 11 laptops
```

### Standalone Demo #8 - Kusto Query

#### KQL Query (Prompt)

```bash
please create query to detect all usb activities in device strv-mok-lt-03
Generate a KQL query that I can use to create a Microsoft Sentinel Analytics Rule that alerts when a user logs in unsuccessfully more than 20 times in an hour and then logs in successfully. Also give me instructions on how to create the Analytics Rules
```

### Standalone Demo #9 – External Source

#### External Source (Prompt)

```bash
Use public URL https://mortenknudsen.net/?p=3163 and supply a summary of the workarounds for the reported Crowdstrike issue.
```

### Standalone Demo #10 – Custom Plug-in

#### Custom plug-in (KQL)

Fork and Clone to local repository from [public GitHub repository for custom Security Copilot plug-ins](https://github.com/JanVidarElven/copilot-for-security-plugins), or download kql-sentinel-copilot-activity.yaml directly. Change settings valies for tenant id, subscription id, resource group name and log analytics workspace name.

Import as file upload for Custom Plugin.

#### Custom plug-in (Prompt)

```bash
Summarize Copilot for Security activity in the last 3 days
Who created a new SCU in the last week?
```

#### Custom Plug-in (Graph API)

Add YAML file source from Jan Vidar’s [public GitHub repository for custom Security Copilot plug-ins](https://github.com/JanVidarElven/copilot-for-security-plugins)

[https://raw.githubusercontent.com/JanVidarElven/copilot-for-security-plugins/refs/heads/main/graph-api-conditionalaccess-demo/graph-api-ca-plugin.yaml](https://raw.githubusercontent.com/JanVidarElven/copilot-for-security-plugins/refs/heads/main/graph-api-conditionalaccess-demo/graph-api-ca-plugin.yaml)

#### Custom Plug-in (Prompt)

```bash
List all Conditional Access Policies
List conditional access policies that require MFA as action
```

### Standalone Demo #11 – LogicApp Connector – Threat Intelligence

Promptbook “Threat Intelligence Overview”

Configure LogicApp with Actions for Security Copilot and using Promptbook or Prompt to implement your own logic.
