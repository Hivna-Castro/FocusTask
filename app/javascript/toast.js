function successToast(description) {
  iziToast.success({
    title: "Sucesso!",
    message: description,
    timeout: 1000,
    position: "topRight",
  });
}

function errorToast(description) {
  iziToast.error({
    title: "Erro!",
    message: description,
    timeout: 1000,
    position: "topRight",
  });
}
