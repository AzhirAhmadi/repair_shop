import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // shops#show
  GET_user_shop(user_id) {
    return apiClient.get("/users/" + user_id + "/shop", {
      headers: {
        Authorization: store.state.auth_token,
      },
    });
  }, //##
  // shops#update
  PUT_user_shop(user_id, shop) {
    return apiClient.put(
      "/users/" + user_id + "/shop",
      {
        shop: {
          name: shop.name,
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
