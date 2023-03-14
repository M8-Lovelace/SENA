<template>
  <template v-if="isData">
    <div class="q-pt-sm">
      <div class="q-pa-md">
        <div class="row ant">
          <div class="col-6 infoTickets">
            <span class="q-py-xs">
              <img src="../assets/trofeo.png" width="30" />
              <span class="q-ml-sm">
                {{ currentItem[0].thing }}
              </span>
            </span>
            <span class="q-py-xs">
              <i class="icon icon-more"></i>
              <span class="q-ml-sm">
                {{ currentItem[0].price }}
              </span>
            </span>
            <span class="q-py-xs">
              <i class="icon icon-more"></i>
              <span class="q-ml-sm">
                {{ currentItem[0].lottery }}
              </span>
            </span>
            <span class="q-py-xs">
              <i class="icon icon-more"></i>
              <span class="q-ml-sm">
                {{ currentItem[0].date }}
              </span>
            </span>
            <div class="row justify-end">
              <button>
                <span>Editar</span>
                <i class="icon icon-more"></i>
              </button>
            </div>
          </div>
          <div class="col-6">
            <h1>Laura Susano</h1>
          </div>
        </div>
      </div>
    </div>
  </template>
  <template v-else>
    <h1>No hay información</h1>
  </template>
</template>

<script setup>
import { onMounted, computed, ref, watch } from "vue";
import { useRoute } from "vue-router";
import { useStorage } from "@/stores/localStorage";

const route = useRoute();
const storage = useStorage();

let isData = ref(false);

let currentItem = ref(null);
let currentId = computed(() => storage.getActiveId);
let tickets = computed(() => storage.getStorage);

onMounted(() => {
  storage.setActiveId(route.query.myTicket);
});

watch(currentId, () => {
  getCurrentItem();
});

function getCurrentItem() {
  if (tickets.value) {
    currentItem.value = tickets.value.filter((item) => {
      return item.id == currentId.value;
    });
    currentItem.value.length > 0
      ? (isData.value = true)
      : (isData.value = false);
  }
}
</script>

<style scoped>
.infoTickets {
  background-color: #f48825;
  color: white;
  padding: 10px;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  padding: 20px;
}

.infoTickets span {
  font-size: 20px;
}
</style>
