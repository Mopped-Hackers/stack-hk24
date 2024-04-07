resource_group_name=$(terraform output | grep "resource_group_name" | sed 's/resource_group_name = //' | tr -d '"')

echo "Updating container \n"
echo "reg: $resource_group_name"
echo "app: $1"
echo "img: $2"

az containerapp update --name $1 --resource-group $resource_group_name --image $2
