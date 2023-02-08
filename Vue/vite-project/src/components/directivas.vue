<!-------------------- DIRECTIVAS --------------------->

<!----------------------------------------------------->
<!----------------------- v-if ------------------------>
<!-- <h1 :style="n==0?'background-color:gray':n>0?'background-color:blue':'background-color:red'">color</h1> -->
<!-- <template>
  <div>
    <input type="text" v-model="n" />
    <img
      v-if="n == 0"
      src="https://www.arsys.es/blog/file/uploads/2020/04/01-vuejs.jpg"
      alt=""
    />
    <img
      v-else-if="n > 0 && n < 10"
      src="https://i0.wp.com/blog.webtraining.zone/wp-content/uploads/2018/01/curso-profesional-vue.jpg?resize=825%2C510&ssl=1"
      alt=""
    />
    <img
      v-else
      src="https://lenguajejs.com/vuejs/introduccion/que-es-vue/vuejs.png"
      alt=""
    />
  </div>
</template>

<script>
import { ref } from "vue";
export default {
  setup() {
    let n = ref(0);
    //n.value>0?"positivo":"negativo"
    return {
      n,
    };
  },
};
</script> -->

<!----------------------------------------------------->
<!---------------------- v-bind ----------------------->
<!-- <template>
  <div>
    <div v-bind:style="color"></div>
    <img v-bind:src="img" alt="" /><br /><br />
    <button @click="cambiar()" style="boder">Cambiar</button>
  </div>
</template>

<script>
// Importar librerias
import { ref } from "vue";
// Exportar el componente
export default {
  setup() {
    // Variables publicas
    let img = ref(
      "https:www.arsys.es/blog/file/uploads/2020/04/01-vuejs.jpg"
    );
    let color = ref("background-color: blue; height: 100px;");

    function cambiar() {
      img.value =
        "https:www.anerbarrena.com/wp-content/uploads/2017/08/programacion-javascript-js-e1503258707880.jpg";
      color.value = "background-color:red ; height: 100px;";
    }

     // Retornar las variables y funciones que se van a usar
     // en el template
    return {
      img,
      cambiar,
      color
    };
  },
};
</script>

<style></style> -->


<!----------------------------------------------------->
<!--------------------- v-model ----------------------->
<!-- Es un puente bidireccional, es reactivo por ambos 
lados -->
<!-- <template>
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
</script> -->

<!----------------------------------------------------->
<!---------------------- v-on ------------------------->
<!-- <template>
  <div>
    <h1>{{ counter }}</h1>
    Directivas
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
