resource "authlete_client" "portal2" {
   developer = "authlete_292034885493664"
   client_id_alias = "demoapp2_client"
   client_id_alias_enabled = false
   client_type = "CONFIDENTIAL"
   redirect_uris = [ "http://demoapp2/private/redirect_uri" ]
   response_types = ["NONE", "CODE", "TOKEN", "ID_TOKEN", "CODE_TOKEN", "CODE_ID_TOKEN","ID_TOKEN_TOKEN", "CODE_ID_TOKEN_TOKEN"]
   grant_types = [ "AUTHORIZATION_CODE", "IMPLICIT", "PASSWORD", "CLIENT_CREDENTIALS", "REFRESH_TOKEN", "CIBA", "DEVICE_CODE" ]
   client_name = "DEMOAPP2"
   requestable_scopes = ["openid", "profile"]
   application_type = "WEB"
   token_auth_method = "CLIENT_SECRET_BASIC"
}


output "client_id2" {
   value = authlete_client.portal2.id
}

output "client_secret2" {
   value = authlete_client.portal2.client_secret
   sensitive = true
}