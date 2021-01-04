<template>
  <div class="parent">
    <p class="header">Create Car</p>
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
          Add
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  props: ["user_id", "customer_id"],
  data() {
    return {
      load: true,
      car: {
        number: "",
        car_type: "",
      },
      rules: {
        number: [
          {
            required: true,
            message: "Please input car number",
            trigger: "change",
          },
        ],
        car_type: [
          {
            required: true,
            message: "Please input car type",
            trigger: "change",
          },
        ],
      },
    };
  },
  methods: {
    call_POST_user_customer_cars() {
      this.$carResource
        .POST_user_customer_cars(this.user_id, this.customer_id, this.car)
        .then(() => {
          this.$emit("onAdd");
        })
        .then(() => {
          this.resetForm("createCar");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_POST_user_customer_cars();
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
