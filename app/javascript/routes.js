//template
import sing_in from "./components/authenticate/sing_in.vue";
import user_update from "./components/users/update";
import shop_update from "./components/shops/update";
import customer_index from "./components/customers/index";
import car_index from "./components/cars/index";
import repair_index from "./components/repairs/index";
import spare_part_index from "./components/spare_parts/index";
import payment_index from "./components/payments/index";


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
  // //Repair
  {
    path: "/users/:user_id/customers/:customer_id/cars/:car_id/repairs",
    name: "repair_index",
    component: repair_index,
    props: true,
  },
  // //Repair end
  // //SparePart
  {
    path:
      "/users/:user_id/customers/:customer_id/cars/:car_id/repairs/:repair_id/spare_parts",
    name: "spare_part_index",
    component: spare_part_index,
    props: true,
  },
  // //SparePart end
  // //Payment
  {
    path:
      "/users/:user_id/customers/:customer_id/cars/:car_id/repairs/:repair_id/payments",
    name: "payment_index",
    component: payment_index,
    props: true,
  },
  // //Payment end
];
export default routes;
