function deDecimal() {
  // Desde decimal a otras bases

  let decimal = 255; // Este número lo iremos convirtiendo a todas las bases

  // Decimal a binario
  let decimalEnBinario = decimal.toString(2); // A la base 2
  console.log(
    "El número decimal %s en binario es %s",
    decimal,
    decimalEnBinario
  );

  // Decimal a octal
  let decimalEnOctal = decimal.toString(8); // A la base 8
  console.log("El número decimal %s en octal es %s", decimal, decimalEnOctal);

  // Decimal a hexadecimal
  let decimalEnHexadecimal = decimal.toString(16); // A la base 16
  console.log(
    "El número decimal %s en hexadecimal es %s",
    decimal,
    decimalEnHexadecimal
  );
}

function aDecimal() {
  // Desde otras bases a decimal

  // Binario a decimal
  let binario = "1100"; // 12
  let binarioEnDecimal = parseInt(binario, 2); // La base es 2
  console.log(
    "El número binario %s en decimal es %s",
    binario,
    binarioEnDecimal
  );

  // Octal a decimal
  let octal = "60"; // 48
  let octalEnDecimal = parseInt(octal, 8); // La base es 8
  console.log("El número octal %s en decimal es %s", octal, octalEnDecimal);

  // Hexadecimal a decimal
  let hexadecimal = "FF"; // 255
  let hexadecimalEnDecimal = parseInt(hexadecimal, 16); // La base es 16
  console.log(
    "El número hexadecimal %s en decimal es %s",
    hexadecimal,
    hexadecimalEnDecimal
  );
}





/**
 * ¿Y para convertir entre distintas bases que no sean decimales?
 * muy fácil, convertimos primero a decimal y luego ese número a la otra base
 */

// Por ejemplo, binario a hexadecimal
// let otroBinario = "1011"; // El 11
// let decimalTemporal = parseInt(otroBinario, 2); // Desde la base 2
// let otroHexadecimal = decimalTemporal.toString(16); // Hacia la base 16

// console.log(
//   "El binario %s equivale a %s en hexadecimal",
//   otroBinario,
//   otroHexadecimal
// );

// // O podemos hacerlo en una sola operación:
// let convertido = parseInt(otroBinario, 2).toString(16);
// console.log(
//   "Si lo hacemos en una línea, el binario %s se convierte en el hexadecimal %s",
//   otroBinario,
//   convertido
// );
