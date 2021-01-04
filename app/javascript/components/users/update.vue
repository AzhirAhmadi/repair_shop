<template>
  <el-form
    v-if="load"
    :model="user"
    :rules="rules"
    ref="createUser"
    label-width="150px "
  >
    <el-form-item label="Email" prop="email" required>
      <el-input v-model="user.email"></el-input>
    </el-form-item>

    <el-form-item label="Password" prop="password" required autocomplete="off">
      <el-input v-model="user.password" clearable />
    </el-form-item>

    <el-form-item label="Confirm" prop="confirm" autocomplete="off">
      <el-input v-model="user.confirm" clearable />
    </el-form-item>

    <el-form-item>
      <el-button type="success" @click="submitForm('createUser')">
        Save
      </el-button>
      <el-button type="danger" @click="cancel"> Cancel </el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import router from "../../packs/router";

export default {
  props: ["id"],
  data() {
    var validateConfirm = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("Please input the password again"));
      } else if (value !== this.user.password) {
        callback(new Error("Two inputs don't match!"));
      } else {
        callback();
      }
    };
    return {
      load: true,
      user: {
        email: "",
        password: "",
        confirm: "",
      },
      rules: {
        email: [
          { required: true, message: "Please input email", trigger: "change" },
          {
            type: "email",
            message: "Please input correct email address",
            trigger: ["blur", "change"],
          },
        ],
        password: [
          {
            required: true,
            message: "Please input password",
            trigger: "change",
          },
          { min: 6, message: "Length should more then 6", trigger: "blur" },
        ],
        confirm: [{ validator: validateConfirm, trigger: "blur" }],
      },
    };
  },
  methods: {
    call_PUT_user() {
      this.$userResource
        .PUT_user(this.id, this.user)
        .then((response) => {
          this.$store.dispatch("updateCurrentUser", response.data);
        })
        .then(() => {
          this.$router.go(-1);
        });
    },
    cancel() {
      this.$router.go(-1);
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_PUT_user();
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
  computed: {
    current_user() {
      return this.$store.state.current_user;
    },
  },
  created() {
    this.$store.dispatch("updatePageHeader", "Update User");
    this.user = this.current_user;
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
