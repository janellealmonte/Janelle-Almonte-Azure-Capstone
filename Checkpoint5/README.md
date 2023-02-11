# Checkpoint5 Submission ✔️

- **COURSE INFORMATION: CSN 400-Computer Systems Projects**
- **STUDENT’S NAME: Janelle Marie Almonte**
- **STUDENT'S NUMBER: 144525201**
- **GITHUB USER ID: 144525201-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

## Table of Contents
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

- [lab_vm.tbl](https://github.com/144525201-myseneca/CSN400-Capstone/blob/52e875800c35db113b851255f18d1bd952c915e8/Checkpoint5/Part_B/lab_vnets.tbl)

```json
{
"name": "CSN400-110"
}
```

### Part C - Creating VMs using Azure Resource Manager (ARM) & Custom Images

**Custom Images Created**

![Custom Images](https://github.com/144525201-myseneca/CSN400-Capstone/blob/8cf30d84913424687dd9e69ebabe6be5ba9e8955/Checkpoint5/cp5-ss/Custom_Images.png)

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

2. Column (Stacked) - DailyCosts - Last 7 Days - Service - Daily

![Chart2](https://github.com/144525201-myseneca/CSN400-Capstone/blob/308c79fffbac3b3964b12f0cb058b7416a44840f/Checkpoint5/cp5-ss/Chart2.PNG)

3. Area	AccumulatedCosts - Last 7 Days - Resource - Accumulated

![Chart3](https://github.com/144525201-myseneca/CSN400-Capstone/blob/308c79fffbac3b3964b12f0cb058b7416a44840f/Checkpoint5/cp5-ss/Chart3.PNG)

4. Pie Chart - Service Name

![Chart4](https://github.com/144525201-myseneca/CSN400-Capstone/blob/308c79fffbac3b3964b12f0cb058b7416a44840f/Checkpoint5/cp5-ss/Chart4.PNG)

5.
![Chart5](https://github.com/144525201-myseneca/CSN400-Capstone/blob/308c79fffbac3b3964b12f0cb058b7416a44840f/Checkpoint5/cp5-ss/Chart5.PNG)

6.
![Chart6](https://github.com/144525201-myseneca/CSN400-Capstone/blob/308c79fffbac3b3964b12f0cb058b7416a44840f/Checkpoint5/cp5-ss/Chart6.PNG)
