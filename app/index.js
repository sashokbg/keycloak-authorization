import {App} from "./app";
import {createRoot} from "react-dom/client";
import React from "react";
import {KeycloakService} from "./keycloak-service";

const container = document.getElementById('app');
const root = createRoot(container)

const callback = (user) => {
    root.render(<App user={user}></App>)
}

new KeycloakService(callback);
