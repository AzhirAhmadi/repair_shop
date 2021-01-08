import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // data#export
  GET_export() {
    return apiClient.get("/export", {
      headers: {
        Authorization: store.state.auth_token,
      },
    });
  }, //##
    // data#import
    GET_import() {
      return apiClient.get("/import", {
        headers: {
          Authorization: store.state.auth_token,
        },
      });
    }, //##
};
