<template>
  <div style="display: flex;">
    <div class="shop-name" style="cursor: default;">
      <el-button
        type="danger"
        class="back-button"
        icon="el-icon-switch-button"
        circle
        @click="$router.go(-1)"
      />
      <p style="cursor: default;">{{ this.$store.state.current_shop.name }}</p>
      <div></div>
    </div>
    <div class="import-export">
      <el-button
        type="success"
        class="back-button"
        icon="el-icon-upload2"
        circle
        @click="call_GET_export"
      >
        <span>
          <p>ذخیره</p>
        </span>
      </el-button>
      <el-button
        type="danger"
        class="back-button"
        icon="el-icon-download"
        circle
        @click="call_GET_import"
      >
        <span>
          <p>بازیابی</p>
        </span>
      </el-button>
      <div></div>
    </div>
    <div style="width:80%">
      <p class="header">مشتری ها</p>
      <table style="width:100%">
        <tr>
          <table style="width:100%">
            <tr>
              <th style="width:25px">ID</th>
              <th>نام</th>
              <th style="width:100px">شماره موبایل</th>
              <th style="width:300px">حاسب مالی</th>
              <th style="width:400px">فعالیت ها</th>
            </tr>
            <CustomerInList
              v-for="(customer, index) in customers"
              :key="index"
              :user_id="user_id"
              :customer="customer"
              @onDelete="removeCustomerFromList"
              @onUpdate="updateCustomer"
            />
          </table>
        </tr>
      </table>
    </div>
    <div style="width:20%">
      <Create
        v-if="sideBarContent == 'create'"
        :user_id="user_id"
        @onAdd="reloadCustomersList"
      />
      <Update
        v-if="sideBarContent == 'update'"
        :user_id="user_id"
        :data="updating_data"
        @onCancel="onCancel"
        @onSave="onSave"
      />
    </div>
  </div>
</template>

<script>
import CustomerInList from "./sub_components/customer_in_list";
import Create from "./sub_components/customer_create";
import Update from "./sub_components/customer_update";

export default {
  props: ["user_id"],
  components: {
    CustomerInList,
    Create,
    Update,
  },
  data() {
    return {
      load: true,
      customers: [],
      sideBarContent: "create",
      updating_data: null,
    };
  },
  methods: {
    call_GET_user_customers() {
      this.load = false;
      this.$customerResource
        .GET_user_customers(this.user_id)
        .then((response) => {
          this.customers = response.data;
        })
        .then(() => {
          this.load = true;
        });
    },
    call_GET_import() {
      this.$dataResource.GET_import().then((response) => {
        this.reloadCustomersList();
      });
    },
    call_GET_export() {
      this.$dataResource.GET_export();
    },
    removeCustomerFromList(id) {
      for (var i = 0; i < this.customers.length; i++) {
        if (this.customers[i].id === id) {
          this.customers.splice(i, 1);
        }
      }
    },
    reloadCustomersList() {
      this.call_GET_user_customers();
    },
    updateCustomer(customer) {
      this.updating_data = customer;
      this.sideBarContent = "update";
    },
    onCancel() {
      this.updating_data = null;
      this.sideBarContent = "create";
    },
    onSave() {
      this.reloadCustomersList();
      this.updating_data = null;
      this.sideBarContent = "create";
    },
  },
  created() {
    this.call_GET_user_customers();
  },
};
</script>
<style scoped>
.header {
  font-size: 2em;
  text-align: center;
}
.import-export {
  margin-left: 220px;
  margin-top: 5px;
  position: absolute;
  width: 200px;
  height: 50px;
  display: flex;
  cursor: pointer;
}
.import-export button p {
  font-size: 18px;
  position: absolute;
  margin-top: 10px;
}
.import-export button span {
  margin-left: -5px;
}
</style>
