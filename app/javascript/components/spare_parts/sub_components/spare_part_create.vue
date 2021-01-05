<template>
  <div class="parent">
    <p class="header">Create SparePart</p>
    <el-form
      v-if="load"
      :model="spare_part"
      :rules="rules"
      ref="createSparePart"
      label-width="150px "
      label-position="top"
      class="form"
    >
      <el-form-item label="SparePart Name" prop="name" required>
        <el-input v-model="spare_part.name"></el-input>
      </el-form-item>

      <el-form-item label="SparePart Cost" prop="cost" required>
        <el-input v-model="spare_part.cost"></el-input>
      </el-form-item>

      <el-form-item label="SparePart SerialNumber" prop="serial_number" required>
        <el-input v-model="spare_part.serial_number"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="success" @click="submitForm('createSparePart')">
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
      spare_part: {
        name: "",
        cost: "",
        serial_number: "",
      },
      rules: {
        name: [
          {
            required: true,
            message: "Please input spare_part name",
            trigger: "change",
          },
        ],
        cost: [
          {
            required: true,
            message: "Please input spare_part cost",
            trigger: "change",
          },
        ],
        serial_number: [
          {
            required: true,
            message: "Please input spare_part serial_number",
            trigger: "change",
          },
        ],
      },
    };
  },
  methods: {
    call_POST_user_customer_car_repair_spare_parts() {
      this.$sparePartResource
        .POST_user_customer_car_repair_spare_parts(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair_id,
          this.spare_part
        )
        .then(() => {
          this.$emit("onAdd");
        })
        .then(() => {
          this.resetForm("createSparePart");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_POST_user_customer_car_repair_spare_parts();
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
