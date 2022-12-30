terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "4.1.0"
    }
  }
}

provider "keycloak" {
  client_id     = "terraform"
  client_secret = "8iNzdfaRgJt4OKc8r8q3nw61KDRbmX5F"
  url           = "http://127.0.0.0:9000"
}

resource "keycloak_realm" "realm" {
  realm   = "bankerise"
  enabled = true
}

resource "keycloak_user" "alice" {
  realm_id = keycloak_realm.realm.id
  username = "alice"
  enabled  = true

  email      = "alice@domain.com"
  first_name = "Alice"
  last_name  = "Aliceberg"

  initial_password {
    value     = "alice"
    temporary = false
  }
}

resource "keycloak_user" "jdoe" {
  realm_id = keycloak_realm.realm.id
  username = "jdoe"
  enabled  = true

  email      = "jdoe@domain.com"
  first_name = "John"
  last_name  = "Doe"

  initial_password {
    value     = "jdoe"
    temporary = false
  }
}

resource "keycloak_openid_client_service_account_realm_role" "client_service_account_role" {
  realm_id                = keycloak_realm.realm.id
  service_account_user_id = keycloak_openid_client.app_client.service_account_user_id
  role                    = keycloak_role.sa_role.name
}

resource "keycloak_role" "sa_role" {
  realm_id = keycloak_realm.realm.id
  name     = "uma_protection"
}

resource "keycloak_role" "user" {
  realm_id    = keycloak_realm.realm.id
  name        = "user"
  description = "User Role"
}

resource "keycloak_role" "premium" {
  realm_id    = keycloak_realm.realm.id
  name        = "user-premium"
  description = "User Premium Role"
}

resource "keycloak_user_roles" "alice_roles" {
  realm_id = keycloak_realm.realm.id
  user_id  = keycloak_user.alice.id

  role_ids = [
    keycloak_role.user.id,
  ]
}

resource "keycloak_user_roles" "jdoe_roles" {
  realm_id = keycloak_realm.realm.id
  user_id  = keycloak_user.jdoe.id

  role_ids = [
    keycloak_role.user.id,
    keycloak_role.premium.id,
  ]
}

resource "keycloak_openid_client" "app_client" {
  realm_id                     = keycloak_realm.realm.id
  client_id                    = "app-authz-spring-security"
  name                         = "app-authz-spring-security"
  enabled                      = true
  client_secret                = "secret"
  direct_access_grants_enabled = true
  implicit_flow_enabled        = false
  standard_flow_enabled        = true
  service_accounts_enabled     = true

  authorization {
    policy_enforcement_mode          = "ENFORCING"
    allow_remote_resource_management = true
  }

  access_type = "CONFIDENTIAL"

  base_url            = "http://localhost:8080"
  admin_url           = "http://localhost:8080"
  valid_redirect_uris = [
    "http://localhost:8080/*"
  ]

  login_theme = "keycloak"
}


data "keycloak_openid_client" "realm_management" {
  realm_id  = keycloak_realm.realm.id
  client_id = keycloak_openid_client.app_client.name
}

