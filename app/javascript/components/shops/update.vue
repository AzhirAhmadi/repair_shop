<template>
  <el-form
    v-if="load"
    :model="shop"
    :rules="rules"
    ref="createShop"
    label-width="150px "
  >
    <el-form-item label="Name" prop="name" required>
      <el-input v-model="shop.name"></el-input>
    </el-form-item>

    <el-form-item>
      <el-button type="success" @click="submitForm('createShop')">
        Save
      </el-button>
      <el-button type="danger" @click="cancel"> Cancel </el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import router from "../../packs/router";

export default {
  props: ["user_id"],
  data() {
    return {
      load: true,
      shop: {
        name: "",
      },
      rules: {
        name: [
          { required: true, message: "Please input name", trigger: "change" },
        ],
      },
    };
  },
  methods: {
    call_PUT_user_shop() {
      this.$shopResource
        .PUT_user_shop(this.user_id, this.shop)
        .then((response) => {
          this.$store.dispatch("updateCurrentShop", response.data);
        })
        .then(() => {
          this.$router.go(-1);
        });
    },
    call_GET_user_shop() {
      this.$shopResource.GET_user_shop(this.user_id).then((response) => {
        this.$store.dispatch("updateCurrentShop", response.data);
        this.shop = response.data;
      });
    },
    cancel() {
      this.$router.go(-1);
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.call_PUT_user_shop();
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
    this.$store.dispatch("updatePageHeader", "Update Shop");
    this.call_GET_user_shop();
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
