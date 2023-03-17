<template>
  <template v-if="isData">
    <div class="row q-pt-sm">
      <div class="col-12 col-md-5 q-pa-md first">
        <div class="ant row">
          <div class="col-12 col-sm-6 col-md-11 infoTickets">
            <span class="q-py-xs infoOne">
              <img src="../assets/trofeo.png" width="30" />
              <div>
                <span class="q-ml-sm q-mb-lg text">
                  {{ currentItem[0].thing }}
                </span>
              </div>
            </span>
            <span class="q-py-xs infoOne">
              <img class="q-ml-xs" src="../assets/dollar.png" width="20" />
              <div>
                <span class="q-ml-sm q-mb-lg text">
                  {{ currentItem[0].price }}
                </span>
              </div>
            </span>
            <span class="q-py-xs infoOne">
              <img class="q-ml-xs" src="../assets/monument.png" width="25" height="30" />
              <div>
                <span class="q-ml-sm q-mb-lg text">
                  {{ currentItem[0].lottery }}
                </span>
              </div>
            </span>
            <span class="q-py-xs infoOne">
              <img src="../assets/calendar.png" width="30" />
              <div>
                <span class="q-ml-sm q-mb-lg text">
                  {{ currentItem[0].date }}
                </span>
              </div>
            </span>
            <div class="row justify-end">
              <q-btn class="q-my-sm edit" @click="">
                <span>Editar</span>
                <i class="icon icon-more"></i>
              </q-btn>
            </div>
          </div>
          <div class="col-sm-5 col-md-11 options">
            <q-btn class="q-my-sm btn">
              <img class="q-mr-sm" src="../assets/filter.png" alt="filter" width="30">
              <span>Personalizar</span>
            </q-btn>
            <q-btn class="q-my-sm btn">
              <img class="q-mr-sm" src="../assets/edit.png" alt="edit" width="30">
              <span>Genera archivo datos</span>
            </q-btn>
            <q-btn @click="cancelTicket(currentItem[0].id)" class="q-my-sm btn" push label="Cancelar Sorteo" />
          </div>
        </div>
      </div>
      <div class="col-10 col-md-7 numbers q-mt-xl q-pt-lg">
        <div v-for="(item, index) in currentItem[0].numbers">
          <q-btn class="number" :disable="disable"
            :class="{ 'stateOne': item.state == 0, 'stateTwo': item.state == 1, 'stateThree': item.state == 2 }"
            @click="open(index, item)">{{ index }}</q-btn>
        </div>
        <q-dialog v-model="dialog">
          <q-card style="width: 350px">
            <q-linear-progress :value="1" color="teal" />
            <q-card-section v-if="itemValue.state == 0" class="row items-center no-wrap">
              <div class="col column items-center">
                <h4 class="text-teal text-bold">Boleta {{ itemValue.number }}</h4>
                <span class="q-mt-sm"><span class="text-teal text-bold">Estado:</span> {{ getStateInText(itemValue.state)
                }}</span>
                <hr class="q-my-md full-width">
                <q-btn class="q-px-md text-bold" color="teal" @click="showBuyTicket(itemValue)" label="Adquirir Boleta" />
              </div>
            </q-card-section>
            <q-card-section v-if="itemValue.state == 1" class="row items-center no-wrap">
              <div class="col column items-center">
                <h4 class="text-teal text-bold">Boleta {{ itemValue.number }}</h4>
                <span class="q-mt-sm"><span class="text-teal text-bold">Estado:</span> {{ getStateInText(itemValue.state)
                }}</span>
                <hr class="q-my-md full-width">
                <q-btn class="q-px-md text-bold full-width" color="teal" @click="seeInformation()">
                  <i class="icon icon-eye"></i><span class="q-pl-sm">Ver datos del participante</span>
                </q-btn><br>
                <q-btn class="q-px-md text-bold full-width" color="teal" @click="releaseTicket()">
                  <i class="icon icon-loop"></i><span class="q-pl-sm">Liberar boleta</span>
                </q-btn><br>
                <q-btn class="q-px-md text-bold full-width" color="teal" @click="">
                  <i class="icon icon-checked"></i><span class="q-pl-sm">Marcar como pagada</span>
                </q-btn>
              </div>
            </q-card-section>
          </q-card>
        </q-dialog>
        <q-dialog v-model="buyTicket">
          <q-card style="width: 350px">
            <q-linear-progress :value="1" color="teal" />
            <q-card-section v-if="itemValue.state == 0" class=" row items-center no-wrap">
              <div class="col column items-center">
                <h5 class="text-teal text-bold">Diligenciar la información</h5>
                <q-input type="text" class="q-my-md full-width" v-model="dataTicket.name" label="Nombre" lazy-rules
                  :rules="[val => val && val.length > 0 || 'Por favor ingrese un nombre']" />
                <q-input type="text" class="q-my-md full-width" v-model="dataTicket.comments"
                  label="Observaciones (Opcional)" />
                <q-input type="number" class="q-my-md full-width q-mb-lg" v-model="dataTicket.celphone" label="Celular"
                  lazy-rules :rules="[val => val && val.length > 0 || 'Por favor ingrese un telefono']" />
                <q-btn class="q-px-lg text-bold" color="teal" @click="onSubmit()" label="Adquirir Boleta" />
              </div>
            </q-card-section>
          </q-card>
        </q-dialog>
        <q-dialog v-model="infoTicket">
          <q-card class="column items-center" style="width: 350px">
            <q-linear-progress :value="1" color="teal" />
            <h5 class="text-teal text-center text-bold q-pt-md">Información de la boleta</h5>
            <q-card-section class="row no-wrap">
              <div class="col column">
                <span class="q-mt-sm"><span class="text-teal text-bold">Boleta número:</span></span>
                <span class="q-mt-sm"><span class="text-teal text-bold">Nombre:</span></span>
                <span class="q-mt-sm"><span class="text-teal text-bold">Observaciones:</span></span>
                <span class="q-mt-sm"><span class="text-teal text-bold">Teléfono:</span></span>
                <span class="q-mt-sm"><span class="text-teal text-bold">Adquirido el:</span></span>
                <span class="q-mt-sm"><span class="text-teal text-bold">Estado:</span></span>
                <span class="q-mt-sm"><span class="text-teal text-bold">Metodo de pago:</span></span>
              </div>
              <div class="col column ellipsis">
                <span class="q-mt-sm">{{ itemValue.number
                }}</span>
                <span class="q-mt-sm">{{ itemValue.owner }}</span>
                <span class="q-mt-sm">{{ itemValue.comments
                }}</span>
                <span class="q-mt-sm">{{ itemValue.celphone }}</span>
                <span class="q-mt-sm">{{ itemValue.date }}</span>
                <span class="q-mt-sm">{{ getStateInText(itemValue.state)
                }}</span>
                <span class="q-mt-sm">{{ getMethodInText(itemValue.methodPayment) }}</span>
              </div>
            </q-card-section>
            <q-btn class="text-bold q-mb-md" color="teal" @click="back()" label="Volver" />
          </q-card>
        </q-dialog>
      </div>
    </div>
  </template>
  <template v-else>
    <h1>No hay información</h1>
  </template>
</template>

<script setup>
import { useQuasar } from "quasar";
import { onMounted, computed, ref, watch } from "vue";
import { useRoute } from "vue-router";
import { useStorage } from "@/stores/localStorage";

const route = useRoute();
const storage = useStorage();
const $q = useQuasar()

let itemValue = ref()
let isData = ref(false);
let disable = ref(false)
const dialog = ref(false)
const buyTicket = ref(false)
const infoTicket = ref(false)
const dataTicket = ref({})

let currentItem = ref(null);
let currentId = computed(() => storage.getActiveId);
let tickets = computed(() => storage.getStorage);

onMounted(() => {
  storage.setActiveId(route.query.myTicket);
});

watch(currentId, () => {
  getCurrentItem();
});

function open(index, item) {
  dialog.value = true
  console.log(index);
  itemValue.value = item
}

function back() {
  dialog.value = true
  infoTicket.value = false
}

function showBuyTicket(item) {
  buyTicket.value = true
  dialog.value = false
}

function getStateInText(state) {
  const states = {
    0: 'No adquirida ⚪',
    1: 'Adquirida sin pagar 🟡',
    2: 'Adquirida y pagada 🟢'
  }
  return states[state] || 'No adquirida ⚪'
}

function getMethodInText(method) {
  const methods = {
    0: 'Efectivo',
    1: 'Transferencia',
    2: 'Paypal'
  }
  return methods[method] || 'No se asignó.'
}

function releaseTicket() {
  itemValue.value.state = 0
  itemValue.value.owner = ''
  itemValue.value.celphone = ''
  itemValue.value.comments = 'NO REGISTRADO'
  itemValue.value.date = ''
  itemValue.value.methodPayment = 0
  currentItem.value[0].numbers[itemValue.value.number] = itemValue.value
  console.log(currentItem.value[0].numbers[itemValue.value.number]);
  storage.modifyData(currentItem.value[0])
  dialog.value = false
}

function isInputsValidate() {
  if (dataTicket.value.name && dataTicket.value.celphone) {
    return false
  } else {
    return true
  }
}

function seeInformation() {
  infoTicket.value = true
}

function onSubmit() {
  if (isInputsValidate()) {
    $q.dialog({
      message: 'Faltan campos por diligenciar',
      timeout: 2000,
      color: 'teal',
      timeout: 2000,
      persistent: true,
    })
  } else {
    $q.dialog({
      title: 'Confirm',
      message: '¿Está seguro que desea crear el talonario?',
      cancel: true,
      persistent: true
    }).onOk(() => {
      console.log('>>>> OK')
      itemValue.value.state = 1
      itemValue.value.owner = dataTicket.value.name
      itemValue.value.celphone = dataTicket.value.celphone
      itemValue.value.comments = dataTicket.value.comments || 'NO REGISTRADO'
      itemValue.value.date = generateDate()

      currentItem.value[0].numbers[itemValue.value.number] = itemValue.value
      storage.modifyData(currentItem.value[0])

      buyTicket.value = false
      dataTicket.value = {}
    }
    ).onCancel(() => {
      console.log('>>>> Cancel')
    });
  }
}

function generateDate() {
  const date = new Date()
  const day = date.getDate()
  const month = ((date.getMonth()) + 1).toString().padStart(2, '0')
  const year = date.getFullYear()
  const hour = date.getHours()
  const minutes = date.getMinutes()
  const seconds = date.getSeconds()
  return `${day}/${month}/${year} ${hour}:${minutes}:${seconds}`
}

function getCurrentItem() {
  if (tickets.value) {
    currentItem.value = tickets.value.filter((item) => {
      return item.id == currentId.value;
    });
    currentItem.value.length > 0
      ? (isData.value = true)
      : (isData.value = false);
  }
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.stateOne {
  background-color: #DEF2F1;
}

.stateTwo {
  background-color: #ebb44f !important;
}

.stateThree {
  background-color: #dd3232;
}

.container {
  max-width: 90%;
}

.first {
  margin: 0 auto;
}

.infoOne {
  display: flex;
}

.edit:hover {
  background-color: #2B7A78;
  color: white;
  font-weight: bolder;
}

.numbers {
  margin: 0 auto;
  max-width: 60%;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(50px, 1fr));
  grid-gap: 10px;
  margin-bottom: 35px;
  background-color: #DEF2F1;
  padding: 20px;
  border-radius: 20px;
}

.number {
  display: grid;
  border-radius: 50%;
  height: 50px;
  width: 50px;
  background-color: white;
}

.number:hover {
  background-color: #2B7A78;
  color: white;
  border: 1px white solid;
  font-weight: bold;
}

.options {
  margin-top: 20px;
  display: grid;
  width: 100%;
  grid-template-columns: 1fr;
  background-color: #DEF2F1;
  padding: 20px;
  border-radius: 10px;
}

.options button {
  width: 100%;
  height: 55px;
  border-radius: 40px;
  padding: 10px;
  background-color: #2B7A78;
  color: white;
  font-weight: bold;
  font-size: 12px;
}

.options button:hover {
  background-color: #3AAFA9;
}

.infoTickets {
  min-width: 250px;
  background-color: #DEF2F1;
  color: #2B7A78;
  padding: 10px;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  padding: 20px;
}

.infoTickets .text {
  font-size: 20px;
}

@media (min-width: 600px) and (max-width: 1023px) {
  .options button {
    max-width: 100%;
    padding: 0;
  }

  .first {
    margin: 0;
  }

  .options {
    margin: 0;
    margin-left: 20px;
    padding: 10px;
  }

  .numbers {
    margin: 0 auto;
    gap: 15px;
    margin-bottom: 40px;
  }

  .number {
    padding: 15px;
    width: 60px;
    height: 60px;
  }
}

@media (min-width: 1024px) {
  .infoTickets {
    padding-top: 30px;
    padding-left: 40px;
  }

  .first {
    padding-top: 70px;
  }

  .options button {
    height: 70px;
    font-size: 14px;
    max-width: 300px;
  }

  .btn {
    margin: 0 auto;
    margin-top: 10px;
  }

  .numbers {
    margin: 0 auto;
    max-width: 50%;
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(60px, 1fr));
    grid-gap: 15px;
    margin-bottom: 50px;
    margin-top: 40px;
    padding: 40px;
  }

  .number {
    display: grid;
    border-radius: 50%;
    height: 60px;
    width: 60px;
    box-shadow:
      inset 0 -2em 3em rgba(255, 254, 254, 0.1),
      0 0 0 1px rgb(255, 255, 255),
      0.3em 0.1em 0.6em rgba(0, 0, 0, 0.3);
  }
}
</style>
