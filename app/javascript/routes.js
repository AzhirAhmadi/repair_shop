//template
import sing_in from "./components/authenticate/sing_in.vue";

const routes = [
  // //General
  {
    path: "/",
    name: "root",
    component: sing_in,
    props: true,
  },
  // //General end
];
export default routes;
