<template>
  <tr>
    <td>
      <strong>{{ customer.id }}</strong>
    </td>
    <td>{{ customer.name }}</td>
    <td>0</td>
    <td>{{ customer.mobile_number }}</td>
    <td>
      <el-button @click="cars_index">
        Cars
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
        @click="call_DELETE_user_customer"
      />
    </td>
  </tr>
</template>

<script>
export default {
  props: ["user_id", "customer"],
  methods: {
    call_DELETE_user_customer() {
      this.$customerResource
        .DELETE_user_customer(this.user_id, this.customer.id)
        .then(() => {
          this.$emit("onDelete", this.customer.id);
        });
    },
    cars_index() {
      this.$router.push(
        "/users/" +
          this.user_id +
          "/customers/" +
          this.customer.id +
          "/cars"
      );
    },
    trigerOnUpdate() {
      this.$emit("onUpdate", this.customer);
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
