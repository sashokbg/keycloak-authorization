resource "keycloak_openid_client_authorization_permission" "default_permission" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Default Permission 2"

  policies = [
    keycloak_openid_client_js_policy.default.id
  ]

  resources = [
    keycloak_openid_client_authorization_resource.default.id,
  ]

  scopes = []
}

resource "keycloak_openid_client_authorization_permission" "premium_permission" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Premium Permission"

  policies = [
    keycloak_openid_client_role_policy.premium.id
  ]

  resources = [
    keycloak_openid_client_authorization_resource.premium.id,
  ]

  scopes = []
}

resource "keycloak_openid_client_authorization_permission" "protected_permission" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Protected Permission"

  policies = [
    keycloak_openid_client_role_policy.only_user.id
  ]

  resources = [
    keycloak_openid_client_authorization_resource.protected.id,
  ]

  scopes = []
}

resource "keycloak_openid_client_authorization_permission" "only_user_permission" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Only User Permission"

  policies = [
    keycloak_openid_client_role_policy.only_user.id
  ]

  resource_type = keycloak_openid_client_authorization_resource.user.type

  scopes = []
}

resource "keycloak_openid_client_authorization_permission" "only_owner_permission" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Only Owner Permission"

  policies = [
    keycloak_openid_client_js_policy.only_owner.id
  ]

  resource_type = keycloak_openid_client_authorization_resource.alice.type

  scopes = []
}
