#!/bin/sh
base_name="ts-playground"
rg="$base_name-rg"
aks_name="$base_name-aks"
location=eastus

echo "Create Resource Group"
az group create --name $rg --location $location

master_vm_size="Standard_DS2_v2" 
echo "Create AKS with primary node"
az aks create \
  --resource-group $rg \
  --name $aks_name \
  --node-count 2 \
  --node-vm-size $master_vm_size\
  --kubernetes-version 1.18.14 \
  --enable-managed-identity \
  --vm-set-type VirtualMachineScaleSets \
  --load-balancer-sku standard \

# echo "Create Node Pool for ds Workload"
WorkVmType="Standard_D8_v3"
echo "Add a worker node pool"
az aks nodepool add --cluster-name $aks_name \
                    --resource-group $rg \
                    --name op \
                    --node-osdisk-size 128 \
                    --max-pods 110 \
                    --labels group=backend \
                    --mode User \
                    --kubernetes-version 1.18.14 \
                    --zones 1 \
                    --node-count 2 \
                    --node-vm-size $WorkVmType \
                    --os-type Linux 
