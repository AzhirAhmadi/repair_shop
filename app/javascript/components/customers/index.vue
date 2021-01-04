<template>
  <div style="display: flex;" v-if="customers.length > 0">
    <div style="width:80%">
      <p class="header">Customer List</p>
      <table style="width:100%">
        <tr>
          <table style="width:100%">
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>FinancialAccount</th>
              <th>Moblie</th>
              <th>Actions</th>
            </tr>
            <CustomerInList
              v-for="(customer, index) in customers"
              :customer="customer"
              :key="index"
              @removeFromParent="removeCustomerFromList"
              @onUpdate="updateCustomer"
            />
          </table>
        </tr>
      </table>
    </div>
    <div style="width:20%">
      <Create
        v-if="sideBarContent == 'create'"
        @reloadCustomersList="reloadCustomersList"
      />
      <Update
        v-if="sideBarContent == 'update'"
        @onCancel="onCancel"
        @onSave="onSave"
        :data="updating_data"
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
      console.log("callCustomerIndex");
      this.load = false;
      this.$customerResource
        .GET_user_customers(this.user_id)
        .then((response) => {
          this.customers = response.data;
          console.log(this.customers);
        })
        .then(() => {
          this.load = true;
        });
    },
    removeCustomerFromList(id) {
      for (var i = 0; i < this.customers.length; i++) {
        if (this.customers[i].id === id) {
          this.customers.splice(i, 1);
        }
      }
    },
    reloadCustomersList() {
      this.call_GET_user_customers(this.$store.state.current_user.id);
    },
    updateCustomer(customer) {
      this.updating_data = customer;
      console.log(this.updating_data);
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
    console.log("Shops#update.created");
    this.$store.dispatch("updatePageHeader", "Customer Index");
    this.call_GET_user_customers(this.$store.state.current_user.id);
  },
};
</script>
<style scoped>
.header {
  font-size: 2em;
  text-align: center;
}
</style>
