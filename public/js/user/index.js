// async function loadContent(newUrl) {
//     let method = "get",
//         url = newUrl,
//         params = null,
//         data = null;
//     let res = await axiosTemplate(method, url, params, data);
//     var content = res.data;
//     $("#user-dynamic-content").html(content);
//     console.log(1111);
// }
// loadContent('/tai-khoan/thong-tin-ca-nhan')
// // Handle URL changes
// window.onpopstate = function(event) {
//     if (event.state && event.state.url) {
//         console.log(222);
//         loadContent(event.state.url);
//     }
// };
// // Change content on navigation
// document.querySelectorAll('.nav-link-conten-user a').forEach(function(link) {
//     console.log(1111);
//     link.addEventListener('click', function(e) {
//         e.preventDefault();
//         loadContent(this.href);
//         history.pushState({ url: this.href }, '', this.href);
//     });
// });
function changePassword() {
    $("#changePassField").removeClass("hidden");
    $("#changePassField").addClass("flex");
}
async function updateProfile() {
    if(!checkValidateSave($('#proflie-info-form'))) return false
    // let method = "post",
    //     url = "/post-login",
    //     params = null,
    //     data = {
    //         email: $("#email-field-login").val(),
    //         password: $("#password-field-login").val(),
    //     };
    // let res = await axiosTemplate(method, url, params, data);
    // switch (res.data.status) {
    //     case 200:
    //         Swal.fire({
    //             position: "center",
    //             icon: "success",
    //             title: res.data.message,
    //             showConfirmButton: true,
    //             timer: 1500,
    //             confirmButtonText: "OK",
    //         }).then(closeModalLogin());
    //         $("#header-action-user div:first-child").remove();
    //         $("#header-action-user").prepend(`
    //             <div class="flex gap-1 items-center cursor-pointer">
    //             <box-icon name='user' class="w-5 h-5"></box-icon>
    //             <span class="text-sm">${res.data.data.name}</span>
    //         </div>
    //             `);
    //         break;
    //     case 403:
    //         Swal.fire({
    //             position: "center",
    //             icon: "warning",
    //             title: res.data.message,
    //             showConfirmButton: true,
    //             timer: 1500,
    //             confirmButtonText: "OK",
    //         });
    //         break;
    // }
}