<!-------------------- DIRECTIVAS --------------------->

<!-- <----------------- PAR O INPAR ------------------->
<!-- <template>
<div>
  <h1>{{ rta }}</h1>
  <input type="number" v-model="n" placeholder="Ingrese un número"><br><br>
  <button @click="verificar()">Verificar</button>
  <button @click="limpiar()" id="limpiar">Limpiar</button>
</div>
</template>

<script>
// Importar librerias
import { ref } from "vue";
// Exportar el componente
export default {
  setup() {
    // Variables publicas
    let n = ref("");
    let rta = ref("");

    // Funciones
    let verificar = () => {
      if (n.value == "") {
        rta.value = `Ingrese un número`;
      } else if(n.value == 0){
        rta.value = `El número ${n.value} es neutro`;
      } else if(n.value % 2 == 0) {
        rta.value = `El número ${n.value} es par`;
      } else if(n.value % 2 != 0){
        rta.value = `El número ${n.value} es inpar`;
      }
    };

    let limpiar = () => {
      n.value = "";
      rta.value = "";
    }

    // Retornar las variables y funciones que se van a usar
    // en el template
    return { 
      n, rta, verificar, limpiar
    };
  },
}

</script> -->

<!----------------------------------------------------->
<!---------------- Negativo o Positivo ---------------->

<!-- <template>
  <div>
    <h1 v-bind:style="color">{{ rta }}</h1>
    <input type="number" v-model="n" placeholder="Ingrese un número"><br><br>
    <button @click="verificar()">Verificar</button>
    <button @click="limpiar()" id="limpiar">Limpiar</button>
  </div>
</template>

<script>
// Importar librerias
import { ref } from "vue";
// Exportar el componente
export default {
  setup() {
    // Variables publicas
    let n = ref("");
    let rta = ref("");
    let color = ref("color: black");

    // Funciones
    let verificar = () => {
      if (n.value < 0) {
        rta.value = `El número ${n.value} es negativo`;
        color.value = "color: red";
      } else if(n.value > 0){
        rta.value = `El número ${n.value} es positivo`;
        color.value = "color: green";
      } else if (n.value == 0) {
        rta.value = `El número 0 es neutro`;
        color.value = "color: blue";
      }
    };

    let limpiar = () => {
      n.value = "";
      rta.value = "";
      color.value = "color: black";
    }

    // Retornar las variables y funciones que se van a usar
    // en el template
    return { 
      n, rta, verificar, limpiar, color
    };
  },
}

</script>

<style>
  button{
    margin: 5px;
  }
</style> -->
