<template>
    <template v-if="isData">
        <div class="q-pt-sm">
        <div class="q-pa-md">
            <div class="row ant">
                <div class="col-6 infoTickets">
                    <span class="q-py-xs">
                        <img src="../assets/trofeo.png" width="30">
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
                    <h1>hola2</h1>
                </div>
            </div>
        </div>
        <p>{{ ticket }}</p>
    </div>
    </template>
    <template v-else >
        <h1>No hay información</h1>
    </template>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
let ticket = ref([])
let currentItem = ref(null)
let isData = ref(false)

onMounted(() => {
    getCurrentItem()
})

function getCurrentItem() {
    ticket.value = JSON.parse(localStorage.getItem("myTickets")) ?? []
    if (ticket.value) {
        currentItem.value = ticket.value.filter((item) => {
            return item.id == route.query.myTicket
        })
        currentItem.value.length > 0 ? isData.value = true : isData.value = false
    }
}
</script>

<style scoped>
.infoTickets {
    background-color: #F48825;
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

