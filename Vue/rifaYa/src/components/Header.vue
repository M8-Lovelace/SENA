<template>
  <q-header elevated class="header">
    <q-toolbar >
      <div class="father">
        <q-btn
          @click="toggleMenu()"
          flat
          round
          dense
          icon="menu"
          class="q-mr-sm"
        />
        <div v-show="showMenu" class="child">
          <Sidebar></Sidebar>
        </div>
      </div>
      <q-toolbar-title class="q-ml-lg text-bold">Talonario 1</q-toolbar-title>
      <img src="../assets/coin.png" class="image q-mt-xs" width="60">
      <q-btn flat round dense>
        <i class="icon icon-more"></i>
      </q-btn>
    </q-toolbar>
  </q-header>
</template>

<script setup>
import { ref } from "vue";
import Sidebar from "./Sidebar.vue";
const showMenu = ref(false);

const toggleMenu = () => {
  showMenu.value = !showMenu.value;
};
</script>

<style scoped>
.header{
  background-color: #F48825;
  color: white;
}

.father{
  position: relative;
}

.child{
  position: absolute;
  top: 42px;
  left: -12px;
  background-color: #1976D2;
  width: 80px;
  height: calc(100vh - 50px);
  z-index: 1;
}
</style>
