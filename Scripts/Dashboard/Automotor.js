﻿google.charts.load('current', {
    'packages': ['geochart'],
    // Note: you will need to get a mapsApiKey for your project.
    // See: https://developers.google.com/chart/interactive/docs/basic_load_libs#load-settings
    'mapsApiKey': 'AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY'
});

google.charts.load("current", { packages: ["corechart"] });

var lstAutomotorUbicacionBE = null;
var lstAutomotorMarcaBE = null;
var lstAutomotorTipoPersonaBE = null;
var lstAutomotorTipoVehiculoBE = null;
var lstAutomotorAnioFabricacionBE = null;

$(document).ready(function () {
    ListarAutomotorUbicacion();
    ListarAutomotorMarca();
    ListarAutomotorTipoPersona();
    ListarAutomotorTipoVehiculo();
    ListarAutomotorAnioFabricacion();
});

function ListarAutomotorUbicacion() {
    $("#dt-tabla-ubicacion").dataTable().fnClearTable();
    $.ajax({
        url: ruta_actual + "Dashboard/AutomotorUbicacion",
        type: 'POST',
        cache: false,
        success: function (data) {
            if (data) {
                if (data.length > 0) {
                    var lstDatosBE = new Array();
                    lstDatosBE.push(['Provinces', 'Cantidad']);

                    $.each(data, function (i, obj) {
                        $("#dt-tabla-ubicacion").dataTable().fnAddData([
                            (i + 1),
                            obj.DES_DAT_VC,
                            obj.NU_POR_DO
                        ]);

                        lstDatosBE.push([{ v: obj.ABR_DAT_VC, f: obj.DES_DAT_VC }, obj.NU_POR_DO]);
                    });

                    lstAutomotorUbicacionBE = lstDatosBE;
                    google.charts.setOnLoadCallback(DashboardAutomotorUbicacion);
                }
            }
        }
    });
}

function ListarAutomotorMarca() {
    $("#dt-tabla-marca").dataTable().fnClearTable();
    $.ajax({
        url: ruta_actual + "Dashboard/AutomotorMarca",
        type: 'POST',
        cache: false,
        success: function (data) {
            if (data) {
                if (data.length > 0) {
                    var lstDatosBE = new Array();
                    lstDatosBE.push(['Marca', 'Porcentaje']);
                    $.each(data, function (i, obj) {
                        $("#dt-tabla-marca").dataTable().fnAddData([
                            (i + 1),
                            obj.DES_DAT_VC,
                            obj.NU_POR_DO
                        ]);

                        lstDatosBE.push([obj.DES_DAT_VC, obj.NU_POR_DO]);
                    });

                    lstAutomotorMarcaBE = lstDatosBE;
                    google.charts.setOnLoadCallback(DashboardAutomotorMarca);
                }
            }
        }
    });
}

function ListarAutomotorTipoPersona() {
    $("#dt-tabla-tipo-persona").dataTable().fnClearTable();
    $.ajax({
        url: ruta_actual + "Dashboard/AutomotorTipoPersona",
        type: 'POST',
        cache: false,
        success: function (data) {
            if (data) {
                if (data.length > 0) {
                    var lstDatosBE = new Array();
                    lstDatosBE.push(['Tipo', 'Porcentaje']);

                    $.each(data, function (i, obj) {
                        $("#dt-tabla-tipo-persona").dataTable().fnAddData([
                            (i + 1),
                            obj.DES_DAT_VC,
                            obj.NU_POR_DO
                        ]);

                        lstDatosBE.push([obj.DES_DAT_VC, obj.NU_POR_DO]);
                    });

                    lstAutomotorTipoPersonaBE = lstDatosBE;
                    google.charts.setOnLoadCallback(DashboardAutomotorTipoPersona);
                }
            }
        }
    });
}

function ListarAutomotorTipoVehiculo() {
    $("#dt-tabla-tipo-vehiculo").dataTable().fnClearTable();
    $.ajax({
        url: ruta_actual + "Dashboard/AutomotorTipoVehiculo",
        type: 'POST',
        cache: false,
        success: function (data) {
            if (data) {
                if (data.length > 0) {
                    var lstDatosBE = new Array();
                    lstDatosBE.push(['Tipo Vehiculo', 'Porcentaje']);
                    $.each(data, function (i, obj) {
                        $("#dt-tabla-tipo-vehiculo").dataTable().fnAddData([
                            (i + 1),
                            obj.DES_DAT_VC,
                            obj.NU_POR_DO
                        ]);

                        lstDatosBE.push([obj.DES_DAT_VC, obj.NU_POR_DO]);
                    });

                    lstAutomotorTipoVehiculoBE = lstDatosBE;
                    google.charts.setOnLoadCallback(DashboardAutomotorTipoVehiculo);
                }
            }
        }
    });
}

function ListarAutomotorAnioFabricacion() {
    $("#dt-tabla-anio-fabricacion").dataTable().fnClearTable();
    $.ajax({
        url: ruta_actual + "Dashboard/AutomotorAnioFabricacion",
        type: 'POST',
        cache: false,
        success: function (data) {
            if (data) {
                if (data.length > 0) {
                    var lstDatosBE = new Array();
                    lstDatosBE.push(['Vencimiento', 'Cantidad', { role: "style" }]);

                    $.each(data, function (i, obj) {
                        $("#dt-tabla-anio-fabricacion").dataTable().fnAddData([
                            (i + 1),
                            obj.DES_DAT_VC,
                            obj.NU_CAN_SI
                        ]);

                        lstDatosBE.push([obj.DES_DAT_VC, obj.NU_CAN_SI, "#36c"]);
                    });

                    lstAutomotorAnioFabricacionBE = lstDatosBE;
                    google.charts.setOnLoadCallback(DashboardAutomotorAnioFabricacion);
                }
            }
        }
    });
}



function DashboardAutomotorUbicacion() {
    var data = google.visualization.arrayToDataTable(lstAutomotorUbicacionBE);

    var options = {
        region: 'PE',
        //'#e8e8e8','#4164ab','#23b7e5'
        sizeAxis: { minValue: 0, maxValue: 100 },
        colorAxis: { colors: ['#f5f5f5', '#23b7e5', '#52a7c1'/*,'#9c9','#fe9a67','#ffcc99','#ff6','#fd6698'*/] },
        resolution: 'provinces',
        backgroundColor: '#fff',
        datalessRegionColor: '#fff'/*,
          defaultColor: '#f5f5f5',
          colorAxis: {
            minValue: 0,
            maxValue: 400
          }*/
    };

    var chart = new google.visualization.GeoChart(document.getElementById('dashboard-ubicacion'));
    chart.draw(data, options);
}

function DashboardAutomotorMarca() {
    var data = google.visualization.arrayToDataTable(lstAutomotorMarcaBE);
    
    var options = {
        title: 'Automotor Marca',
        is3D: true,
    };

    var chart = new google.visualization.PieChart(document.getElementById('dashboard-marca'));
    chart.draw(data, options);
}

function DashboardAutomotorTipoPersona() {
    var data = google.visualization.arrayToDataTable(lstAutomotorTipoPersonaBE);

    var options = {
        title: 'Automotor Tipo Persona',
        is3D: true,
    };

    var chart = new google.visualization.PieChart(document.getElementById('dashboard-tipo-persona'));
    chart.draw(data, options);
}

function DashboardAutomotorTipoVehiculo() {
    var data = google.visualization.arrayToDataTable(lstAutomotorTipoVehiculoBE);

    var options = {
        title: 'Automotor    Tipo Vehiculo',
        is3D: true,
    };

    var chart = new google.visualization.PieChart(document.getElementById('dashboard-tipo-vehiculo'));
    chart.draw(data, options);
}

function DashboardAutomotorAnioFabricacion() {
    var data = google.visualization.arrayToDataTable(lstAutomotorAnioFabricacionBE);

    var view = new google.visualization.DataView(data);

    view.setColumns([0, 1,
        {
            calc: "stringify",
            sourceColumn: 1,
            type: "string",
            role: "annotation"
        },
        2]);

    var options = {
        title: "Automotor Año Fabricación",
        //width: 460,
        //height: 250,
        //bar: { groupWidth: "90%" },
        legend: { position: "none" }
    };

    var chart = new google.visualization.BarChart(document.getElementById("dashboard-anio-fabricacion"));
    chart.draw(view, options);
}