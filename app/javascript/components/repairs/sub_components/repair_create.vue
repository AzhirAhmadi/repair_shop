<template>
  <div class="parent">
    <p class="header">Create Repair</p>
    <el-form
      v-if="load"
      :model="repair"
      :rules="rules"
      ref="createRepair"
      label-width="150px "
      label-position="top"
      class="form"
    >
      <el-form-item label="Repair Kilometer" prop="kilometer" required>
        <el-input v-model="repair.kilometer"></el-input>
      </el-form-item>

      <el-form-item label="Repair Description" prop="description" required>
        <el-input v-model="repair.description"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="success" @click="submitForm('createRepair')">
          Add
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  props: ["user_id", "customer_id", "car_id"],
  data() {
    return {
      load: true,
      repair: {
        description: "",
        kilometer: "",
      },
      rules: {
        kilometer: [
          {
            required: true,
            message: "Please input repair kilometer",
            trigger: "change",
          },
        ],
        description: [
          {
            required: true,
            message: "Please input repair description",
            trigger: "change",
          },
        ],
      },
    };
  },
  methods: {
    call_POST_user_customer_car_repairs() {
      this.$repairResource
        .POST_user_customer_car_repairs(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair
        )
        .then(() => {
          this.$emit("onAdd");
        })
        .then(() => {
          this.resetForm("createRepair");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_POST_user_customer_car_repairs();
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
