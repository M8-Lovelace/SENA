<template>
  <div class="d-flex p-3">
    <div class="mt-5 m-auto" v-show="botones">
      <h2 class="text-center pb-3 text-light"><b>Elige una categoria:</b></h2>
      <div class="d-flex justify-content-center p-3">
        <button type="button" class="btn btn-primary me-3 p-4" @click="palabraAleatoria(colores)">Colores</button>
        <button type="button" class="btn btn-primary me-3 p-4" @click="palabraAleatoria(animales)">Animales</button>
        <button type="button" class="btn btn-primary p-4" @click="palabraAleatoria(nombres)">Nombres</button>
      </div>
    </div>
    <div v-show="juego" class="w-100">
      <div class="row">
        <div class="col-10 col-sm-9 col-xl-3 mt-5 m-auto p-5">
          <div class="d-flex justify-content-center">
            <div class="p-2">
              <img :src="imagen" alt="ahorcado" width="500" height="500">
            </div>
          </div>
          <div class="w-50 d-flex justify-content-center palabra text-light">
            <div class="px-2 my-5 fs-5" v-for="(letra, i) in lineas" :key="i">
              <span class="letra fs-3"><u>{{ letra }}</u></span>
            </div>
          </div>
        </div>
        <div class="col-10 col-sm-9 col-xl-5 tecladoContainer mt-5">
          <div v-for="(abc, i) in letras" :key="abc">
            <button :style="desabilitar" class="p-2 button" :disabled="boton" @click="letraSeleccionada(abc)">{{ abc
            }}</button>
          </div>
        </div>
      </div>
      <div v-show="mensaje">
        <div v-show="resultado" class="alert alert-success mt-5 fs-1 text-center" role="alert">
          Felicitaciones Ganaste!
        </div>
        <div v-show="resultado2" class="alert alert-danger mt-5 fs-1 text-center" role="alert">
          Lo siento, perdiste :(
        </div>
      </div>
      <div class="row">
        <div class="col-12 d-flex justify-content-center mt-4">
          <button class="reiniciar text-light w-25 fs-3" @click="reiniciar()">REINICIAR</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
export default {
  setup() {
    let array = ref();
    let botones = ref(true);
    let boton = ref(false);
    let juego = ref(false);
    let palabra = ref();
    let lineas = ref();
    let letraDesabilitada = ref();
    let intentos = ref(0);
    let mensaje = ref(false);
    let resultado = ref(false);
    let resultado2 = ref(false);
    let desabilitar = ref()

    let imagen = ref('https://st2.depositphotos.com/1041372/8626/v/600/depositphotos_86262436-stock-illustration-simple-doodle-of-a-hangmans.jpg')

    const letras = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'ñ', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

    const colores = ref([
      "rojo", "azul", "morado", "amarillo", "naranja",
      "verde", "negro", "blanco"
    ]);

    const animales = ref([
      "perro", "gato", "vaca", "oveja", "canguro", "jirafa",
      "tigre", "leon"
    ]);

    const nombres = ref([
      "alexa", "javier", "alvaro", "natalia", "dayana", "carlos",
      "diego", "andrea",
    ]);

    function palabraAleatoria(arrays) {
      botones.value = false
      juego.value = true
      let numero = Math.floor(Math.random() * arrays.length);
      palabra.value = arrays[numero].split("");
      console.log(palabra.value);
      dibujarLineas(palabra.value.length);
    }

    function dibujarLineas(numero) {
      lineas.value = [];
      for (let i = 0; i < numero; i++) {
        lineas.value.push("____");
      }
    }

    function encontrarCoincidencias(letra) {
      console.log(letra);
      let coincidencias = [];
      for (let i = 0; i < palabra.value.length; i++) {
        if (palabra.value[i] === letra) {
          coincidencias.push(palabra.value[i]);
        }
      }
      return coincidencias;
    }

    function letraSeleccionada(letra) {
      letraDesabilitada.value = letra;

      let coincidencias = encontrarCoincidencias(letra);
      for (let i = 0; i < palabra.value.length; i++) {
        if (palabra.value[i] === letra) {
          coincidencias.push(letra);
          lineas.value[i] = letra;
        }
      }

      if (!lineas.value.includes("____")) {
        mensaje.value = true
        resultado.value = true;
        desabilitar.value = 'background-color: gray'
      }

      if (coincidencias.length === 0) {
        verificarIntentos()
      }
    }

    function verificarIntentos() {
      intentos.value = intentos.value + 1

      if (intentos.value == 1) {
        imagen.value = 'src/assets/imagen1.png';
      } else if (intentos.value == 2) {
        imagen.value = 'src/assets/imagen2.png';
      } else if (intentos.value == 3) {
        imagen.value = 'src/assets/imagen3.png';
      } else if (intentos.value == 4) {
        imagen.value = 'src/assets/imagen4.png';
      } else if (intentos.value == 5) {
        imagen.value = 'src/assets/imagen5.png';
      } else if (intentos.value == 6) {
        imagen.value = 'src/assets/imagen6.png';
        boton.value = true;
        mensaje.value = true
        resultado2.value = true;
        desabilitar.value = 'background-color: gray'
      }
    }

    function reiniciar() {
      imagen.value = 'https://st2.depositphotos.com/5485596/8571/v/950/depositphotos_85710850-stock-illustration-hangman-doodle.jpg'
      intentos.value = 0;
      boton.value = false;
      juego.value = false;
      botones.value = true;
      mensaje.value = false;
      resultado2.value = false;
      desabilitar.value = ''
    }

    return {
      palabraAleatoria,
      array,
      botones,
      nombres,
      animales,
      colores,
      letras,
      juego,
      lineas,
      letraSeleccionada,
      letraDesabilitada,
      imagen,
      boton,
      reiniciar,
      mensaje,
      resultado,
      resultado2,
      desabilitar
    }
  }
}

</script>

<style scoped>
.tecladoContainer {
  display: grid;
  margin: 0 auto;
  grid-template-columns:
    repeat(5, minmax(100px, 1fr));
  align-items: stretch;
}

.button {
  border: 5px solid rgb(253, 253, 253);
  width: 80%;
  font-size: 30px;
  font-weight: bold;
  background-color: rgb(0, 0, 0);
  color: white;
}

.button:hover {
  background-color: rgb(253, 253, 253);
  color: black;
}

.palabra {
  max-width: 75%;
  min-width: 100%;
}

.reiniciar:hover {
  background-color: rgb(253, 253, 253);
  color: black;
}

@media screen and (max-width: 1200px) {
  .tecladoContainer{
    row-gap: 10px;
    padding: 0;
  }

  .reiniciar{
    margin: 20px;
  }
}

</style>