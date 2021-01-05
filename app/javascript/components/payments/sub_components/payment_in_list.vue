<template>
  <tr>
    <td>
      <strong>{{ payment.id }}</strong>
    </td>
    <td>{{ $helpers.dateFromat(payment.updated_at) }}</td>
    <td>{{ $helpers.money(payment.value) }}</td>
    <td>
      <el-button
        type="primary"
        icon="el-icon-edit"
        circle
        @click="trigerOnUpdate"
      />
      <el-button
        type="danger"
        icon="el-icon-delete"
        circle
        @click="call_DELETE_user_customer_car_repair_payment"
      />
    </td>
  </tr>
</template>

<script>
export default {
  props: ["user_id", "customer_id", "car_id", "repair_id", "payment"],
  methods: {
    call_DELETE_user_customer_car_repair_payment() {
      this.$paymentResource
        .DELETE_user_customer_car_repair_payment(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair_id,
          this.payment.id
        )
        .then(() => {
          this.$emit("onDelete", this.payment.id);
        });
    },
    trigerOnUpdate() {
      this.$emit("onUpdate", this.payment);
    },
  },
};
</script>

<style scoped>
td,
th {
  border: 1px solid #888;
  text-align: center;
  padding: 0px 8px 0px 8px;
}

tr:nth-child(even) {
  background-color: #eee;
}
</style>
