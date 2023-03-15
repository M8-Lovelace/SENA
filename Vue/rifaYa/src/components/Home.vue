<template>
    <div class="row q-mt-xl">
        <div class="col-12 column q-my-xs q-py-xs">
            <img src="../assets/rifaYa.png" class="image">
        </div>
        <div class="col-12 column q-my-xl">
            <q-btn class="text-bold button" to="./form" glossy>REGISTRAR NUEVO<br>TALONARIO</q-btn>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'

let text = ref('')

</script>

<style scoped>
.column {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.image {
    width: 100%;
    height: 100%;
    max-width: 600px;
}

.button {
    background-color: #3AAFA9;
    color: white;
    width: 90%;
    max-width: 270px;
    font-size: 1.2rem;
    animation-duration: 2s;
    animation-iteration-count: infinite;
    transform-origin: bottom;
}

.button:hover {
    animation-name: bounce;
    animation-timing-function: ease;
}

@keyframes bounce {
    0% {
        transform: translateY(0);
    }

    50% {
        transform: translateY(-30px);
    }

    100% {
        transform: translateY(0);
    }
}
</style>