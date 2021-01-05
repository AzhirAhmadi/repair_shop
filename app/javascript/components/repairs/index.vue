<template>
  <div style="display: flex;">
    <div class="shop-name" @click="$router.go(-1)">
      <el-button
        class="back-button"
        icon="el-icon-back"
        circle
        @click="$router.go(-1)"
      />
      <p>ماشین ها</p>
      <div></div>
    </div>
    <div style="width:80%">
      <p class="header">تعمیرات</p>
      <table v-if="repairs.length > 0" style="width:100%">
        <tr>
          <table style="width:100%">
            <tr>
              <th style="width:25px">ID</th>
              <th style="width:200px">کیلومتر</th>
              <th>توضیحات</th>
              <th style="width:300px">حاسب مالی</th>
              <th style="width:400px">فعالیت ها</th>
            </tr>
            <RepairInList
              v-for="(repair, index) in repairs"
              :key="index"
              :user_id="user_id"
              :customer_id="customer_id"
              :car_id="car_id"
              :repair="repair"
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
        :car_id="car_id"
        @onAdd="reloadRepairsList"
      />
      <Update
        v-if="sideBarContent == 'update'"
        :user_id="user_id"
        :customer_id="customer_id"
        :car_id="car_id"
        :data="updating_data"
        @onCancel="onCancel"
        @onSave="onSave"
      />
    </div>
  </div>
</template>

<script>
import RepairInList from "./sub_components/repair_in_list";
import Create from "./sub_components/repair_create";
import Update from "./sub_components/repair_update";

export default {
  props: ["user_id", "customer_id", "car_id"],
  components: {
    RepairInList,
    Create,
    Update,
  },
  data() {
    return {
      repairs: [],
      sideBarContent: "create",
      updating_data: null,
    };
  },
  methods: {
    call_GET_user_customer_car_repairs() {
      this.$repairResource
        .GET_user_customer_car_repairs(
          this.user_id,
          this.customer_id,
          this.car_id
        )
        .then((response) => {
          this.repairs = response.data;
        });
    },
    removeCarFromList(id) {
      for (var i = 0; i < this.repairs.length; i++) {
        if (this.repairs[i].id === id) {
          this.repairs.splice(i, 1);
        }
      }
    },
    reloadRepairsList() {
      this.call_GET_user_customer_car_repairs();
    },
    updateCar(repair) {
      this.updating_data = repair;
      this.sideBarContent = "update";
    },
    onCancel() {
      this.updating_data = null;
      this.sideBarContent = "create";
    },
    onSave() {
      this.reloadRepairsList();
      this.updating_data = null;
      this.sideBarContent = "create";
    },
  },
  created() {
    this.$store.dispatch("updatePageHeader", "Car Index");
    this.call_GET_user_customer_car_repairs();
  },
};
</script>
<style scoped>
.header {
  font-size: 2em;
  text-align: center;
}
</style>
