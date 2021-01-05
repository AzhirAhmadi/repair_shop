<template>
  <div style="position: absolute; top: 0; right: 0; bottom: 0; left: 0;">
    <router-view />
  </div>
</template>

<script>
export default {};
</script>
<style>
div {
  height: 100%;
}

.back-button {
  height: 50px;
  width: 50px;
  font-size: 32px;
  color: #606266;
  transition: color 0.15s linear;
  position: unset;
  margin: 1.9px 0;
  border: 1.9px solid #000;
  padding: 0 !important;
}
.shop-name {
  position: absolute;
  width: 200px;
  height: 50px;
  margin: 5px;
  display: flex;
  cursor: pointer;
}

.shop-name div {
  border: 2px solid #000;
  position: absolute;
  width: 200px;
  height: 50px;
  border-radius: 37.5px;
  top: 0;
  z-index: -1;
}
.shop-name p {
  font-size: 16px;
  align-self: center;
  margin: 0 0 0 5px;
  cursor: pointer;
}
</style>
