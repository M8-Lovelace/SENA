<template>
  <div class="form-container">
    <div class="form">
      <div class="q-mt-xs">
        <q-form @submit="onSubmit" @reset="onReset" class="form">
          <label class="q-mb-md">¿Cuantas boletas tendrá el talonario?</label>
          <q-select
            v-model="ticket"
            :options="tickets"
            label="Escoge una opción"
          />
          <label class="q-my-lg"
            >¿Qué articulo/servicio relacionas tu talonario?</label
          >
          <q-input
            type="text"
            v-model="thing"
            label="Describe lo que quieres premiar"
            lazy-rules
            :rules="[
              (val) =>
                (val && val.length > 0) || 'Por favor ingrese una descripción',
            ]"
          />
          <label class="q-mb-md">Escoge el tipo de artículo</label>
          <q-select
            v-model="item"
            :options="items"
            label="Escoge una opción"
            lazy-rules
            :rules="[
              (val) =>
                (val && val.length > 0) || 'Por favor seleccione un tipo',
            ]"
          />
          <label class="q-mb-md"
            >¿Con que loteria se establece el ganador?</label
          >
          <q-select
            v-model="lottery"
            :options="lotteries"
            label="Escoge una opción"
            lazy-rules
            :rules="[
              (val) =>
                (val && val.length > 0) || 'Por favor seleccione una loteria',
            ]"
          />
          <q-input
            class="anotherWay"
            v-if="lottery == 'Otro Medio'"
            type="text"
            v-model="forExample"
            placeholder="Ejem. Loteria nacional/Instagram Live"
            lazy-rules
            :rules="[
              (val) => (val && val.length > 0) || 'Por favor ingrese un medio',
            ]"
          />
          <label class="q-my-lg">¿Cuando jugarás tu concurso/sorteo?</label>
          <q-input
            type="date"
            v-model="date"
            lazy-rules
            :rules="[
              (val) => (val && val.length > 0) || 'Por favor ingrese un fecha',
              dateBiggerThanToday,
            ]"
          />
          <label class="q-my-lg">¿Cuánto cuesta cada boleta?</label>
          <q-input
            type="number"
            v-model="price"
            label="Precio de cada boleta"
            lazy-rules
            :rules="[
              (val) => (val && val.length > 0) || 'Por favor ingrese un precio',
            ]"
          />
          <div class="q-mb-sm">
            <q-btn label="Crear" class="button" @click="onSubmit()" />
            <q-btn
              label="cancelar"
              to="./"
              @click="onReset()"
              flat
              class="q-ml-sm"
            />
          </div>
        </q-form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useQuasar } from "quasar";
import { ref } from "vue";
import { useRouter } from "vue-router";
import { useStorage } from "@/stores/localStorage";

const storage = useStorage();

const $q = useQuasar();
const router = useRouter();

let ticket = ref({
  label: "Boletas del 00-99(100 Boletas)",
  value: 99,
});
let thing = ref("Portatil");
let item = ref("Tecnología");
let lottery = ref("Lotería de Tolima - Lunes");
let forExample = ref(null);
let date = ref("2024-06-16");
let price = ref(10000);

const tickets = [
  {
    label: "Boletas del 0-09(10 Boletas)",
    value: 9,
  },
  {
    label: "Boletas del 00-99(100 Boletas)",
    value: 99,
  },
  {
    label: "Boletas del 1-43(43 Boletas)",
    value: 43,
  },
];

const lotteries = [
  "Lotería de Cundinamarca - Lunes",
  "Lotería de Tolima - Lunes",
  "Lotería Cruz Roja - Martes",
  "Lotería de Huila - Martes",
  "Lotería de Manizales - Miércoles",
  "Lotería del Meta - Miércoles",
  "Lotería del Valle - Miércoles",
  "Lotería Quindío - Jueves",
  "Lotería de Bogotá - Jueves",
  "Lotería de Santander - Viernes",
  "Lotería de Medellin - Viernes",
  "Lotería Risaralda - Viernes",
  "Lotería de Caldas - Sábado",
  "Loteria de Boyaca - Sábado",
  "Lotería de Cauca - Sábado",
  "Baloto - Miercoles y Sábado",
  "Antioqueñita Día",
  "Antioqueñita Tarde",
  "Cafeterito Noche",
  "Cafeterito Tarde - Lunes a Sábado",
  "Cash Three Día",
  "Cash Three noche",
  "Chontico Día",
  "Chontico Noche",
  "El Dorado Mañana - Lunes a Sábado",
  "El Dorado Noche - Domingo y Sábado",
  "El Dorado Tarde - Lunes a Sábado",
  "Evening",
  "La Caribeña Día",
  "La Caribeña Noche",
  "La Culona Día - Lunes a Sábado",
  "La Culona Noche",
  "La Fantástica Día - Lunes a Sábado",
  "La Fantástica Noche",
  "Motilón Noche",
  "Motilón Tarde",
  "Paisita Día",
  "Paisita Noche",
  "Pijao de Oro",
  "Play Four Día",
  "Play Four Noche",
  "Samán de la Suerte",
  "Sinuano Día",
  "Sinuano Noche",
  "Win 4",
];

const items = [
  "Juguete",
  "Electrodoméstico",
  "Mueble",
  "Ropa",
  "Tecnología",
  "Dinero",
  "Tarjeta de regalo",
  "Viaje",
  "Trago",
  "Comida",
  "Utensilio deportivo",
  "Otro",
];

function dateBiggerThanToday(val) {
  const fechaSeleccionada = new Date(val);
  const hoy = new Date();
  return (
    fechaSeleccionada > hoy || "La fecha seleccionada debe ser mayor que hoy"
  );
}

function isInputsValidate() {
  if (
    ticket.value ||
    thing.value ||
    item.value ||
    lottery.value ||
    date.value ||
    price.value ||
    forExample.value
  ) {
    return false;
  } else {
    return true;
  }
}

function onSubmit() {
  if (isInputsValidate()) {
    $q.dialog({
      message: "Faltan campos por diligenciar u opciones por seleccionar",
      timeout: 2000,
      color: "orange",
      timeout: 2000,
      persistent: true,
    });
  } else {
    $q.dialog({
      title: "Confirmar",
      message: "¿Está seguro que desea crear el talonario?",
      cancel: true,
      persistent: true,
    })
      .onOk(() => {
        console.log(">>>> OK");
        const newTicket = {
          id: (storage.data.length ?? 0) + 1,
          ticket: ticket.value,
          thing: thing.value,
          item: item.value,
          lottery: lottery.value,
          forExample: forExample.value,
          date: date.value,
          price: price.value,
          numbers: generateNumbers(ticket.value.value),
          state: 0, // 0: En curso, 1: Cancelado
        };

        // Añadir el nuevo ticket al estado de la aplicación
        storage.addStorage(newTicket);

        router.push({
          name: "tickets",
          query: { myTicket: newTicket.id },
        });
      })
      .onCancel(() => {
        console.log(">>>> Cancel");
      });
  }
}

function generateNumbers(max) {
  let numbers = [];
  let spaceTicket = {};
  for (let i = 0; i <= max; i++) {
    spaceTicket = {
      number: i,
      owner: "",
      comments: "No registrado",
      celphone: "",
      state: 0, // 0: Disponible, 1: adquirida por pagar, 2: Adquirida y pagada
      methodPayment: 0, // 0: No se asingó, 1: Efectivo, 2: Consignación, 3: Efecty, 4: Daviplata, 5: Paypal, 6: Otro medio
      date: "",
    };
    numbers.push(spaceTicket);
  }
  return numbers;
}

function onReset() {
  ticket.value = null;
  thing.value = null;
  item.value = null;
  lottery.value = null;
  forExample.value = null;
  date.value = null;
  price.value = null;
}
</script>

<style scoped>
.form-container {
  display: flex;
  align-items: center;
  justify-content: center;
}

.form {
  width: 90%;
  min-width: 100px;
  max-width: 370px;
  height: calc(100vh - 180px);
  max-height: 500px;
  margin: 0px auto !important;
  /* overflow: scroll; */
  overflow-x: hidden;
  color: #3aafa9;
}

.form::-webkit-scrollbar {
  display: none;
}

.anotherWay {
  width: 80%;
  margin: 0 auto;
}

.button {
  background-color: #3aafa9;
  color: white;
}
</style>
