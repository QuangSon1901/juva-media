$(function () {
    loadData();
});

function loadData() {
    getServiceAdmin();
}

async function getServiceAdmin() {
    let method = "get",
        url = "/service.data",
        params = null,
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            let eleProducts = res.data.data.map(
                (service) => `
                    <tr>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-left slice-text">${service.name}</div>
                        </td>
                        <td class="p-2 whitespace-nowrap">    
                            <input class="mr-2 mt-[0.3rem] h-3.5 w-8 appearance-none rounded-[0.4375rem] bg-neutral-300 before:pointer-events-none before:absolute before:h-3.5 before:w-3.5 before:rounded-full before:bg-transparent before:content-[''] after:absolute after:z-1 after:-mt-[0.1875rem] after:h-5 after:w-5 after:rounded-full after:border-none after:bg-neutral-100 after:shadow-[0_0px_3px_0_rgb(0_0_0_/_7%),_0_2px_2px_0_rgb(0_0_0_/_4%)] after:transition-[background-color_0.2s,transform_0.2s] after:content-[''] checked:bg-blue-500 checked:after:absolute checked:after:z-1 checked:after:-mt-[3px] checked:after:ml-[1.0625rem] checked:after:h-5 checked:after:w-5 checked:after:rounded-full checked:after:border-none checked:after:bg-blue-500 checked:after:shadow-[0_3px_1px_-2px_rgba(0,0,0,0.2),_0_2px_2px_0_rgba(0,0,0,0.14),_0_1px_5px_0_rgba(0,0,0,0.12)] checked:after:transition-[background-color_0.2s,transform_0.2s] checked:after:content-[''] hover:cursor-pointer focus:outline-none focus:ring-0 focus:before:scale-100 focus:before:opacity-[0.12] focus:before:shadow-[3px_-1px_0px_13px_rgba(0,0,0,0.6)] focus:before:transition-[box-shadow_0.2s,transform_0.2s] focus:after:absolute focus:after:z-1 focus:after:block focus:after:h-5 focus:after:w-5 focus:after:rounded-full focus:after:content-[''] checked:focus:border-primary checked:focus:bg-primary checked:focus:before:ml-[1.0625rem] checked:focus:before:scale-100 checked:focus:before:shadow-[3px_-1px_0px_13px_#3b71ca] checked:focus:before:transition-[box-shadow_0.2s,transform_0.2s]" 
                                    type="checkbox" 
                                    role="switch" 
                                    id="toggleSwitchStatus_${service.id}" 
                                    ${service.status === 1 ? 'checked' : ''}
                                    onchange="updateServiceStatus(${service.id}, this.checked)"/>
                            <label class="inline-block pl-[0.15rem] hover:cursor-pointer" for="toggleSwitchStatus_${service.id}"></label>
                        </td>
                        <td class="p-2 whitespace-nowrap">
                            <div class="text-lg text-center">
                                <box-icon type='solid' name='edit' class="cursor-pointer" onclick="getServiceAdminToModel(${service.id})"></box-icon>
                                <box-icon name='trash' class="cursor-pointer" data-id="${service.id}" onclick="deleteServiceAdmin($(this))"></box-icon>
                                </div>
                        </td>
                    </tr>
                `
            );

            $("#service-admin-table").html(eleProducts);
            break;
    }
}
async function deleteServiceAdmin(r) {
    let method = "post",
        url = "/service.delete",
        params = null,
        data = { id: r.data("id") };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            r.parents("tr").remove();
            break;
    }
}

async function updateServiceStatus(serviceId, isChecked) {
    const status = isChecked ? 1 : 0;

    let method = "post",
        url = "/service.update-status",
        params = null,
        data = {
            'service_id': serviceId,
            'status': status
        };
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            break
            
    }
}

async function getServiceAdminToModel(service_id) {
    let method = "get",
        url = "/get-detail-service",
        params = { service_id },
        data = null;
    let res = await axiosTemplate(method, url, params, data);
    switch (res.data.status) {
        case 200:
            openModalUpdateServiceAdmin();

            $("#modal-update-service-admin input#name").val(res.data.data.name);
            $("#modal-update-service-admin input#update-id").data("id", res.data.data.id);
            break;
    }
}
