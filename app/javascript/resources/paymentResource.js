import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // payments#index
  GET_user_customer_car_repair_payments(
    user_id,
    customer_id,
    car_id,
    repair_id
  ) {
    return apiClient.get(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs/" +
        repair_id +
        "/payments",
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // payments#show
  GET_user_customer_car_repair_payment(
    user_id,
    customer_id,
    car_id,
    repair_id,
    id
  ) {
    return apiClient.get(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs/" +
        repair_id +
        "/payments/" +
        id,
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // payments#create
  POST_user_customer_car_repair_payments(
    user_id,
    customer_id,
    car_id,
    repair_id,
    payment
  ) {
    return apiClient.post(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs/" +
        repair_id +
        "/payments",
      {
        payment: {
          value: payment.value.toEnglishDigit(),
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // payments#update
  PUT_user_customer_car_repair_payment(
    user_id,
    customer_id,
    car_id,
    repair_id,
    payment
  ) {
    return apiClient.put(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs/" +
        repair_id +
        "/payments/" +
        payment.id,
      {
        payment: {
          value: payment.value.toEnglishDigit(),
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // payments#destroy
  DELETE_user_customer_car_repair_payment(
    user_id,
    customer_id,
    car_id,
    repair_id,
    id
  ) {
    return apiClient.delete(
      "/users/" +
        user_id +
        "/customers/" +
        customer_id +
        "/cars/" +
        car_id +
        "/repairs/" +
        repair_id +
        "/payments/" +
        id,
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
};
