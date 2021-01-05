import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // customers#index
  GET_user_customers(user_id) {
    return apiClient.get("/users/" + user_id + "/customers", {
      headers: {
        Authorization: store.state.auth_token,
      },
    });
  }, //##
  // customers#show
  GET_user_customer(user_id, id) {
    return apiClient.get("/users/" + user_id + "/customers/"+id, {
      headers: {
        Authorization: store.state.auth_token,
      },
    });
  }, //##
  // customers#create
  POST_user_customers(user_id, customer) {
    return apiClient.post(
      "/users/" + user_id + "/customers/",
      {
        customer: {
          name: customer.name,
          mobile_number: customer.mobile_number,
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
    // customers#update
    PUT_user_customer(user_id, customer) {
      return apiClient.put(
        "/users/" + user_id + "/customers/"+customer.id,
        {
          customer: {
            name: customer.name,
            mobile_number: customer.mobile_number,
          },
        },
        {
          headers: {
            Authorization: store.state.auth_token,
          },
        }
      );
    }, //##
  // customers#destroy
  DELETE_user_customer(user_id, id) {
    return apiClient.delete("/users/" + user_id + "/customers/" + id, {
      headers: {
        Authorization: store.state.auth_token,
      },
    });
  }, //##
};
