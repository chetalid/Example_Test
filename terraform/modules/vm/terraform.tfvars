# Resource Group/Location
location                = "East US"
resource_group          = "azuredevops"
application_type        = "quality-releases"

# Virtual Machine
vm_size                 = "Standard_B1s"
vm_admin_username       = "azureuser"

# Network
public_ip_address_id    = "/subscriptions/09b22bb3-8da4-418b-a14e-087a777b0654/resourceGroups/azuredevops/providers/Microsoft.Network/publicIPAddresses/azuredevops-publicip"
subnet_id               = "/subscriptions/09b22bb3-8da4-418b-a14e-087a777b0654/resourceGroups/azuredevops/providers/Microsoft.Network/virtualNetworks/azuredevops-NET-subnet1"
