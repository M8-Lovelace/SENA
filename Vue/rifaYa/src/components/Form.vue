<template>
    <div class="full-width column">
        <div class="q-mt-md q-pt-xl">
            <q-form @submit="onSubmit" @reset="onReset" class="q-gutter-md form">
                <label class="q-mb-md">¿Cuantas boletas tendrá el talonario?</label>
                <q-select v-model="ticket" :options="tickets" label="Escoge una opción" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Por favor ingrese una cantidad']" />
                <label class="q-my-lg">¿Qué articulo/servicio relacionas tu talonario?</label>

                <q-input type="text" v-model="thing" label="Describe lo que quieres premiar" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Por favor ingrese una descripción']" />

                <label class="q-mb-md">Escoge el tipo de artículo</label>
                <q-select v-model="item" :options="items" label="Escoge una opción" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Por favor seleccione un tipo']" />

                <label class="q-mb-md">¿Con que loteria se establece el ganador?</label>
                <q-select v-model="lottery" :options="lotteries" label="Escoge una opción" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Por favor seleccione una loteria']" />

                <q-input class="medio" v-if="lottery == 'Otro Medio'" type="text" v-model="forExample"
                    placeholder="Ejem. Loteria nacional/Instagram Live" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Por favor ingrese un medio']" />

                <label class="q-my-lg">¿Cuando jugarás tu concurso/sorteo?</label>
                <q-input type="date" v-model="date" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Por favor ingrese un fecha', dateBiggerThanToday]" />

                <label class="q-my-lg">¿Cuánto cuesta cada boleta?</label>
                <q-input type="number" v-model="price" label="Precio de cada boleta" lazy-rules
                    :rules="[val => val && val.length > 0 || 'Por favor ingrese un precio']" />

                <div>
                    <q-btn label="Confirm" color="orange" @click="onSubmit()" />
                    <q-btn label="cancelar" to="./" @click="onReset()" color="orange" flat class="q-ml-sm" />
                </div>
            </q-form>
        </div>
    </div>
</template>

<script setup>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const $q = useQuasar()
const router = useRouter()

let ticket = ref(null)
let thing = ref(null)
let item = ref(null)
let lottery = ref(null)
let forExample = ref(null)
let date = ref(null)
let price = ref(null)

const tickets = [
    'Boletas del 0-09(10 Boletas)',
    'Boletas del 00-99(100 Boletas)',
    'Boletas del 1-43(43 Boletas)'
]

const lotteries = [
    'Lotería de Cundinamarca - Lunes',
    'Lotería de Tolima - Lunes',
    'Lotería Cruz Roja - Martes',
    'Lotería de Huila - Martes',
    'Lotería de Manizales - Miércoles',
    'Lotería del Meta - Miércoles',
    'Lotería del Valle - Miércoles',
    'Lotería Quindío - Jueves',
    'Lotería de Bogotá - Jueves',
    'Lotería de Santander - Viernes',
    'Lotería de Medellin - Viernes',
    'Lotería Risaralda - Viernes',
    'Lotería de Caldas - Sábado',
    'Loteria de Boyaca - Sábado',
    'Lotería de Cauca - Sábado',
    'Baloto - Miercoles y Sábado',
    'Antioqueñita Día',
    'Antioqueñita Tarde',
    'Cafeterito Noche',
    'Cafeterito Tarde - Lunes a Sábado',
    'Cash Three Día',
    'Cash Three noche',
    'Chontico Día',
    'Chontico Noche',
    'El Dorado Mañana - Lunes a Sábado',
    'El Dorado Noche - Domingo y Sábado',
    'El Dorado Tarde - Lunes a Sábado',
    'Evening',
    'La Caribeña Día',
    'La Caribeña Noche',
    'La Culona Día - Lunes a Sábado',
    'La Culona Noche',
    'La Fantástica Día - Lunes a Sábado',
    'La Fantástica Noche',
    'Motilón Noche',
    'Motilón Tarde',
    'Paisita Día',
    'Paisita Noche',
    'Pijao de Oro',
    'Play Four Día',
    'Play Four Noche',
    'Samán de la Suerte',
    'Sinuano Día',
    'Sinuano Noche',
    'Win 4',
    'Otro Medio'
]

const items = [
    'Juguete',
    'Electrodoméstico',
    'Mueble',
    'Ropa',
    'Tecnología',
    'Dinero',
    'Tarjeta de regalo',
    'Viaje',
    'Trago',
    'Comida',
    'Utensilio deportivo',
    'Otro'
]

function dateBiggerThanToday(val) {
    const fechaSeleccionada = new Date(val)
    const hoy = new Date()
    return fechaSeleccionada > hoy || 'La fecha seleccionada debe ser mayor que hoy'
}

function isInputsValidate() {
    if (ticket.value || thing.value || item.value || lottery.value || date.value || price.value || forExample.value) {
        return false
    } else {
        return true
    }
}

function onSubmit() {
    if (isInputsValidate()) {
        $q.dialog({
            message: 'Faltan campos por diligenciar u opciones por seleccionar',
            timeout: 2000,
            color: 'orange',
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
            router.push({
                name: 'tickets' , 
                query: { ticket: ticket.value, thing: thing.value, item: item.value, lottery: lottery.value, forExample: forExample.value, date: date.value, price: price.value } })
        }).onCancel(() => {
            console.log('>>>> Cancel')
        })
    }
}

function onReset() {
    ticket.value = null
    thing.value = null
    item.value = null
    lottery.value = null
    forExample.value = null
    date.value = null
    price.value = null
}

</script>

<style scoped>
.column {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: #F48825;
}

.form {
    width: 100%;
    min-width: 350px;
}

.medio {
    width: 80%;
    margin: 0 auto;
}
</style>