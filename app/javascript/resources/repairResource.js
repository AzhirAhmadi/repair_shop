import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // repairs#index
  GET_user_customer_car_repairs(user_id, customer_id, car_id) {
    return apiClient.get(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs",
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // repairs#show
  GET_user_customer_car_repair(user_id, customer_id, car_id, id) {
    return apiClient.get(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs/" +
        id,
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // repairs#create
  POST_user_customer_car_repairs(user_id, customer_id, car_id, repair) {
    return apiClient.post(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs",
      {
        repair: {
          description: repair.description,
          kilometer: repair.kilometer.toEnglishDigit(),
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // repairs#update
  PUT_user_customer_car_repair(user_id, customer_id, car_id, repair) {
    return apiClient.put(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs/" +
        repair.id,
      {
        repair: {
          description: repair.description,
          kilometer: repair.kilometer.toEnglishDigit().toEn,
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // repairs#destroy
  DELETE_user_customer_car_repair(user_id, customer_id, car_id, id) {
    return apiClient.delete(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs" +
        id,
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
};
