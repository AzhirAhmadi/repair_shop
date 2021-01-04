<template>
  <div class="parent">
    <p class="header">Update Car</p>
    <el-form
      v-if="load"
      :model="car"
      :rules="rules"
      ref="createCar"
      label-width="150px "
      label-position="top"
      class="form"
    >
      <el-form-item label="Car Type" prop="car_type" required>
        <el-input v-model="car.car_type"></el-input>
      </el-form-item>

      <el-form-item label="Car Number" prop="number" required>
        <el-input v-model="car.number"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="success" @click="submitForm('createCar')">
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
  props: ["user_id", "customer_id", "data"],
  data() {
    return {
      load: true,
      car: {
        car_type: "",
        number: "",
      },
      rules: {
        car_type: [
          { required: true, message: "Please input car type", trigger: "change" },
        ],
        number: [
          { required: true, message: "Please input number", trigger: "change" },
        ],
      },
    };
  },
  methods: {
    call_PUT_user_customer() {
      this.$carResource
        .PUT_user_customer_car(this.user_id, this.customer_id, this.car)
        .then(() => {
          this.$emit("onSave");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_PUT_user_customer();
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
    this.car.id = this.data.id;
    this.car.car_type = this.data.car_type;
    this.car.number = this.data.number;
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
