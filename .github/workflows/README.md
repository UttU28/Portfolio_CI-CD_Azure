az ad sp create-for-rbac --name "github-action-spn" --role contributor --scopes /subscriptions/fb03483b-eece-41f0-8fca-b16b9e75cb43 --sdk-auth

{
  "clientId": "b4317ad4-6652-4e7c-947f-dd2f5f81b697",
  "clientSecret": "lnS8Q~CJyyJxsyvRSO-6k2pGo6hVKjy2kyK5bcyU",
  "subscriptionId": "fb03483b-eece-41f0-8fca-b16b9e75cb43",
  "tenantId": "a8d3e12a-a4f9-47c3-b7bd-0f18f50c4713",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}