provider "authlete" {

}

resource "authlete_service" "as" {
  issuer = "https://idp-localhost.sherpa-demo.com"
  authorization_endpoint = "https://idp-localhost.sherpa-demo.com/api/authorization"
  token_endpoint = "https://idp-localhost.sherpa-demo.com/api/token"
  jwks_endpoint = "http://idp-localhost.sherpa-demo.com/api/jwks"
  user_info_endpoint = "https://idp-localhost.sherpa-demo.com/api/userinfo"
  service_name = "AUTHLETE-LAB-GETTING-STARTED-TERRAFORM"
  description = "A terraform based service for managing the Authlete based OAuth server"
  supported_grant_types = ["AUTHORIZATION_CODE", "IMPLICIT", "PASSWORD", "CLIENT_CREDENTIALS", "REFRESH_TOKEN", "CIBA", "DEVICE_CODE"]
  supported_response_types = ["NONE", "CODE", "TOKEN", "ID_TOKEN", "CODE_TOKEN", "CODE_ID_TOKEN", "ID_TOKEN_TOKEN", "CODE_ID_TOKEN_TOKEN"]
  access_token_duration = 86400
  refresh_token_duration = 864000
  id_token_duration = 86400
  supported_claims = ["sub", "name", "given_name", "family_name", "middle_name", "nickname", "preferred_username", "profile", "picture", "website", "email", "email_verified", "gender", "birthdate", "zoneinfo", "locale", "phone_number", "phone_number_verified", "address", "updated_at"]
  claim_shortcut_restrictive = true
  backchannel_auth_req_id_duration = 600
  device_flow_code_duration = 600
  user_code_charset = "BASE20"
  user_code_length = 8
  id_token_signature_key_id = "HS256"
}

output "api_key" {
   value = authlete_service.as.id
}

output "api_secret" {
   value = authlete_service.as.api_secret
   sensitive = true
}