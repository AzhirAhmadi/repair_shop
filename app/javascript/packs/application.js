//import vue
import Vue from "vue/dist/vue.esm";

// Import elemnt
// npm i element-ui -S
import ElementUI from "element-ui";
import locale from "element-ui/lib/locale/lang/en";
import "element-ui/lib/theme-chalk/index.css";
Vue.use(ElementUI, { locale });

// Import axios from ‘axios
// npm install --save axios vue-axios
import axios from "axios";
import VueAxios from "vue-axios";
Vue.use(VueAxios, axios);
import deviseResource from "../resources/deviseResource";
Vue.prototype.$deviseResource = deviseResource;
import userResource from "../resources/userResource";
Vue.prototype.$userResource = userResource;
import shopResource from "../resources/shopResource";
Vue.prototype.$shopResource = shopResource;
import customerResource from "../resources/customerResource";
Vue.prototype.$customerResource = customerResource;
import carResource from "../resources/carResource";
Vue.prototype.$carResource = carResource;
import repairResource from "../resources/repairResource";
Vue.prototype.$repairResource = repairResource;
import sparePartResource from "../resources/sparePartResource";
Vue.prototype.$sparePartResource = sparePartResource;


// Import vuex
// npm install vuex --save
import Vuex from "vuex";
Vue.use(Vuex);
import store from "./store.js";

// Import router
// npm install vue-router
import router from "./router";

import Home from "../views/home.vue";

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    router,
    store,
    render: (h) => h(Home),
    el: "#app",
    components: {
      Home,
    },
  }).$mount();
  document.body.appendChild(app.$el);
});
