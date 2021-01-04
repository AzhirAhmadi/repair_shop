<template>
  <div>
    <el-row>
      <el-col :span="6" :push="9">
        <div style="text-align: center; margin: 0">
          <el-input placeholder="email" v-model="email"></el-input>
          <el-input
            placeholder="password"
            v-model="password"
            show-password
          ></el-input>
        </div>
        <br />
        <div style="text-align: center; margin: 0">
          <el-button type="success" @click="call_POST_login">SingIn</el-button>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: "azhir@test.com",
      password: "123456",
    };
  },
  methods: {
    call_POST_login() {
      this.$deviseResource
        .POST_login(this.email, this.password)
        .then((response) => {
          this.$store.dispatch("updateAuthToken", response.data.jwt);
        })
        .then(this.call_GET_profile);
    },
    call_GET_profile() {
      this.$userResource
        .GET_profile()
        .then((response) => {
          this.$store.dispatch("updateCurrentUser", response.data);
        })
        .then((response) => {
          this.$router.push("/users/" + this.current_user.id + "/shop");
        })
        .then(this.cancel);
    },
  },
};
</script>

<style scoped>
#content {
  text-align: center;
  margin: auto;
}
</style>
