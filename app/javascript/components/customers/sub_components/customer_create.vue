<template>
  <div class="parent">
    <p class="header">Create Customer</p>
    <el-form
      v-if="load"
      :model="customer"
      :rules="rules"
      ref="createCustomer"
      label-width="150px "
      label-position="top"
      class="form"
    >
      <el-form-item label="Name" prop="name" required>
        <el-input v-model="customer.name"></el-input>
      </el-form-item>

      <el-form-item label="MobileNumber" prop="mobile_number" required>
        <el-input v-model="customer.mobile_number"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="success" @click="submitForm('createCustomer')">
          Add
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  props:["user_id"],
  data() {
    return {
      load: true,
      customer: {
        name: "",
        mobile_number: "",
      },
      rules: {
        name: [
          { required: true, message: "Please input name", trigger: "change" },
        ],
        mobile_number: [
          { required: true, message: "Please input name", trigger: "change" },
        ],
      },
    };
  },
  methods: {
    call_POST_user_customers() {
      console.log("callShopUpdate");
      this.$customerResource
        .POST_user_customers(this.user_id, this.customer)
        .then(() => {
          this.$emit("onAdd");
        })
        .then(() => {
          this.resetForm("createCustomer");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_POST_user_customers();
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
