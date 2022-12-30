import React, {useState} from "react";
import Keycloak from "keycloak-js";

export const App = function (props) {
    const [user, setUser] = useState('unknown');

    return (
        <div>
            Hello {props.user}
        </div>
    )
}