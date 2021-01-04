<template>
  <tr>
    <td style="width:25px">
      <strong>{{ repair.id }}</strong>
    </td>
    <td style="width:100px">{{ repair.kilometer }}</td>
    <td >{{ repair.description }}</td>
    <td style="width:300px">
      <el-button @click="sparePartsIndex">
        Spare Parts
      </el-button>
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
        @click="call_DELETE_user_customer_car_repair"
      />
    </td>
  </tr>
</template>

<script>
export default {
  props: ["user_id", "customer_id", "car_id", "repair"],
  methods: {
    call_DELETE_user_customer_car_repair() {
      this.$carResource
        .DELETE_user_customer_car(this.user_id, this.customer_id, this.car_id, this.repair.id)
        .then(() => {
          this.$emit("onDelete", this.repair.id);
        });
    },
    sparePartsIndex() {
      this.$router.push(
        "/users/" +
          this.user_id +
          "/customers/" +
          this.customer.id +
          "/cars/" +
          this.car_id +
          "/repairs/"+
          this.repair.id+
          "/spare_parts"
      );
    },
    trigerOnUpdate() {
      this.$emit("onUpdate", this.repair);
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
