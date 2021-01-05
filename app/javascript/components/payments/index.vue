<template>
  <div style="display: flex;">
    <div class="shop-name" @click="$router.go(-1)">
      <el-button class="back-button" icon="el-icon-back" circle />
      <p>Repairs List</p>
      <div></div>
    </div>
    <div style="width:80%">
      <p class="header">Payments List</p>
      <table v-if="payments.length > 0" style="width:100%">
        <tr>
          <table style="width:100%">
            <tr>
              <th style="width:25px">ID</th>
              <th style="width:300px">Value</th>
              <th>Date</th>
              <th style="width:400px">Actions</th>
            </tr>
            <PaymentInList
              v-for="(payment, index) in payments"
              :key="index"
              :user_id="user_id"
              :customer_id="customer_id"
              :car_id="car_id"
              :repair_id="repair_id"
              :payment="payment"
              @onDelete="removeCarFromList"
              @onUpdate="updateCar"
            />
          </table>
        </tr>
      </table>

      <table v-if="payments.length > 0" style="width:100%">
        <tr style="background: #bbb; height: 30px;">
          <th style="width:100px">Total</th>
          <th></th>
          <th style="width:300px">{{ $helpers.numberWithCommas(totalValue()) }}</th>
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
        @onAdd="PeloadpaymentsList"
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
import PaymentInList from "./sub_components/payment_in_list";
import Create from "./sub_components/payment_create";
import Update from "./sub_components/payment_update";

export default {
  props: ["user_id", "customer_id", "car_id", "repair_id"],
  components: {
    PaymentInList,
    Create,
    Update,
  },
  data() {
    return {
      payments: [],
      sideBarContent: "create",
      updating_data: null,
    };
  },
  methods: {
    call_GET_user_customer_car_repair_payments() {
      this.$paymentResource
        .GET_user_customer_car_repair_payments(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair_id
        )
        .then((response) => {
          this.payments = response.data;
        });
    },
    removeCarFromList(id) {
      for (var i = 0; i < this.payments.length; i++) {
        if (this.payments[i].id === id) {
          this.payments.splice(i, 1);
        }
      }
    },
    PeloadpaymentsList() {
      this.call_GET_user_customer_car_repair_payments();
    },
    updateCar(payment) {
      this.updating_data = payment;
      this.sideBarContent = "update";
    },
    onCancel() {
      this.updating_data = null;
      this.sideBarContent = "create";
    },
    onSave() {
      this.PeloadpaymentsList();
      this.updating_data = null;
      this.sideBarContent = "create";
    },
    totalValue() {
      return this.payments.map((x) => x.value).reduce((a, b) => a + b);
    },
  },
  created() {
    this.$store.dispatch("updatePageHeader", "Car Index");
    this.call_GET_user_customer_car_repair_payments();
  },
};
</script>
<style scoped>
.header {
  font-size: 2em;
  text-align: center;
}
</style>
