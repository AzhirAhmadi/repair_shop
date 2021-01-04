import apiClient from "./apiClient";

export default {
  //devise_api/sessions#create
  POST_login(email, password) {
    return apiClient.post("/auth/signin", {
      user: { email: email, password: password },
    });
  },
  // devise_api/sessions#destroy
  DELETE_logout() {
    return apiClient.delete("/auth/signout", {
      headers: {
        Authorization: store.state.auth_token,
      },
    });
  },
};
