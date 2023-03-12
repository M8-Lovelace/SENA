<template>
    <div class="q-pt-sm">
        <div class="q-pa-md">
            <div class="row ant">
                <div class="col-6 infoTickets">
                    <span class="q-py-xs">
                        <img src="../assets/trofeo.png" width="30">
                        <span class="q-ml-sm">
                            {{ userData.thing }}
                        </span>
                    </span>
                    <span class="q-py-xs">
                        <i class="icon icon-more"></i>
                        <span class="q-ml-sm">
                            {{ userData.price }}
                        </span>
                    </span>
                    <span class="q-py-xs">
                        <i class="icon icon-more"></i>
                        <span class="q-ml-sm">
                            {{ userData.lottery }}
                        </span>
                    </span>
                    <span class="q-py-xs">
                        <i class="icon icon-more"></i>
                        <span class="q-ml-sm">
                            {{ userData.date }}
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
        <p>{{ userData }}</p>
    </div>
</template>

<script setup>
import { ref, onMounted, onBeforeMount } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const userData = ref()

onMounted(() => {
    userData.value = route.query
})

onBeforeMount(() => {
    userData.value = route.query
})



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
</style>

