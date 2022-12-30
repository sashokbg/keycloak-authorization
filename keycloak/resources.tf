resource "keycloak_openid_client_authorization_resource" "default" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  name               = "Default"
  realm_id           = keycloak_realm.realm.id

  uris = [
    "/*",
  ]
}

resource "keycloak_openid_client_authorization_resource" "protected" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  name               = "Protected Resource"
  realm_id           = keycloak_realm.realm.id

  uris = [
    "/protected/*",
  ]
}

resource "keycloak_openid_client_authorization_resource" "premium" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  name               = "Premium Resource"
  realm_id           = keycloak_realm.realm.id

  uris = [
    "/protected/premium/*",
  ]
}

resource "keycloak_openid_client_authorization_resource" "user" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  name               = "User Resource"
  realm_id           = keycloak_realm.realm.id

  type = "user"
  uris = [
  ]
}

resource "keycloak_openid_client_authorization_resource" "alice" {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  name               = "Alice Resource"
  realm_id           = keycloak_realm.realm.id

  type = "user-resource"

  uris = [
    "/protected/alice"
  ]

  attributes = {
    "owner" = keycloak_user.alice.id
  }
}
