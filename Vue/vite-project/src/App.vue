<!-- ----------------------------------------------- -->
<!-- ------------------ v-model -------------------- -->
<!-- Es un puente bidireccional, es reactivo por ambos 
lados -->
<template>
  <div>
    <input type="text" v-model="name"><br><br>
    <button @click="change()">Cambiar</button>
    <h1>{{ name }}</h1>
  </div>
</template>

<script>
// Importar librerias
import { ref } from "vue";
// Exportar el componente
export default {
  // Funcion setup que retorna un objeto con las variables
  // y funciones
  setup() {
    // Variables publicas
    let name = ref("");

    // Funciones
    function change(){
      // El componente se actualiza automaticamente de la 
      // variable name
      name.value = "Hola mundo";
    }
    
    // Retornar las variables y funciones que se van a usar 
    // en el template
    return {
      name,
      change
    }
  }
};
</script>

<!-- ----------------------------------------------- -->
<!-- ------------------- v-on ---------------------- -->
<!-- <template>
  <div>
    <h1>{{ counter }}</h1>
    // Directivas 
    <button @click="sumar()">counter</button>
    <button @click="increment()">increment</button>
  </div>
</template>

<script>
// Importar librerias
import { ref } from "vue";
// Exportar el componente
export default {
  // Funcion setup que retorna un objeto con las variables
  // y funciones
  setup() {
    // Variables publicas
    let counter = ref(0);
    let n = 1;

    // Funciones
    let sumar = () => {
      counter.value+=n;
      if (counter.value > 100) {
        counter.value = 0;
      }
    };

    let increment = () => {
      n += 10;
    };

    // Retornar las variables y funciones que se van a usar
    // en el template
    return {counter, sumar, increment};
  },
};
</script>

<style></style> -->
