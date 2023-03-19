<template>
  <div class="column">
    <img class="image" src="../assets/rifaYa.png" />
    <q-btn class="text-bold button" to="./form" glossy
      >REGISTRAR NUEVO<br />TALONARIO</q-btn
    >
  </div>
</template>

<script setup></script>

<style scoped>
.column {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.image {
  max-width: 600px;
  max-height: 180px;
  margin-bottom: 30px !important;
}

.button {
  background-color: #3aafa9;
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
