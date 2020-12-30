import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // users#profile
  GET_profile() {
    console.log("profile");
    return apiClient.get("/profile", {
      headers: {
        Authorization: store.state.auth_token,
      },
    });
  }, //##
};
