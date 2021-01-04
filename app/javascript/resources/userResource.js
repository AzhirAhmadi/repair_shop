import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // users#profile
  GET_profile() {
    return apiClient.get("/profile", {
      headers: {
        Authorization: store.state.auth_token,
      },
    });
  }, //##
  // users#update
  PUT_user(id, user) {
    return apiClient.put(
      "/users/" + id,
      {
        user: {
          email: user.email,
          password: user.password,
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
};
