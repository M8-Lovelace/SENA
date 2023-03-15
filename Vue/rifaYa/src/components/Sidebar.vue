<template>
  <div>
    <q-list>
      <q-item clickable v-ripple class="items home">
        <q-item-section avatar class="q-pa-none item">
          <RouterLink to="./">
            <h5>Home</h5>
            <hr class="full-width">
          </RouterLink>
        </q-item-section>
      </q-item>
      <template v-for="(ticket, index) in tickets" class="iconsList">
        <q-item clickable @click="setActiveId(tickets[index]['id'])" v-ripple class="items">
          <q-item-section avatar class="q-pa-none item">
            <a>
              <h5>Talonario {{ ticket.id }}</h5>
              <hr />
            </a>
          </q-item-section>
        </q-item>
      </template>
    </q-list>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { useStorage } from "@/stores/localStorage";
import { useRouter } from "vue-router";

// Instancias
const router = useRouter();
const storage = useStorage();

// Variables
let tickets = computed(() => storage.getStorage);

// Funciones
function setActiveId(index) {
  storage.setActiveId(index);
  router.push({
    name: "tickets",
    query: { myTicket: index },
  });
}
</script>

<style scoped>
.items {
  padding: 12px;
  margin-top: 30px;
  width: 100%;
}

i {
  font-size: 1.6rem;
  color: white;
  /* -webkit-text-stroke: 1px; */
  font-weight: bold;
}

.iconsList {
  margin-top: 15px;
}

.item {
  height: 20px;
}

a {
  padding: 10px;
  text-decoration: none;
}

.item h5 {
  margin: 0;
  color: white;
}

hr {
  color: white;
}
</style>
