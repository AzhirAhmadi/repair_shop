//template
import sing_in from "./components/authenticate/sing_in.vue";
import user_update from "./components/users/update";
import shop_update from "./components/shops/update";
import customer_index from "./components/customers/index";
import car_index from "./components/cars/index";

const routes = [
  // //General
  {
    path: "/",
    name: "root",
    component: sing_in,
    props: true,
  },
  // //General end
  // //User
  {
    path: "/users/:id",
    name: "user_update",
    component: user_update,
    props: true,
  },
  // //User end
  // //Shop
  {
    path: "/users/:user_id/shop",
    name: "shop_update",
    component: shop_update,
    props: true,
  },
  // //Shop end
  // //Customer
  {
    path: "/users/:user_id/customers",
    name: "customer_index",
    component: customer_index,
    props: true,
  },
  // //Customer end
  // //Car
  {
    path: "/users/:user_id/customers/:customer_id/cars",
    name: "car_index",
    component: car_index,
    props: true,
  },
  // //Car end
];
export default routes;
