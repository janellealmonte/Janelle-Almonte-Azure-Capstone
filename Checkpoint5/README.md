# Checkpoint5 Submission ✔️

- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents 📚
1. [Part A - Creating Resources in Azure Portal](#part-a---creating-resources-in-azure-portal)
2. [Part B - Working with `az lab` CLI command](#part-b---working-with-az-lab-cli-command)
3. [Part C - Creating VMs using Azure Resource Manager (ARM) & Custom Images](#part-c---creating-vms-using-azure-resource-manager-arm--custom-images)
4. [Part D - Azure Cost Analysis Charts](#part-d---azure-cost-analysis-charts)

### Part A - Creating Resources in Azure Portal

**DevTest Labs Overview**

![DevTestLab](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/devtestlab.PNG)

**Devtest Labs Settings**

![Lab Settings](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/devtestlab_labsettingsPNG.png)

**DevTest Marketplace**

![Marketplace Image](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/marketplace%20images.png)

**DevTest Lab Virtual Networks**

![DevTest Lab VNET](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/devtestlab_virtualnetwork.PNG)

**DevTest Lab VM Per User**

![VM Per User](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/devtestlab_VMperuser.png)

**DevTest Lab VM Per Lab**

![VM Per Lab](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/devtestlab_VMperlab.png)

**WC-110**

![WC-110](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/WC-110.png)

**LR-110**

![LR-110](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/LR-110.png)

**WS-110**

![WS-110](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/WS-110.png)

**LS-110**

![LS-110](https://github.com/144525201-myseneca/CSN400-Capstone/blob/b316011b5ee597471711720d13b47b853ca1c7f3/Checkpoint5/cp5-ss/LS-110.png)

### Part B - Working with `az lab` CLI command

- [devtest_lab.json](https://github.com/144525201-myseneca/CSN400-Capstone/blob/52e875800c35db113b851255f18d1bd952c915e8/Checkpoint5/Part_B/devtest_lab.json)

- [custom_images.tbl](https://github.com/144525201-myseneca/CSN400-Capstone/blob/52e875800c35db113b851255f18d1bd952c915e8/Checkpoint5/Part_B/custom_images.tbl)

- [lab_vnets.tbl](https://github.com/144525201-myseneca/CSN400-Capstone/blob/52e875800c35db113b851255f18d1bd952c915e8/Checkpoint5/Part_B/lab_vnets.tbl)

- [lab_vm.tbl](https://github.com/144525201-myseneca/CSN400-Capstone/blob/52e875800c35db113b851255f18d1bd952c915e8/Checkpoint5/Part_B/lab_vm.tbl)


```json
{
"name": "CSN400-110"
}
```

### Part C - Creating VMs using Azure Resource Manager (ARM) & Custom Images

**Custom Images Created**

![Custom Images](https://github.com/144525201-myseneca/CSN400-Capstone/blob/7d62111ecd69292bf681fc53b879096bbb05c1b6/Checkpoint5/cp5-ss/Custom_Images.png)

**Custom Images - .json**

```json
[
  {
    "author": "odl_user_846404@seneca-csn400ndd.cloudlabs.ai",
    "creationDate": "2023-02-10T05:18:55.495996+00:00",
    "customImagePlan": null,
    "dataDiskStorageInfo": null,
    "description": "Tasks Completed\nNo connection, no setup",
    "id": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.devtestlab/labs/csn400-110/customimages/ws-img-v01",
    "isPlanAuthorized": null,
    "location": null,
    "managedImageId": null,
    "managedSnapshotId": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/ws-img-v01",
    "name": "WS-img-v01",
    "provisioningState": "Succeeded",
    "resourceGroup": "student-rg-846404",
    "tags": null,
    "type": "Microsoft.DevTestLab/labs/customImages",
    "uniqueIdentifier": "cbe3cb1b-3c39-4c51-8946-d859983465d5",
    "vhd": null,
    "vm": {
      "linuxOsInfo": null,
      "sourceVmId": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.devtestlab/labs/csn400-110/virtualmachines/ws-110",
      "windowsOsInfo": {
        "windowsOsState": "NonSysprepped"
      }
    }
  },
  {
    "author": "odl_user_846404@seneca-csn400ndd.cloudlabs.ai",
    "creationDate": "2023-02-10T05:20:19.590494+00:00",
    "customImagePlan": null,
    "dataDiskStorageInfo": null,
    "description": "Tasks Completed:\nNo configuration",
    "id": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.devtestlab/labs/csn400-110/customimages/ls-img-v01",
    "isPlanAuthorized": null,
    "location": null,
    "managedImageId": null,
    "managedSnapshotId": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/ls-img-v01",
    "name": "LS-img-V01",
    "provisioningState": "Succeeded",
    "resourceGroup": "student-rg-846404",
    "tags": null,
    "type": "Microsoft.DevTestLab/labs/customImages",
    "uniqueIdentifier": "d7e596b4-bf93-4c01-b84b-4497ccaa9eab",
    "vhd": null,
    "vm": {
      "linuxOsInfo": {
        "linuxOsState": "NonDeprovisioned"
      },
      "sourceVmId": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.devtestlab/labs/csn400-110/virtualmachines/ls-110",
      "windowsOsInfo": null
    }
  },
  {
    "author": "odl_user_846404@seneca-csn400ndd.cloudlabs.ai",
    "creationDate": "2023-02-10T05:21:03.791154+00:00",
    "customImagePlan": null,
    "dataDiskStorageInfo": null,
    "description": "Task Completed:\nadded linuxkey and tested, working!",
    "id": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.devtestlab/labs/csn400-110/customimages/lr-img-v01",
    "isPlanAuthorized": null,
    "location": null,
    "managedImageId": null,
    "managedSnapshotId": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/lr-img-v01",
    "name": "LR-img-V01",
    "provisioningState": "Succeeded",
    "resourceGroup": "student-rg-846404",
    "tags": null,
    "type": "Microsoft.DevTestLab/labs/customImages",
    "uniqueIdentifier": "7fc5a00d-993f-4d2b-a26c-acc8a22054c7",
    "vhd": null,
    "vm": {
      "linuxOsInfo": {
        "linuxOsState": "NonDeprovisioned"
      },
      "sourceVmId": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.devtestlab/labs/csn400-110/virtualmachines/lr-110",
      "windowsOsInfo": null
    }
  },
  {
    "author": "odl_user_846404@seneca-csn400ndd.cloudlabs.ai",
    "creationDate": "2023-02-10T05:21:48.157315+00:00",
    "customImagePlan": null,
    "dataDiskStorageInfo": null,
    "description": "Tasks Completed:\nAdded linuxkey, changed extension, tested",
    "id": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.devtestlab/labs/csn400-110/customimages/wc-img-v01",
    "isPlanAuthorized": null,
    "location": null,
    "managedImageId": null,
    "managedSnapshotId": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.compute/snapshots/wc-img-v01",
    "name": "WC-img-V01",
    "provisioningState": "Succeeded",
    "resourceGroup": "student-rg-846404",
    "tags": null,
    "type": "Microsoft.DevTestLab/labs/customImages",
    "uniqueIdentifier": "4385643d-d44c-410e-90bf-daa5edac9d1e",
    "vhd": null,
    "vm": {
      "linuxOsInfo": null,
      "sourceVmId": "/subscriptions/71d310bf-1718-4d11-87d1-99a7d4e2053f/resourcegroups/student-rg-846404/providers/microsoft.devtestlab/labs/csn400-110/virtualmachines/wc-110",
      "windowsOsInfo": {
        "windowsOsState": "NonSysprepped"
      }
    }
  }
]
```

### Part D - Azure Cost Analysis Charts

1. Column (Stacked) - DailyCosts - Last 7 Days - Resource - Daily

![Chart1](https://github.com/144525201-myseneca/CSN400-Capstone/blob/308c79fffbac3b3964b12f0cb058b7416a44840f/Checkpoint5/cp5-ss/Chart1.PNG)

This filter is showing a column chart that breaks down the daily costs of my virtual machines for the last 7 days. The chart is "stacked," which means that we can see the costs of each individual virtual machine represented as a separate segment of the column, stacked on top of one another. This information can help you make informed decisions about your virtual machine usage and spending. In short, the filter "Column (Stacked) - DailyCosts - Last 7 Days - Resource - Daily" provides you with a clear and convenient way to monitor your virtual machine costs in Azure, on a daily basis.

2. Column (Stacked) - DailyCosts - Last 7 Days - Service - Daily

![Chart2](https://github.com/144525201-myseneca/CSN400-Capstone/blob/308c79fffbac3b3964b12f0cb058b7416a44840f/Checkpoint5/cp5-ss/Chart2.PNG)

The filter is similar to the previous filter in that it provides information about costs in Azure, but this time it's focused on services rather than resource. With these filters, it displays a column chart of the daily costs of different services in Azure over the last 7 days. The chart is "stacked," meaning that each service is represented as a separate segment of the column, stacked on top of one another. It also provides a clear picture of how much each service is costing you on a daily basis, and how those costs have changed over the last 7 days. This information can be useful for understanding your spending on different services in Azure, and for making informed decisions about which services to use and how to use them more efficiently. In conclusion, the filter "Column (Stacked) - DailyCosts - Last 7 Days - Service - Daily" is a powerful tool for monitoring and analyzing the costs of services in Azure, on a daily basis.


3. Area	AccumulatedCosts - Last 7 Days - Resource - Accumulated

![Chart3](https://github.com/144525201-myseneca/CSN400-Capstone/blob/308c79fffbac3b3964b12f0cb058b7416a44840f/Checkpoint5/cp5-ss/Chart3.PNG)

This filter shows an area chart that displays the total cost of my virtual machines over the last 7 days. The chart is designed to give a clear picture of the overall trend of your virtual machine costs over time. By looking at this chart, I can see how much each virtual machine is costing me on a daily basis, and how those costs have accumulated over the last 7 days. This information can help me make informed decisions about my virtual machine usage and spending, by showing where I can potentially make adjustments to save money. In short, the filter "Area AccumulatedCosts - Last 7 Days - Resource - Accumulated" provides you with a clear and convenient way to monitor the accumulated cost of your virtual machines in Azure, over the last 7 days.

4. Pie Chart - Service Name

***last month***

![Chart4_LastMonth](https://github.com/144525201-myseneca/CSN400-Capstone/blob/5a60a8e152c9cdafe89d9315ce495fcf0bd8526b/Checkpoint5/cp5-ss/chart4_lastmonth.png)

This filter displays a pie chart that shows the proportion of costs associated with each service in Azure over the last month. The chart is designed to give you a clear and concise view of which services are consuming the most resources, and therefore contributing the most to your total costs in Azure. By looking at this chart, I can quickly see which services are costing me the most money and where I have the potential to make adjustments and save costs. In this screenshot, we haven't captured any data as our Azure account is new.

***last 30 days***

![Chart4_Last30Days](https://github.com/144525201-myseneca/CSN400-Capstone/blob/5a60a8e152c9cdafe89d9315ce495fcf0bd8526b/Checkpoint5/cp5-ss/chart4_last30days.png)

This filter is the same as above except for the range which is last 30 days. I've included this screenshot as there are no data coming up for the last month's filter as we just recently started using Azure this month. In this example, we can see that Storage, Virtual Machines, Virtual Machines License, Bandwidth and Virtual Network are the services that consuming most resources.

5. Pie Chart - Service Family

***last month***

![Chart5_LastMonth](https://github.com/144525201-myseneca/CSN400-Capstone/blob/5a60a8e152c9cdafe89d9315ce495fcf0bd8526b/Checkpoint5/cp5-ss/chart5_lastmonth.png)

This filter displays a pie chart that shows the proportion of costs associated with different service families in Azure over the last month. The chart is designed to give me a clear and concise view of which service families are consuming the most resources, and therefore contributing the most to my total costs in Azure. By looking at this chart, I can quickly see which service families are costing me the most money and where I have the potential to make adjustments and save costs. As expected, no results were returned because of lack of activity in Azure for the last month. 

***last 30 days***

![Chart5_Last30Days](https://github.com/144525201-myseneca/CSN400-Capstone/blob/5a60a8e152c9cdafe89d9315ce495fcf0bd8526b/Checkpoint5/cp5-ss/chart5_last30days.png)

I've used the same filter as above but I've used Last 30 days to show the concise view of which service families are consuming the resources. For the last 30 days the service families thatcosting me the most money are Compute, Storage and Networking.

6. Pie Chart - Product

***last month***

![Chart6_LastMonth](https://github.com/144525201-myseneca/CSN400-Capstone/blob/5a60a8e152c9cdafe89d9315ce495fcf0bd8526b/Checkpoint5/cp5-ss/chart5_lastmonth.png)

The filter shows the costs associated with each product I have in Azure, giving me a clear understanding of which products are consuming the most resources, and therefore contributing the most to my total costs in Azure.

***last 30 days***

![Chart6_Last30Days](https://github.com/144525201-myseneca/CSN400-Capstone/blob/5a60a8e152c9cdafe89d9315ce495fcf0bd8526b/Checkpoint5/cp5-ss/chart6_last30days.png)

I've used the same filter but changed the date range to Last 30 days to visualize the result of the filter. In the screenshot above, the products that are consuming most of the resources in this example are Red Hat Enterprise Linux, Virtual Machine BS Series Windows, Standard HDD Managed Disks, Files - LRS - CA Central, & Others.
