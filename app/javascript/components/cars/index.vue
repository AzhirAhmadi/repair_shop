<template>
  <div style="display: flex;">
    <div class="shop-name out" @click="$router.go(-1)">
      <el-button
        class="back-button"
        icon="el-icon-back"
        circle
        @click="$router.go(-1)"
      />
      <p>مشتری ها</p>
      <div></div>
    </div>
    <div style="width:80%">
      <p class="header">ماشین ها</p>
      <table v-if="cars.length > 0" style="width:100%">
        <tr>
          <table style="width:100%">
            <tr>
              <th style="width:25px">ID</th>
              <th style="width:200px">مدل</th>
              <th>شماره ماشین</th>
              <th style="width:300px">حاسب مالی</th>
              <th style="width:400px">فعالیت ها</th>
            </tr>
            <CarInList
              v-for="(car, index) in cars"
              :key="index"
              :user_id="user_id"
              :customer_id="customer_id"
              :car="car"
              @onDelete="removeCarFromList"
              @onUpdate="updateCar"
            />
          </table>
        </tr>
      </table>
    </div>
    <div style="width:20%">
      <Create
        v-if="sideBarContent == 'create'"
        :user_id="user_id"
        :customer_id="customer_id"
        @onAdd="reloadCarsList"
      />
      <Update
        v-if="sideBarContent == 'update'"
        :user_id="user_id"
        :customer_id="customer_id"
        :data="updating_data"
        @onCancel="onCancel"
        @onSave="onSave"
      />
    </div>
  </div>
</template>

<script>
import CarInList from "./sub_components/car_in_list";
import Create from "./sub_components/car_create";
import Update from "./sub_components/car_update";

export default {
  props: ["user_id", "customer_id"],
  components: {
    CarInList,
    Create,
    Update,
  },
  data() {
    return {
      cars: [],
      sideBarContent: "create",
      updating_data: null,
    };
  },
  methods: {
    call_GET_user_customer_cars() {
      this.$carResource
        .GET_user_customer_cars(this.user_id, this.customer_id)
        .then((response) => {
          this.cars = response.data;
        });
    },
    removeCarFromList(id) {
      for (var i = 0; i < this.cars.length; i++) {
        if (this.cars[i].id === id) {
          this.cars.splice(i, 1);
        }
      }
    },
    reloadCarsList() {
      this.call_GET_user_customer_cars();
    },
    updateCar(car) {
      this.updating_data = car;
      this.sideBarContent = "update";
    },
    onCancel() {
      this.updating_data = null;
      this.sideBarContent = "create";
    },
    onSave() {
      this.reloadCarsList();
      this.updating_data = null;
      this.sideBarContent = "create";
    },
  },
  created() {
    this.$store.dispatch("updatePageHeader", "Car Index");
    this.call_GET_user_customer_cars();
  },
};
</script>
<style scoped>
.header {
  font-size: 2em;
  text-align: center;
}
</style>
