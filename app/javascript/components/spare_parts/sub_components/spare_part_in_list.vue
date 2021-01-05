<template>
  <tr>
    <td>
      <strong>{{ spare_part.id }}</strong>
    </td>
    <td>{{ spare_part.name }}</td>
    <td>{{ spare_part.serial_number }}</td>
    <td>{{ spare_part.cost }}</td>
    <td>
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
        @click="call_DELETE_user_customer_car_repair_spare_part"
      />
    </td>
  </tr>
</template>

<script>
export default {
  props: ["user_id", "customer_id", "car_id", "repair_id", "spare_part"],
  methods: {
    call_DELETE_user_customer_car_repair_spare_part() {
      this.$sparePartResource
        .DELETE_user_customer_car_repair_spare_part(
          this.user_id,
          this.customer_id,
          this.car_id,
          this.repair_id,
          this.spare_part.id
        )
        .then(() => {
          this.$emit("onDelete", this.spare_part.id);
        });
    },
    trigerOnUpdate() {
      this.$emit("onUpdate", this.spare_part);
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
