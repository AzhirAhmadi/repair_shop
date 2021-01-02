//template
import sing_in from "./components/authenticate/sing_in.vue";
import user_update from "./components/users/update";

const routes = [
  // //General
  {
    path: "/",
    name: "root",
    component: sing_in,
    props: true,
  },
  {
    path: "/users/:id",
    name: "user_update",
    component: user_update,
    props: true,
  },
  // //General end
];
export default routes;
