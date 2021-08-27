# Introduction 
TODO: 
Projeto desenvolvido para implementação de dois PODS Kubernetes para o Site Institucional Empresa.
Os mesmos estão implementados junto com o Container do FrontEnd que será desenvolvido pela Subperare.
Consistem em 1 POD MySQL, 1 POD WordPress BackEnd e 1 POD FrontEnd.

# Getting Started
TODO: 
1.	git clone https://github.com/vinicius-cursi/Site-WP-MySQL.git
2.	az connect
3.	az aks get-credentials --resource-group rg-brsouth-prd_aks-brsouth-01 --name aks-brasilsouth-01 --overwrite-existing
4.	kubectl get pods -n site-empresa

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)