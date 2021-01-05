import apiClient from "./apiClient";
import store from "../packs/store";

export default {
  // spare_parts#index
  GET_user_customer_car_repair_spare_parts(
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
        "/spare_parts",
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // spare_parts#show
  GET_user_customer_car_repair_spare_part(
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
        "/spare_parts/" +
        id,
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // spare_parts#create
  POST_user_customer_car_repair_spare_parts(
    user_id,
    customer_id,
    car_id,
    repair_id,
    spare_part
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
        "/spare_parts",
      {
        spare_part: {
          name: spare_part.name,
          cost: spare_part.cost.toEnglishDigit(),
          serial_number: spare_part.serial_number,
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // spare_parts#update
  PUT_user_customer_car_repair_spare_part(
    user_id,
    customer_id,
    car_id,
    repair_id,
    spare_part
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
        "/spare_parts/"+
      spare_part.id,
      {
        spare_part: {
          name: spare_part.name,
          cost: spare_part.cost.toEnglishDigit(),
          serial_number: spare_part.serial_number,
        },
      },
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
  // spare_parts#destroy
  DELETE_user_customer_car_repair_spare_part(
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
        "/spare_parts/" +
        id,
      {
        headers: {
          Authorization: store.state.auth_token,
        },
      }
    );
  }, //##
};
