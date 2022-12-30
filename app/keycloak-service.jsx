import Keycloak from "keycloak-js";

export class KeycloakService {
    constructor(callback) {
        const keycloak = new Keycloak();

        keycloak.init({
            onLoad: 'login-required'
        }).then(function (authenticated) {
            callback(keycloak.tokenParsed.preferred_username);
        }).catch(function (e) {
            console.log('Failed to initialize keycloak', e);
        });
    }
}

