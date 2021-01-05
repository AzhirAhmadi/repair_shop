<template>
  <div class="parent">
    <p class="header">Update Payment</p>
    <el-form
      v-if="load"
      :model="payment"
      :rules="rules"
      ref="updatePayment"
      label-width="150px "
      label-position="top"
      class="form"
    >
      <el-form-item label="Payment Name" prop="value" required>
        <el-input v-model="payment.value"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="success" @click="submitForm('updatePayment')">
          Save
        </el-button>
        <el-button type="danger" @click="terigerOnCancel">
          Cancel
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  props: ["user_id", "customer_id", "car_id", "repair_id", "data"],
  data() {
    return {
      load: true,
      payment: {
        id: null,
        value: "",
      },
      rules: {
        value: [
          {
            required: true,
            message: "Please input payment value",
            trigger: "change",
          },
        ],
      },
    };
  },
  methods: {
    call_PUT_user_customer_car_repair_payment() {
      this.$paymentResource
        .PUT_user_customer_car_repair_payment(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair_id,
          this.payment
        )
        .then(() => {
          this.$emit("onSave");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_PUT_user_customer_car_repair_payment();
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    terigerOnCancel() {
      this.$emit("onCancel");
    },
  },
  created() {
    this.payment.id = this.data.id;
    this.payment.value = this.data.value;
    this.payment.cost = this.data.cost;
    this.payment.serial_number = this.data.serial_number;
  },
};
</script>

<style scoped>
.form {
  width: 100%;
  margin: auto;
}
.parent {
  background: #eee;
  height: 100%;
  padding: 20px;
}
.header {
  font-size: 2em;
  text-align: center;
  margin: auto;
}
</style>
