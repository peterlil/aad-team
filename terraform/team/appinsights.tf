#https://www.terraform.io/docs/providers/azurerm/r/application_insights.html
resource "azurerm_application_insights" "aksainsights" {
  name                = "${var.deployment_name}-ai-${local.hash_suffix}"
  application_type    = "Node.JS"
  location            = azurerm_resource_group.aksrg.location
  resource_group_name = azurerm_resource_group.aksrg.name

  tags = {
    environment = var.deployment_name
  }
}

output "APPINSIGHTS_INSTRUMENTATIONKEY" {
  value = azurerm_application_insights.aksainsights.instrumentation_key
}