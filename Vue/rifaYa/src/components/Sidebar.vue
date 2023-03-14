<template>
    <div>
        <q-list v-for="(ticket, index) in tickets" class="iconsList">
            <q-item clickable v-ripple class="items">
                <q-item-section avatar class="q-pa-none item">
                    <router-link to="">
                        <h5>Talonario {{ ticket.id }}</h5>
                        <hr>
                    </router-link>
                </q-item-section>
            </q-item>
        </q-list>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
let tickets = ref([])
let isData = ref(false)

// iterar arrelgo de objetos localstorage
onMounted(() => {
    getCurrentItem()
})

function getCurrentItem() {
    tickets.value = JSON.parse(localStorage.getItem("myTickets")) ?? []
    if (tickets.value) {
        tickets.value.length > 0 ? isData.value = true : isData.value = false
    }
}

</script>

<style scoped>
i {
    font-size: 1.6rem;
    color: white;
    /* -webkit-text-stroke: 1px; */
    font-weight: bold;
}

.iconsList {
    margin-top: 15px
}

.items {
    padding: 12px;
    margin-top: 30px;
}

.item{
    height: 20px;
}

a{
    padding: 10px;
}

.item h5{
    margin: 0;
    color: white;
}

hr{
    color: white;
}

a {
    text-decoration: none
}
</style>