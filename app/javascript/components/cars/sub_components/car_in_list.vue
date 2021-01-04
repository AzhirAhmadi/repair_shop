<template>
  <tr>
    <td style="width:25px">
      <strong>{{ car.id }}</strong>
    </td>
    <td style="width:200px">{{ car.car_type }}</td>
    <td>{{ car.number }}</td>
    <td style="width:300px">
      <el-button @click="rapairs_index">
        Repairs
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
        @click="call_DELETE_user_customer_car"
      />
    </td>
  </tr>
</template>

<script>
export default {
  props: ["user_id", "customer_id", "car"],
  methods: {
    call_DELETE_user_customer_car() {
      this.$carResource
        .DELETE_user_customer_car(this.user_id, this.customer_id, this.car.id)
        .then(() => {
          this.$emit("onDelete", this.car.id);
        });
    },
    rapairs_index() {
      this.$router.push(
        "/users/" +
          this.user_id +
          "/customers/" +
          this.customer_id +
          "/cars/" +
          this.car.id +
          "/repairs"
      );
    },
    trigerOnUpdate() {
      this.$emit("onUpdate", this.car);
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
