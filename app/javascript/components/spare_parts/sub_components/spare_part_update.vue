<template>
  <div class="parent">
    <p class="header">Update SparePart</p>
    <el-form
      v-if="load"
      :model="spare_part"
      :rules="rules"
      ref="updateSparePart"
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

      <el-form-item
        label="SparePart SerialNumber"
        prop="serial_number"
        required
      >
        <el-input v-model="spare_part.serial_number"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="success" @click="submitForm('updateSparePart')">
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
      spare_part: {
        id: null,
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
    call_PUT_user_customer_car_repair_spare_part() {
      this.$sparePartResource
        .PUT_user_customer_car_repair_spare_part(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair_id,
          this.spare_part
        )
        .then(() => {
          this.$emit("onSave");
        });
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_PUT_user_customer_car_repair_spare_part();
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
    this.spare_part.id = this.data.id;
    this.spare_part.name = this.data.name;
    this.spare_part.cost = this.data.cost;
    this.spare_part.serial_number = this.data.serial_number;
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
