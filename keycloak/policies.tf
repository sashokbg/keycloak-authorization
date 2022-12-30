resource keycloak_openid_client_js_policy default {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Default Policy JS"
  decision_strategy  = "AFFIRMATIVE"
  logic              = "POSITIVE"
  code               = "script-always-grant.js"
}

resource keycloak_openid_client_role_policy premium {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Premium Policy"
  decision_strategy  = "AFFIRMATIVE"
  logic              = "POSITIVE"
  type               = "script-always-grant.js"
  role {
    id       = keycloak_role.premium.id
    required = false
  }
}

resource keycloak_openid_client_role_policy only_user {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Only User Policy"
  decision_strategy  = "UNANIMOUS"
  logic              = "POSITIVE"
  type               = "role"

  role {
    id       = keycloak_role.user.id
    required = false
  }
}

resource keycloak_openid_client_js_policy only_owner {
  resource_server_id = data.keycloak_openid_client.realm_management.id
  realm_id           = keycloak_realm.realm.id
  name               = "Only Owner Policy"
  decision_strategy  = "UNANIMOUS"
  logic              = "POSITIVE"
  code               = "script-only-owner.js"
}
