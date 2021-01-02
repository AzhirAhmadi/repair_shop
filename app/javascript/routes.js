//template
import sing_in from "./components/authenticate/sing_in.vue";
import user_update from "./components/users/update";
import shop_update from "./components/shops/update";

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
];
export default routes;
