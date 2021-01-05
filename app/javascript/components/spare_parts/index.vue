<template>
  <div style="display: flex;">
    <div class="shop-name" @click="$router.go(-1)">
      <el-button
        class="back-button"
        icon="el-icon-back"
        circle
      />
      <p>Repairs List</p>
      <div></div>
    </div>
    <div style="width:80%">
      <p class="header">SpareParts List</p>
      <table v-if="spare_parts.length > 0" style="width:100%">
        <tr>
          <table style="width:100%">
            <tr>
              <th style="width:25px">ID</th>
              <th style="width:300px">Name</th>
              <th>SerialNumber</th>
              <th style="width:200px">Cost</th>
              <th style="width:300px">Actions</th>
            </tr>
            <SparePartInList
              v-for="(spare_part, index) in spare_parts"
              :key="index"
              :user_id="user_id"
              :customer_id="customer_id"
              :car_id="car_id"
              :repair_id="repair_id"
              :spare_part="spare_part"
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
        :repair_id="repair_id"
        @onAdd="reloadSparePartsList"
      />
      <Update
        v-if="sideBarContent == 'update'"
        :user_id="user_id"
        :customer_id="customer_id"
        :car_id="car_id"
        :repair_id="repair_id"
        :data="updating_data"
        @onCancel="onCancel"
        @onSave="onSave"
      />
    </div>
  </div>
</template>

<script>
import SparePartInList from "./sub_components/spare_part_in_list";
import Create from "./sub_components/spare_part_create";
import Update from "./sub_components/spare_part_update";

export default {
  props: ["user_id", "customer_id", "car_id", "repair_id"],
  components: {
    SparePartInList,
    Create,
    Update,
  },
  data() {
    return {
      spare_parts: [],
      sideBarContent: "create",
      updating_data: null,
    };
  },
  methods: {
    call_GET_user_customer_car_repair_spare_parts() {
      this.$sparePartResource
        .GET_user_customer_car_repair_spare_parts(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair_id
        )
        .then((response) => {
          this.spare_parts = response.data;
        });
    },
    removeCarFromList(id) {
      for (var i = 0; i < this.spare_parts.length; i++) {
        if (this.spare_parts[i].id === id) {
          this.spare_parts.splice(i, 1);
        }
      }
    },
    reloadSparePartsList() {
      this.call_GET_user_customer_car_repair_spare_parts();
    },
    updateCar(spare_part) {
      this.updating_data = spare_part;
      this.sideBarContent = "update";
    },
    onCancel() {
      this.updating_data = null;
      this.sideBarContent = "create";
    },
    onSave() {
      this.reloadSparePartsList();
      this.updating_data = null;
      this.sideBarContent = "create";
    },
  },
  created() {
    this.$store.dispatch("updatePageHeader", "Car Index");
    this.call_GET_user_customer_car_repair_spare_parts();
  },
};
</script>
<style scoped>
.header {
  font-size: 2em;
  text-align: center;
}
</style>
