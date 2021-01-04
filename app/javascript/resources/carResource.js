import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // cars#index
  GET_user_customer_cars(user_id, customer_id) {
    return apiClient.get(
      "/users/" + user_id + "/customers/" + customer_id + "/cars",
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // cars#show
  GET_user_customer_car(user_id, customer_id, id) {
    return apiClient.get(
      "/users/" + user_id + "/customers/" + customer_id + "/cars/" + id,
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // cars#create
  POST_user_customer_cars(user_id, customer_id, car) {
    return apiClient.post(
      "/users/" + user_id + "/customers/" + customer_id + "/cars",
      {
        car: {
          number: car.number,
          car_type: car.car_type,
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // cars#update
  PUT_user_customer_car(user_id, customer_id, car) {
    return apiClient.put(
      "/users/" + user_id + "/customers/" + customer_id + "/cars/" + car.id,
      {
        car: {
          number: car.number,
          car_type: car.car_type,
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // cars#destroy
  DELETE_user_customer_car(user_id, customer_id, id) {
    return apiClient.delete(
      "/users/" + user_id + "/customers/" + customer_id + "/cars/" + id,
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
};
