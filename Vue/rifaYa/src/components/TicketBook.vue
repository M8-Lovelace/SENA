<template>
  <div class="ticket-container">
    <div class="inner-container row">
      <template v-if="isData">
        <div class="row justify-center first-row">
          <div class="col-7 infoTickets">
            <span class="q-py-xs infoOne">
              <img src="../assets/trofeo.png" width="15" height="20" />
              <div>
                <span class="q-ml-sm q-mb-lg text">
                  {{ currentItem[0].thing }}
                </span>
              </div>
            </span>
            <span class="q-py-xs infoOne">
              <img src="../assets/dollar.png" width="15" />
              <div>
                <span class="q-ml-sm q-mb-lg text">
                  {{ currentItem[0].price }}
                </span>
              </div>
            </span>
            <span class="q-py-xs infoOne">
              <img src="../assets/monument.png" width="15" height="20" />
              <div>
                <span class="q-ml-sm q-mb-lg text">
                  {{ currentItem[0].lottery }}
                </span>
              </div>
            </span>
            <span class="q-py-xs infoOne">
              <img src="../assets/calendar.png" width="20" />
              <div>
                <span class="q-ml-sm q-mb-lg text">
                  {{ currentItem[0].date }}
                </span>
              </div>
            </span>
            <div class="row justify-end">
              <q-btn class="q-my-sm q-pb-sm edit" @click="editTicket()" :disabled="validatestateTwo()">
                <img src="../assets/edit.png" alt="" width="15" />
                <span class="q-pl-sm q-pt-xs">Editar</span>
              </q-btn>
            </div>

            <q-dialog v-model="editTicketModal">
              <q-card style="width: 400px">
                <q-linear-progress :value="1" color="teal" />
                <q-card-section class="no-wrap">
                  <div class="col">
                    <h5 class="text-teal text-bold text-center">
                      Modificar la información
                    </h5>
                    <br />
                    <span class="text-teal text-bold">Talonario número {{ currentItem[0].id }}</span><br /><br />

                    <label class="q-mb-md color">Modifica el nombre del premio</label>
                    <q-input v-model="thing" :rules="[
                      (val) =>
                        (val && val.length > 0) ||
                        'Por favor ingrese un premio',
                    ]" />

                    <label class="q-mb-md color">Modifica la loteria con que se establece el
                      ganador</label>
                    <q-select v-model="lottery" :options="lotteries" label="Escoge una opción" lazy-rules :rules="[
                      (val) =>
                        (val && val.length > 0) ||
                        'Por favor seleccione una loteria',
                    ]" />

                    <label class="q-my-lg">Modifica la fecha de juego de tu concurso</label>
                    <q-input type="date" v-model="dates" lazy-rules :rules="[
                      (val) =>
                        (val && val.length > 0) ||
                        'Por favor ingrese un fecha',
                      dateBiggerThanToday,
                    ]" />
                    <div class="row justify-center">
                      <q-btn class="q-px-md text-bold q-mx-sm" color="teal" @click="closeEdit()" label="Cerrar" />
                      <q-btn class="q-px-md text-bold q-mx-sm" color="teal" @click="saveEdit()" label="Guardar" />
                    </div>
                  </div>
                </q-card-section>
              </q-card>
            </q-dialog>
          </div>
          <div class="col-4 options">
            <div class="btn row justify-center" :class="{
              stateOneTicket: currentItem[0].state == 0,
              stateTwoTicket: currentItem[0].state == 1,
            }">
              <span class="q-px-lg text-bold">{{ generateState(currentItem[0].state) }}</span>
            </div>
            <button class="btn row justify-center hover" @click="listTicket()">
              <span>Listar boletas</span>
            </button>
            <button class="btn row justify-center hover" @click="listInfoTicket()">
              <span>Información del talonario</span>
            </button>
            <button @click="cancelTicket()" :disabled="validatestateTwo()" class="btn hover">Cancelar Sorteo</button>
          </div>
          <q-dialog v-model="listTickets">
            <q-card style="width: 400px">
              <q-linear-progress :value="1" color="teal" />
              <q-card-section class="no-wrap">
                <div class="col">
                  <h5 class="text-teal text-bold text-center">
                    Listar boletas
                  </h5>
                  <br />
                  <span class="text-teal text-bold">Talonario número {{ currentItem[0].id }}</span><br /><br />
                  <div class="list">
                    <div
                      v-for="(item, index) in currentItem[0].numbers.filter(num => num.state === 1 || num.state === 2)">
                      <div class="row bg q-my-xs">
                        <div class="col-4 q-pl-xs row">
                          <div class="q-pt-sm q-mt-xs">
                            <span class="q-pa-xs list-ticket" :class="{
                              stateTwo: item.state == 1,
                              stateThree: item.state == 2,
                            }">{{ item.number }}</span>
                          </div>
                          <div class="q-py-xs q-pl-sm item-list">
                            <span class="n">{{ item.owner }}</span><br>
                            <span class="n">{{ item.celphone }}</span>
                          </div>
                        </div>
                        <div class="col-8 q-pt-xs row justify-end">
                          <span class="q-pt-sm">{{ getStateInTextTwo(item.state) }}</span>
                          <q-btn class="q-ml-lg bt q-mr-xs" color="teal"
                            @click="seeInformationDetail(item)">Detalles</q-btn>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row justify-center q-mt-sm">
                    <q-btn class="q-px-md text-bold" color="teal" @click="closeList()" label="Cerrar" />
                  </div>
                </div>
              </q-card-section>
            </q-card>
          </q-dialog>
          <q-dialog v-model="viewInfoTicket">
            <q-card class="q-pa-md" style="width: 350px">
              <q-linear-progress :value="1" color="teal" />
              <h5 class="text-teal text-center text-bold q-pt-md">
                Información del talonario
              </h5>
              <q-card-section class="row no-wrap">
                <div class="col column">
                  <span class="q-mt-sm"><span class="text-teal text-bold">Talonario número:</span></span>
                  <span class="q-mt-sm"><span class="text-teal text-bold">Premio:</span></span>
                  <span class="q-mt-sm"><span class="text-teal text-bold">Tipo artículo:</span></span>
                  <span class="q-mt-sm"><span class="text-teal text-bold">Precio:</span></span>
                  <span class="q-mt-sm"><span class="text-teal text-bold">Fecha:</span></span>
                  <span class="q-mt-sm"><span class="text-teal text-bold">Loteria:</span></span>
                  <span class="q-mt-sm"><span class="text-teal text-bold">Estado:</span></span>
                  <span class="q-mt-sm"><span class="text-teal text-bold">Boletas disponibles:</span></span>
                </div>
                <div class="col column ellipsis">
                  {{ }}
                  <span class="q-mt-sm">{{ currentItem[0].id }}</span>
                  <span class="q-mt-sm">{{ currentItem[0].thing }}</span>
                  <span class="q-mt-sm">{{ currentItem[0].item }}</span>
                  <span class="q-mt-sm">{{ currentItem[0].price }}</span>
                  <span class="q-mt-sm">{{ currentItem[0].date }}</span>
                  <span class="q-mt-sm">{{ currentItem[0].lottery }}</span>
                  <span class="q-mt-sm">{{ generateState(currentItem[0].state) }}</span>
                  <span class="q-mt-sm">{{ currentItem[0].numbers.filter(num => num.state === 0).length }}</span>
                </div>
              </q-card-section>
              <div class="column items-center">
                <q-btn class="text-bold q-mb-md" color="teal" @click="backTicketList()"
                  label="Volver" />
              </div>
            </q-card>
          </q-dialog>
        </div>
        <div class="row q-mt-sm second-row">
          <div class="col-12 numbers full-width">
            <div class="column items-center" v-for="(item, index) in currentItem[0].numbers">
              <button class="number" :class="{
                stateOne: item.state == 0,
                stateTwo: item.state == 1,
                stateThree: item.state == 2,
              }" @click="open(index, item)">
                {{ index }}
              </button>
            </div>
            <q-dialog v-model="dialog">
              <q-card style="width: 350px">
                <q-linear-progress :value="1" color="teal" />
                <q-card-section v-if="itemValue.state == 0" class="row items-center no-wrap">
                  <div class="col column items-center">
                    <h4 class="text-teal text-bold">
                      Boleta {{ itemValue.number }}
                    </h4>
                    <span class="q-mt-sm"><span class="text-teal text-bold space">Estado:</span>
                      {{ getStateInText(itemValue.state) }}</span>
                    <hr class="q-my-md full-width" />
                    <q-btn class="q-px-md text-bold full-width" v-show="validatestate()" color="teal"
                      @click="showBuyTicket(itemValue)">
                      <img class="q-mr-xs" src="../assets/dollar.png" width="15">
                      <span>Adquirir Boleta</span>
                    </q-btn>
                    <q-btn class="q-px-md full-width space" color="teal" @click="closeDialog()">
                      <span class="text-bold">Cerrar</span>
                    </q-btn>
                  </div>
                </q-card-section>
                <q-card-section v-if="itemValue.state == 1" class="row items-center no-wrap">
                  <div class="col column items-center">
                    <h4 class="text-teal text-bold">
                      Boleta {{ itemValue.number }}
                    </h4>
                    <span class="q-mt-sm"><span class="text-teal text-bold">Estado:</span>
                      {{ getStateInText(itemValue.state) }}</span>
                    <hr class="q-my-md full-width" />
                    <q-btn class="q-px-md text-bold full-width space" color="teal" @click="seeInformation()">
                      <i class="icon icon-eye"></i><span class="q-pl-sm">Ver datos del participante</span> 
                    </q-btn>
                    <q-btn class="q-px-md text-bold full-width space" color="teal" v-show="validatestate()"
                      @click="releaseTicket()">
                      <i class="icon icon-loop"></i><span class="q-pl-sm">Liberar boleta</span> 
                    </q-btn>
                    <q-btn class="q-px-md text-bold full-width space" color="teal" v-show="validatestate()"
                      @click="checkPaid()">
                      <i class="icon icon-checked"></i><span class="q-pl-sm">Marcar como pagada</span>
                    </q-btn>
                    <q-btn @click="closeDialog()" class="q-px-md full-width space" color="teal">
                      <span class="text-bold">Cerrar</span>
                    </q-btn>
                  </div>
                </q-card-section>
                <q-card-section v-if="itemValue.state == 2" class="row items-center no-wrap">
                  <div class="col column items-center">
                    <h4 class="text-teal text-bold">
                      Boleta {{ itemValue.number }}
                    </h4>
                    <span class="q-mt-sm"><span class="text-teal text-bold">Estado:</span>
                      {{ getStateInText(itemValue.state) }}</span>
                    <hr class="q-my-md full-width" />
                    <q-btn class="q-px-md text-bold full-width" color="teal" @click="seeInformation()">
                      <i class="icon icon-eye"></i><span class="q-pl-sm">Ver datos del participante</span>
                    </q-btn>
                    <q-btn @click="closeDialog()" class="q-px-md full-width space" color="teal">
                      <span class="text-bold">Cerrar</span>
                    </q-btn>
                  </div>
                </q-card-section>
              </q-card>
            </q-dialog>
            <q-dialog v-model="buyTicket">
              <q-card style="width: 350px">
                <q-linear-progress :value="1" color="teal" />
                <q-card-section v-if="itemValue.state == 0" class="row items-center no-wrap">
                  <div class="col column items-center">
                    <h5 class="text-teal text-bold">
                      Diligenciar la información
                    </h5>
                    <q-input type="text" class="q-my-md full-width" v-model="dataTicket.name" label="Nombre" lazy-rules
                      :rules="[
                        (val) =>
                          (val && val.length > 0) ||
                          'Por favor ingrese un nombre',
                      ]" />
                    <q-input type="text" class="q-my-md full-width" v-model="dataTicket.comments"
                      label="Observaciones (Opcional)" />
                    <q-input type="number" class="q-my-md full-width q-mb-lg" v-model="dataTicket.celphone"
                      label="Celular" lazy-rules :rules="[
                        (val) =>
                          (val && val.length > 0) ||
                          'Por favor ingrese un telefono',
                      ]" />
                    <q-btn class="q-px-lg text-bold" color="teal" @click="onSubmit()" label="Adquirir Boleta" />
                  </div>
                </q-card-section>
              </q-card>
            </q-dialog>
            <q-dialog v-model="infoTicket">
              <q-card class="q-pa-md" style="width: 350px">
                <q-linear-progress :value="1" color="teal" />
                <h5 class="text-teal text-center text-bold q-pt-md">
                  Información de la boleta
                </h5>
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
                    <span class="q-mt-sm">{{ itemValue.number }}</span>
                    <span class="q-mt-sm">{{ itemValue.owner }}</span>
                    <span class="q-mt-sm">{{ itemValue.comments }}</span>
                    <span class="q-mt-sm">{{ itemValue.celphone }}</span>
                    <span class="q-mt-sm">{{ itemValue.date }}</span>
                    <span class="q-mt-sm">{{
                      getStateInText(itemValue.state).substring(
                        0,
                        getStateInText(itemValue.state).length - 2
                      )
                    }}</span>
                    <span class="q-mt-sm">{{
                      getMethodInText(itemValue.methodPayment)
                    }}</span>
                  </div>
                </q-card-section>
                <div class="column items-center">
                  <q-btn class="text-bold q-mb-md" color="teal" v-show="backButton" @click="back()" label="Volver" />
                  <q-btn class="text-bold q-mb-md" color="teal" v-show="backButtonTwo" @click="backTicket()"
                    label="Volver" />
                </div>
              </q-card>
            </q-dialog>
            <q-dialog v-model="checkPaidModal">
              <q-card class="column items-center" style="width: 350px">
                <q-linear-progress :value="1" color="teal" />
                <h5 class="text-teal text-center text-bold q-pt-md">
                  Marcar boleta como pagada
                </h5>
                <q-card-section class="row no-wrap">
                  <div class="col column">
                    <label class="q-mb-md">Indica cómo la fue pagada esta boleta</label>
                    <q-select v-model="method" :options="methods" label="Escoge una opción" /><br />
                    <q-input class="anotherWay q-mb-md" v-if="method != null && method.value == 6" type="text"
                      v-model="anotherWay" placeholder="Ejemplo: Bonos, Paypal, envíos, cheque..."></q-input>
                    <span class="text-center text" v-if="method != null">
                      * Una vez marcada como pagada no es posible modificar este
                      estado *
                    </span>
                  </div>
                </q-card-section>
                <div>
                  <q-btn class="text-bold q-mb-md q-mx-md" color="teal" @click="backMethod()" label="Volver" />
                  <q-btn class="text-bold q-mb-md q-mx-md" v-if="method != null" color="teal" @click="confirmPayment()"
                    label="Marcar" />
                </div>
              </q-card>
            </q-dialog>
          </div>
        </div>
      </template>
      <template v-else>
        <h3 class="q-ma-xl">No hay información</h3>
      </template>
    </div>
  </div>
</template>

<script setup>
import { useQuasar } from "quasar";
import { onMounted, computed, ref, watch } from "vue";
import { useRoute } from "vue-router";
import { useStorage } from "@/stores/localStorage";

const route = useRoute();
const storage = useStorage();
const $q = useQuasar();

let itemValue = ref();
let method = ref();
let anotherWay = ref();
let lottery = ref();
let thing = ref();
let dates = ref();
const isData = ref(false);
const viewButtons = ref(true);
const dialog = ref(false);
const buyTicket = ref(false);
const infoTicket = ref(false);
const dataTicket = ref({});
const checkPaidModal = ref(false);
const editTicketModal = ref(false);
const listTickets = ref(false);
const backButton = ref(true);
const backButtonTwo = ref(false);
const viewInfoTicket = ref(false);

let currentItem = ref(null);
let currentId = computed(() => storage.getActiveId);
let tickets = computed(() => storage.getStorage);

const methods = [
  {
    label: "Efectivo",
    value: 1,
  },
  {
    label: "Consignación",
    value: 2,
  },
  {
    label: "Efecty",
    value: 3,
  },
  {
    label: "Daviplata",
    value: 4,
  },
  {
    label: "Paypal",
    value: 5,
  },
  {
    label: "Otro medio",
    value: 6,
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

onMounted(() => {
  storage.setActiveId(route.query.myTicket);
});

watch(currentId, () => {
  getCurrentItem();
});

function open(index, item) {
  dialog.value = true;
  (index);
  itemValue.value = item;
}

function listInfoTicket() {
  console.log("listInfoTicket");
  viewInfoTicket.value = true;
}

function back() {
  dialog.value = true;
  infoTicket.value = false;
}

function backMethod() {
  dialog.value = true;
  checkPaidModal.value = false;
  method.value = "";
}

function closeDialog() {
  dialog.value = false;
}

function closeEdit() {
  editTicketModal.value = false;
}

function closeList() {
  listTickets.value = false;
}

function backTicket() {
  infoTicket.value = false;
  listTickets.value = true;
}

function backTicketList() {
  viewInfoTicket.value = false;
}

function seeInformationDetail(item) {
  listTickets.value = false;
  itemValue.value = item;
  infoTicket.value = true;
  backButtonTwo.value = true;
  backButton.value = false;
}

function cancelTicket() {
  $q.dialog({
    title: "Cancelar talonario",
    message: "¿Está seguro que desea cancelar este talonario?",
    cancel: true,
    persistent: true,
  }).onOk(() => {
    ("ok");
    dialog.value = false;
    viewButtons.value = false;
    currentItem.value[0].state = 1;
    storage.modifyData(currentItem.value[0]);
    validatestate();
    validatestateTwo();
  });
}

function listTicket() {
  listTickets.value = true;
  (currentItem.value[0].numbers.filter(num => num.state === 1 || num.state === 2));
}

function validatestate() {
  if (currentItem.value[0].state === 0) {
    return true
  } else if (currentItem.value[0].state === 1) {
    return false;
  }
}

function validatestateTwo() {
  if (currentItem.value[0].state === 0) {
    return false
  } else if (currentItem.value[0].state === 1) {
    return true;
  }
}

function showBuyTicket(item) {
  buyTicket.value = true;
  dialog.value = false;
}

function checkPaid() {
  checkPaidModal.value = true;
  dialog.value = false;
  (method.value);
}

function getStateInText(state) {
  const states = {
    0: "No adquirida ⚪",
    1: "Adquirida sin pagar 🟡",
    2: "Adquirida y pagada 🟢",
  };
  return states[state] || "No adquirida ⚪";
}

function getStateInTextTwo(state) {
  const states = {
    1: "En deuda",
    2: "Pagada",
  };
  return states[state] || "No adquirida";
}

function getMethodInText(method) {
  const methods = {
    0: "No se asignó",
    1: "Efectivo",
    2: "Consignación",
    3: "Efecty",
    4: "Daviplata",
    5: "Paypal",
    6: "Otro medio",
  };
  return methods[method] || "No se asignó.";
}

function releaseTicket() {
  itemValue.value.state = 0;
  itemValue.value.owner = "";
  itemValue.value.celphone = "";
  itemValue.value.comments = "NO REGISTRADO";
  itemValue.value.date = "";
  itemValue.value.methodPayment = 0;
  currentItem.value[0].numbers[itemValue.value.number] = itemValue.value;
  (currentItem.value[0].numbers[itemValue.value.number]);
  storage.modifyData(currentItem.value[0]);
  dialog.value = false;
}

function isInputsValidate() {
  if (dataTicket.value.name && dataTicket.value.celphone) {
    return false;
  } else {
    return true;
  }
}

function seeInformation() {
  infoTicket.value = true;
  backButton.value = true;
  backButtonTwo.value = false;
}

function saveEdit() {
  currentItem.value[0].thing = thing.value;
  currentItem.value[0].lottery = lottery.value;
  currentItem.value[0].date = dates.value;
  storage.modifyData(currentItem.value[0]);
  editTicketModal.value = false;
}

function isSelectValidate() {
  if (method.value == null) {
    return true;
  } else {
    return false;
  }
}

function generateState(ticket) {
  if (ticket == 0) {
    return "En curso";
  } else if (ticket == 1) {
    return "Cancelada";
  }
}

function confirmPayment() {
  if (isSelectValidate()) {
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
      message: "¿Deseas marcar como pagada la boleta?",
      cancel: true,
      persistent: true,
    })
      .onOk(() => {
        (">>>> OK");
        itemValue.value.state = 2;
        itemValue.value.methodPayment = method.value.value;

        currentItem.value[0].numbers[itemValue.value.number] = itemValue.value;
        storage.modifyData(currentItem.value[0]);

        dialog.value = false;
        checkPaidModal.value = false;
        method.value = "";
      })
      .onCancel(() => {
        (">>>> CANCEL");
      })
      .onDismiss(() => {
        ("I am triggered on both OK and Cancel");
      });
  }
}

function onSubmit() {
  if (isInputsValidate()) {
    $q.dialog({
      message: "Faltan campos por diligenciar",
      timeout: 2000,
      color: "teal",
      timeout: 2000,
      persistent: true,
    });
  } else {
    $q.dialog({
      title: "Confirmar",
      message: "¿Está seguro que desea comprar esta boleta?",
      cancel: true,
      persistent: true,
    })
      .onOk(() => {
        (">>>> OK");
        itemValue.value.state = 1;
        itemValue.value.owner = dataTicket.value.name;
        itemValue.value.celphone = dataTicket.value.celphone;
        itemValue.value.comments = dataTicket.value.comments || "NO REGISTRADO";
        itemValue.value.date = generateDate();

        currentItem.value[0].numbers[itemValue.value.number] = itemValue.value;
        storage.modifyData(currentItem.value[0]);

        buyTicket.value = false;
        dataTicket.value = {};
      })
      .onCancel(() => {
        (">>>> Cancel");
      });
  }
}

function generateDate() {
  const date = new Date();
  const day = date.getDate();
  const month = (date.getMonth() + 1).toString().padStart(2, "0");
  const year = date.getFullYear();
  const hour = date.getHours();
  const minutes = date.getMinutes();
  const seconds = date.getSeconds();
  return `${day}/${month}/${year} ${hour}:${minutes}:${seconds}`;
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

function dateBiggerThanToday(val) {
  const fechaSeleccionada = new Date(val);
  const hoy = new Date();
  return (
    fechaSeleccionada > hoy || "La fecha seleccionada debe ser mayor que hoy"
  );
}

function editTicket() {
  editTicketModal.value = true;
  lottery.value = currentItem.value[0].lottery;
  thing.value = currentItem.value[0].thing;
  dates.value = revertGenerateDate(currentItem.value[0].date);
}

function revertGenerateDate(date) {
  const dateArray = date.split("-");
  return `${dateArray[0]}-${dateArray[1]}-${dateArray[2]}`;
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.list-ticket {
  border-radius: 50%;
}

.list {
  width: 100%;
  height: 200px;
  overflow: scroll;
}

.list::-webkit-scrollbar {
  display: none;
}

.bg {
  background-color: #def2f1;
  border-radius: 10px;
  height: 50px;
}

.item-list {
  max-width: 60px;
  overflow: hidden;
}

.hover:hover{
  cursor: pointer;
}

.space{
  margin-top: 10px;
}

.ticket-container {
  display: flex;
  align-items: center;
  justify-content: center;
}

.stateOneTicket {
  background-color: #8dd6d6;
  border-radius: 20px;
  color: #2b7a78;
}

.stateTwoTicket {
  background-color: #3e3e428f;
  border-radius: 20px;
  color: white;
}

.stateOneTicket span,
.stateTwoTicket span {
  font-size: 10px;
}

.inner-container {
  width: 95%;
  height: calc(100vh - 140px);
}

.second-row {
  width: 100%;
  height: 60%;
  overflow: scroll;
}

.second-row::-webkit-scrollbar,
.numbers::-webkit-scrollbar {
  display: none;
}

.stateOne {
  background-color: #def2f1;
}

.color {
  color: #2b7a78;
}

.text {
  color: #2b7a78;
}

.first-row {
  min-height: 25%;
  width: 100%;
}

.stateTwo {
  background-color: #9edbd9 !important;
  color: white;
  font-weight: bold;
}

.bt {
  width: 40%;
  height: 20px;
  border-radius: 8px;
}

.stateThree {
  background-color: #2b7a78 !important;
  color: white;
  font-weight: bold;
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

.edit {
  background-color: #2b7a78;
  color: white;
  font-size: 9px;
}

.edit:hover {
  background-color: #9edbd9;
  color: white;
  font-weight: bolder;
}

.numbers {
  display: grid;
  grid-template-columns: repeat(10, 1fr);
  background-color: #def2f1;
  padding: 20px;
  min-height: 100%;
  border-radius: 20px;
  overflow-x: hidden;
  overflow-y: scroll;
}

.number::-webkit-scrollbar {
  display: none;
}

.number {
  display: grid;
  place-items: center;
  border-radius: 50%;
  border: none;
  width: 25px;
  height: 25px;
  margin-top: 4px;
  font-size: 12px;
  background-color: white;
  border: #bfdddc 1px solid;
}

.number:hover {
  background-color: #2b7a78;
  color: white;
  border: 1px white solid;
  font-weight: bold;
  cursor: pointer;
}

.options {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-left: 20px;
  width: 100%;
  background-color: #def2f1;
  padding: 15px;
  border-radius: 10px;
}

.options button {
  border-radius: 40px;
  width: 100%;
  padding: 10px;
  background-color: #2b7a78;
  color: white;
  font-size: 9px;
  border: none;
  margin-top: 5px;
}

.options button:hover {
  background-color: #3aafa9;
}

.infoTickets {
  padding-left: 20px !important;
  padding-top: 20px !important;
  min-width: 250px;
  background-color: #def2f1;
  color: #2b7a78;
  padding: 10px;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
}

.infoTickets .text {
  font-size: 10px;
}

@media (min-width: 600px) and (max-width: 1023px) {
  .number {
    width: 40px;
    height: 40px;
  }

  .infoTickets .text {
    font-size: 13px;
  }

  .options button {
    width: 80% !important;
  }

  .stateOneTicket span,
  .stateTwoTicket span {
    font-size: 13px;
  }

  .options button {
    font-size: 12px;
  }

  .edit {
    font-size: 11px;
  }
}

@media (min-width: 1024px) and (max-width: 1439.99px) {
  .number {
    width: 50px;
    height: 50px;
  }

  .edit span {
    font-size: 11px;
  }

  .options button {
    width: 80% !important;
  }

  .stateOneTicket span,
  .stateTwoTicket span {
    font-size: 13px;
  }

  .first-row {
    max-width: 75% !important;
    margin: auto;
  }

  .infoTickets .text {
    font-size: 15px;
  }

  .options button {
    font-size: 15px;
  }

  .edit {
    font-size: 15px;
  }

  .second-row {
    margin-top: 10px !important;
    margin: auto;
    width: 75%;
  }
}

@media (min-width: 1440px) {
  .number {
    width: 60px;
    height: 60px;
  }

  .options button {
    width: 80% !important;
  }

  .stateOneTicket span,
  .stateTwoTicket span {
    font-size: 13px;
  }

  .first-row {
    max-width: 75% !important;
    margin: auto;
  }

  .edit span {
    font-size: 11px;
  }

  .infoTickets .text {
    font-size: 15px;
  }

  .options button {
    font-size: 15px;
  }

  .edit {
    font-size: 15px;
  }

  .second-row {
    margin-top: 10px !important;
    margin: auto;
    width: 75%;
  }
}
</style>
