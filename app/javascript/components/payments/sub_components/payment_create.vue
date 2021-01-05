<template>
  <div class="parent">
    <p class="header">Create Payment</p>
    <el-form
      v-if="load"
      :model="payment"
      :rules="rules"
      ref="createPayment"
      label-width="150px "
      label-position="top"
      class="form"
    >
      <el-form-item label="Payment Value" prop="value" required>
        <el-input v-model="payment.value"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="success" @click="submitForm('createPayment')">
          Add
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  props: ["user_id", "customer_id", "car_id", "repair_id"],
  data() {
    return {
      load: true,
      payment: {
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
    call_POST_user_customer_car_repair_payments() {
      this.$paymentResource
        .POST_user_customer_car_repair_payments(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair_id,
          this.payment
        )
        .then(() => {
          this.$emit("onAdd");
        })
        .then(() => {
          this.resetForm("createPayment");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_POST_user_customer_car_repair_payments();
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
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
