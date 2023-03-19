<template>
  <q-layout
    view="lHh lpr lFf"
    container
    style="min-height: 100vh; margin: 0 auto"
  >
    <Header></Header>
    <router-view class="router-view"></router-view>
    <Footer></Footer>
  </q-layout>
</template>
<script setup>
import Header from "./Header.vue";
import Footer from "./Footer.vue";
</script>

<style scoped>
.router-view {
  width: 100vw;
  height: calc(100vh - 100px);
  margin-top: 50px !important;
  overflow: hidden;
}
</style>
