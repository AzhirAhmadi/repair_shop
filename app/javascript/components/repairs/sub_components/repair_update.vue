<template>
  <div class="parent">
    <p class="header">Update Repair</p>
    <el-form
      v-if="load"
      :model="repair"
      :rules="rules"
      ref="updateRepair"
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
        <el-button type="success" @click="submitForm('updateRepair')">
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
  props: ["user_id", "customer_id", "car_id", "data"],
  data() {
    return {
      load: true,
      repair: {
        id: null,
        kilometer: "",
        description: "",
      },
      rules: {
        kilometer: [
          {
            required: true,
            message: "Please input kilometer",
            trigger: "change",
          },
        ],
        description: [
          {
            required: true,
            message: "Please input description",
            trigger: "change",
          },
        ],
      },
    };
  },
  methods: {
    call_PUT_user_customer_car_repair() {
      this.$repairResource
        .PUT_user_customer_car_repair(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair
        )
        .then(() => {
          this.$emit("onSave");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_PUT_user_customer_car_repair();
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
    this.repair.id = this.data.id;
    this.repair.kilometer = this.data.kilometer;
    this.repair.description = this.data.description;
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
