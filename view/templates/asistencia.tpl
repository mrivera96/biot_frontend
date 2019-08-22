<div class="columna-12">

    <div class="card">

        <div class="card-encabezado" style="margin-bottom: 10px">
            <h4 class="titulo">Asistencia</h4>
        </div>

        <form>

            <div class="columna-12">

                <div class="columna-4">
                    <div class="form-texto-animado" style="margin-bottom: 15px
                        !important">
                        <select class="input-text" name="IdDepartment" ng-model="asistencia.tipo">
                            <option value="">Fecha única</option>
                            <option value="1">Rango de fechas</option>
                        </select>
                        <label for="IdDepartment">Tipo:</label>
                        <span ng-show="!exp.$pristine &&
                            exp.IdDepartment.$error.required" class="error
                            letra">Este
                            campo es obligatorio</span>
                    </div>
                </div>


                <div class="columna-4">
                    <div class="form-texto-animado" style="margin-bottom: 15px
                        !important">
                        <select  class="input-text" name="IdDepartment" ng-model="asistencia.IdDepartment">
                    
                            <option value="">Seleccione un departamento</option>
                            <option ng-repeat="d in departments"
                                 value="{{d.IdDepartment}}" >{{d.Description}}
                            </option>
                        </select>
                        <label for="IdDepartment">Departamento:</label>
                    </div>
                </div>

            </div>

            <div class="columna-12">
                <div class="columna-4" ng-if="asistencia.tipo">
                    <div class="form-grupo form-texto-animado" style="margin-bottom: 15px !important">
                        <input type="date" class="input-text" name="fecha" ng-model="asistencia.fechaI" required="">
                        <label for="fecha">Fecha inicial</label>
                        <span ng-show="!exp.$pristine &&
                            exp.fechaIncio.$error.required" class="error letra">La
                            fecha es obligatoria</span>
                    </div>
                </div>

                <div class="columna-4">
                    <div class="form-grupo form-texto-animado" style="margin-bottom: 15px !important">
                        <input type="date" class="input-text" name="fecha" ng-model="asistencia.fechaF" required="">
                        <label for="fecha">Fecha final</label>
                        <span ng-show="!exp.$pristine &&
                            exp.fechaIncio.$error.required" class="error letra">La
                            fecha es obligatoria</span>
                    </div>
                </div>


                <div class="columna-4" style="margin-bottom: 15px !important">
                    <button class="btn form odoo pull-left" ng-click="mostrar(asistencia)">
                        <i class="fa fa-calendar"></i> Mostrar
                    </button>
                </div>
            </div>

        </form>

        <div class="card-contenido tabla-responsive columna-12" ng-if="ver">
            <div class="columna-12" style="text-align:center" ng-if="ver &&
                carga">

                <img src="./assets/img/7YUz.gif" />

            </div>
            <div class="columna-12" ng-if="reporte.length && !carga">
                <div class="card">
                    <div class="card-encabezado">
                        <h4 class="titulo">Reporte asistencia</h4>
                    </div>
                    <div class="card-contenido tabla-responsive columna-12">
                        <div class="columna-4" style="padding-top:25px;" ng-if="ver && reporte.length && !carga &&
                            !asistencia.tipo">
                            <div class="form-grupo form-texto-animado">
                                <input type="text" class="input-text" ng-model="tarde" readonly>
                                <label for="test">Personas que llegaron tarde</label>
                            </div>
                        </div>

                        <div class="columna-4" style="padding-top:25px;" ng-if="ver && reporte.length && !carga">
                            <div class="form-grupo form-texto-animado">
                                <input type="text" class="input-text" ng-model="filters.search" ng-change="filterData(filters.search)">
                                <label for="buscar"><i class="fa fa-search"></i>
                                    Buscar</label>
                            </div>
                        </div>
                        <div class="columna-4" style="padding-top:25px;" ng-if="ver && reporte.length && !carga">
                            <button class="btn form odoo pull-left" ng-click="exportData()">
                                <i class="fa fa-file-excel-o"></i> Exportar
                            </button>
                        </div>



                        <table class="tabla print">
                            <thead style="text-align:center">
                                <th ng-click="orderByMe('cuenta')">N#</th>
                                <th ng-click="orderByMe('nombre')" style="padding-left:85px;">Nombre</th>
                                <th style="padding-left:85px;">Departamento</th>
                                <th>Horario</th>
                                <th>Hora entrada</th>
                                <th>Hora Marcó (entrada)</th>
                                <th>Hora Salida</th>
                                <th>Hora Marcó (salida)</th>
                                <th>Fecha</th>
                                <th>Día</th>
                                <th>¿Llegó tarde?</th>
                                <th>Horas teóricas trabajadas </th>
                                <th>Horas reales trabajadas</th>
                                <th>Tiempo de salida </th>
                                <th>Horas Extras</th>
                            </thead>
                            <tbody>
                                <tr ng-repeat="r in reporte |
                                    filter:filters.search | startFromGrid:
                                    currentPage * pageSize | limitTo: pageSize|
                                    orderBy : '+nombre'" ng-style="r.asis === 'SÍ' &&
                                    {'background-color': 'red'}">
                                    <td>{{$index + 1}}</td>
                                    <td style="padding-left:85px;">{{ r.nombre }}
                                    </td>
                                    <td style="padding-left:85px;">{{ r.departamento }}</td>
                                    <td>{{ r.nombre_horario }}</td>
                                    <td>{{ r.hora_entrada}}:{{r.minutos_entrada}}
                                    </td>
                                    <td>{{ r.fecha_y_hora_marco_min}}</td>
                                    <td>{{ r.hora_salida}}:{{r.minutos_salida}}</td>
                                    <td ng-if="r.fecha_y_hora_marco_min ==
                                        r.fecha_y_hora_marco_max">No marcó</td>
                                    <td ng-if="r.fecha_y_hora_marco_min !=
                                        r.fecha_y_hora_marco_max">
                                        {{ r.fecha_y_hora_marco_max}}</td>
                                    <td>{{ r.fecha }}</td>
                                    <td>{{ r.dia }}</td>
                                    <td>{{ r.asis }}</td>
                                    <td>{{ r.horastrabajadas}}</td>
                                    <td>{{r.horasrealestrabajadas}}</td>
                                    <td>{{ r.salioantes }}</td>
                                    <td>{{r.extras}}</td> 
                                </tr>
                            </tbody>
                        </table>

                        <button ng-hide="!reporte.length" type='button' class='btn form odoo' ng-disabled='currentPage == 0' ng-click='currentPage= currentPage - 1'>&laquo;</button>
                        <button ng-hide="!reporte.length" type='button' class='btn form odoo' ng-disabled='currentPage ==
                            page.no - 1' ng-click='setPage(page.no)' ng-repeat='page in pages'>{{page.no}}</button>
                        <button ng-hide="!reporte.length" type='button' class='btn form odoo' ng-disabled='currentPage >=
                            reporte.length/pageSize - 1' , ng-click='currentPage
                            = currentPage + 1'>&raquo;</button>

                        <h3 ng-show="!reporte.length && !carga">No hay registros</h3>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<style>
    .tdNombre {
        max-width: 380px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
</style>
