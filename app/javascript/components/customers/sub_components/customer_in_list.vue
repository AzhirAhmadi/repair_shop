<template>
  <tr>
    <td style="width:25px">
      <strong>{{ customer.id }}</strong>
    </td>
    <td style="text-align: left;">{{ customer.name }}</td>
    <td style="width:100px">0</td>
    <td style="width:100px">{{ customer.mobile_number }}</td>
    <td style="width:200px">
      <el-button @click="call_GET_user_customer">
        More
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
  props: ["customer"],
  methods: {
    call_DELETE_user_customer() {
      console.log("callDELETE_user");
      this.$customerResource
        .DELETE_user_customer(this.$store.state.current_user, this.customer.id)
        .then((response) => {
          console.log(response);
        })
        .then(() => {
          this.$emit("removeFromParent", this.customer.id);
        });
    },
    call_GET_user_customer() {
      console.log("call_GET_user_customer");
    },
    trigerOnUpdate(){
      this.$emit("onUpdate", this.customer);
    }
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
