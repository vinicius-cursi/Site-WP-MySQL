# Change these four parameters as needed for your own environment
AKS_PERS_STORAGE_ACCOUNT_NAME='st01prd01'
AKS_PERS_RESOURCE_GROUP='rg-brsouth-prd'
AKS_PERS_LOCATION='brazilsouth'
AKS_PERS_SHARE_NAME='aks01mysql01share'
AKS_SECRET_STORAGE='aks01st01prd01-secret'
# AKS_PERS_SHARE_NAME='aks01wp01share'

# Create a resource group
az group create --name $AKS_PERS_RESOURCE_GROUP --location $AKS_PERS_LOCATION

# Create a storage account
az storage account create -n $AKS_PERS_STORAGE_ACCOUNT_NAME -g $AKS_PERS_RESOURCE_GROUP -l $AKS_PERS_LOCATION --sku Standard_LRS

# Export the connection string as an environment variable, this is used when creating the Azure file share
AZURE_STORAGE_CONNECTION_STRING=$(az storage account show-connection-string -n $AKS_PERS_STORAGE_ACCOUNT_NAME -g $AKS_PERS_RESOURCE_GROUP -o tsv)

# Create the file share
az storage share create -n $AKS_PERS_SHARE_NAME --connection-string $AZURE_STORAGE_CONNECTION_STRING

# Get storage account key
STORAGE_KEY=$(az storage account keys list --resource-group $AKS_PERS_RESOURCE_GROUP --account-name $AKS_PERS_STORAGE_ACCOUNT_NAME --query "[0].value" -o tsv)

# Echo storage account name and key
echo 'Storage account name:' $AKS_PERS_STORAGE_ACCOUNT_NAME
echo 'Storage account key:' $STORAGE_KEY

# kubectl create secret generic $AKS_SECRET_STORAGE --from-literal=azurestorageaccountname=$AKS_PERS_STORAGE_ACCOUNT_NAME --from-literal=azurestorageaccountkey=$STORAGE_KEY -n site-empresa