<template>
  <Layout></Layout>
</template>
<script setup>
import Layout from "./components/Layout.vue";
</script>

<style>
/* Load icons as font */
@import "./assets/icomoon/style.css";
@import url("https://fonts.googleapis.com/css2?family=Lato:wght@300&display=swap");

/* Set border box for all elements, delete padding and margin */
html,
body {
  margin: 0 !important;
  padding: 0 !important;
  box-sizing: border-box;
  width: 100vw;
  height: 100vh;
  font-family: "Lato", sans-serif;
}
</style>
