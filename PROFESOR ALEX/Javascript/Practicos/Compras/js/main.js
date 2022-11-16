// Variables globales
const carrito = document.getElementById('carrito');
let cursos = []

function agregar(num){
  if (cursos.length == 0){
    revisar(num);
  }

  cursos.forEach((element, i) => {
    if(cursos[i].cod == num){
      // cursos[i].cantidad++;
      // pintar()
      return
    }
    else{
      revisar(num);
    }
  })
}


function revisar(num){
  console.log(num);
  if(num==1){
    const curso = {
      cod: 1,
      nombre: "Curso de JavaScript",
      precio: 15,
      cantidad: 1
    }
    cursos.push(curso);
    console.log(cursos);
  }

}

// Agrega el objeto a la lista de citas
citas.push(cita);

// Limpia los campos
limpiarCampos();
// Muestra las citas
mostrarCitas();



// Funcion que pintar los datos en la tabla
function mostrarCitas() {
console.log(citas);
crear.innerHTML = "Crear Cita";
// Limpia el div
cards.innerHTML = "";
// Recorre el array y agrega los datos en una card
citas.forEach((element, i) => {
cards.innerHTML += `
  <div class="card mb-1 border-1">
    <div class="card-body bg-light">
      <img src=${element.foto} style="width:95%">
      <h5 class="card-title fw-bold">${element.nombreMascota}</h5>
      <p class="card-text">Propietario: ${element.propietario}</p>
      <p class="card-text">Telefono: ${element.telefono}</p>
      <p class="card-text">Fecha: ${element.fecha}</p>
      <p class="card-text">Hora: ${element.hora}</p>
      <p class="card-text">Tipo: ${element.tipo}</p>
      <p class="card-text">Sintomas: ${element.sintomas}</p>
      <button type="button" class="btn btn-primary" onclick="editarCita(${i})">Editar</button>
      <button type="button" class="btn btn-danger" onclick="eliminarCita(${i})">Eliminar</button>
    </div>
  </div>
`
})
}