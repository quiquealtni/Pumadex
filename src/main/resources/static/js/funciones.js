function buscarEnTabla() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("miEntrada");
    filter = input.value.toUpperCase();
    table = document.getElementById("tablaUsuarios");
    tr = table.getElementsByTagName("tr");
  
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[0];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }

  function check(){
    var newPassword, confirmPassword;
    newPassword = document.getElementById("newPassword").value;
    confirmPassword = document.getElementById("confirmNewPassword").value;
    if(newPassword!=confirmPassword){
      document.getElementById("msgConfirmPass").textContent = "Las contraseñas no coinciden.";
      document.querySelector('input[name=confirmNewPassword]').setCustomValidity('No coinciden');
    } else{
      document.querySelector('input[name=confirmNewPassword]').setCustomValidity('');

    }  
  }

// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'
  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')
  console.log(forms)
  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        var newPassword, confirmPassword;
        newPassword = document.getElementById("newPassword").value;
        confirmPassword = document.getElementById("confirmNewPassword").value;
        if (!form.checkValidity()||confirmPassword!=newPassword) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
        
      }, false)
    })
})()

function buscarTablaPosicion() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("miEntrada");
  filter = input.value.toUpperCase();
  table = document.getElementById("tablaUsuarios");
  tr = table.getElementsByTagName("tr");

  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}