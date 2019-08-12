<div class="sheet">

    <div class="card">
        <div class="card-encabezado">
            <h3 class="titulo">Información del empleado</h3>
        </div>

        <div class="card-contenido tabla-responsive">
            <div class="columna-12" ng-if="carga3" style="text-align:center;">
                <img src="./assets/img/7YUz.gif" />
            </div>
            <div class="columna-12" ng-if="!carga3">
                <form name="exp" novalidate>
                    <div class="columna-12">
                        <div class="columna-3">
                            <div class="form-texto-animado" style="margin-bottom: 15px !important">
                                <input type="text" class="input-text" name="IdUser" ng-maxlength="4"
                                    ng-model="empleado.IdUser" required>
                                <span ng-show="!exp.$pristine && exp.IdUser.$error.required" class="error letra">Este campo es obligatorio</span>
                                <span ng-show="!exp.$pristine && exp.IdUser.$error.maxlength" class="error letra">Máximo 4 caracteres</span>
                                <label for="IdUser">Código de empleado:</label>
                            </div>
                        </div>

                        <div class="columna-3">
                            <div class="form-texto-animado" style="margin-bottom: 15px !important">
                                <input type="text" class="input-text" name="IdentificationNumber" ng-maxlength="15"
                                    ng-minlength="13" ng-model="empleado.IdentificationNumber" required>
                                <span ng-show="!exp.$pristine && exp.IdentificationNumber.$error.required" class="error letra">El nombre es obligatorio</span>
                                <span ng-show="!exp.$pristine && exp.IdentificationNumber.$error.maxlength" class="error letra">Máximo 15 caracteres</span>
                                <span ng-show="!exp.$pristine && exp.IdentificationNumber.$error.minlength" class="error letra">Mínimo 15 caracteres</span>
                                <label for="IdentificationNumber">No. De Identidad:</label>
                            </div>
                        </div>

                        <div class="columna-3">
                            <div class="form-texto-animado" style="margin-bottom: 15px !important">
                                <input type="text" class="input-text" name="Name" ng-maxlength="250"
                                    ng-model="empleado.Name" required>
                                <span ng-show="!exp.$pristine && exp.Name.$error.required" class="error letra">Este campo es obligatorio</span>
                                <span ng-show="!exp.$pristine && exp.Name.$error.maxlength" class="error letra">Máximo 250 caracteres</span>
                                <label for="Name">Nombre:</label>
                            </div>
                        </div>

                        <div class="columna-3">
                            <div class="form-texto-animado" style="margin-bottom: 15px !important">
                                <input type="date" class="input-text" name="Birthday" ng-model="empleado.Birthday"
                                required>
                                <span ng-show="!exp.$pristine && exp.Birthday.$error.required" class="error letra">Este campo es obligatorio</span>
                                <label for="Birthday">Fecha de nacimiento:</label>
                            </div>
                        </div>
                    </div>


                    <div class="columna-12">


                        <div class="columna-4">
                            <div class="form-texto-animado" style="margin-bottom: 15px !important">
                                <select class="input-text" name="IdDepartment" ng-model="empleado.IdDepartment" required>
                                    <option value="">Seleccione un departamento</option>
                                    <option ng-repeat="d in departments" value="{{d.IdDepartment}}"
                                        ng-selected="{{d.IdDepartment == empleado.IdDepartment}}">{{d.Description}}
                                    </option>
                                </select>

                                <label for="IFD">Departamento:</label>
                                <span ng-show="!exp.$pristine && exp.IdDepartment.$error.required" class="error letra">Este campo es obligatorio</span>
                            </div>
                        </div>


                        <div class="columna-4">
                            <div class="form-texto-animado" style="margin-bottom: 15px !important">


                                <select class="input-text" name="UseShift" ng-model="empleado.ShiftId" required>
                                    <option value="">Seleccione un horario</option>
                                    <option ng-repeat="h in horarios" value="{{h.ShiftId}}"
                                        ng-selected="{{h.ShiftId == empleado.UseShift}}">{{h.Description}}</option>
                                </select>

                                <label for="UseShift">Horario:</label>
                                <span ng-show="!exp.$pristine && exp.UseShift.$error.required" class="error letra">Este campo es obligatorio</span>
                            </div>
                        </div>

                        <div class="columna-4">
                            <div class="form-texto-animado" style="margin-bottom: 15px !important">
                                <select class="input-text" name="Active" ng-model="empleado.Active" required>
                                    <option value="1">Sí</option>
                                    <option value="0">No</option>
                                </select>
                                <label for="Active">Activo:</label>
                                <span ng-show="!exp.$pristine && exp.Active.$error.required" class="error letra">Este campo es obligatorio</span>
                            </div>
                        </div>
                    </div>

                    <div class="columna-12">
                        <div class="columna-4">

                            <button type="button" class="btn form odoo pull-left" data-toggle="modal"
                                data-target="#exampleModal" ng-if="permissions.reghue==true">
                                Huellas
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Registro de huellas</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="card2-contenido tabla-responsive">
                                                <img src="./assets/img/HANDS.png" width="100%" />
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="button" class="btn btn-primary">Save changes</button>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="columna-4">
                            <div class="form-texto-animado" style="margin-bottom: 15px !important" ng-if="permissions.agdispemp==true">
                                <select class="input-text" name="IdDispositivo" ng-model="empleado.IdDispositivo" >
                                    <option value="">Seleccione un dispositivo</option>
                                    <option ng-repeat="d in dispositivos" value="{{d.IdDevice}}">{{d.Description}}
                                    </option>
                                </select>
                                <label for="IdDispositivo">Dispositivo:</label>
                            </div>
                        </div>

                        <div class="columna-4">
                            <button class="btn form odoo pull-right" ng-click="agregarDispositivo()" ng-if="permissions.agdispemp==true">
                                Agregar
                            </button>
                        </div>
                    </div>

                    <div class="columna-12">
                        <table class="tabla" ng-if="tempProduct.length">
                            <thead style="text-align:center">
                                <th>#</th>
                                <th># dispositivo</th>
                                <th>Nombre dispositivo</th>
                                <th></th>
                            </thead>
                            <tbody>
                                <tr ng-click="verDetaClient(c.idClient)" ng-repeat="t in tempProduct">
                                    <td>{{$index+1}}</td>
                                    <td>{{t.MachineNumber}}</td>
                                    <td>{{t.Description}}</td>
                                    <td>
                                        <button class="btn" style="background: #ff6666" ng-click="deleteMate($index)">
                                            <i class="fa fa-trash-o"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <button class="btn form odoo pull-right" ng-if="permissions.editemp==true" ng-click="modificarEmpleados(empleado)"
                        ng-disabled="carga2 || !exp.$valid">
                        Modificar
                    </button>
                </form>
            </div>
        </div>

    </div>



    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Lista de dispositivos</h4>
        </div>
        <div class="card-contenido tabla-responsive columna-12">
            <div class="columna-12" ng-if="carga2" style="text-align:center">
                <img src="./assets/img/7YUz.gif" />
            </div>
            <div class="columna-4" style="padding-top:25px;" ng-if="deviceList.length && !carga2">
                <div class="form-grupo form-texto-animado">
                    <input type="text" class="input-text" ng-model="filters2.search">
                    <label><i class="fa fa-search"></i> Buscar</label>
                </div>
            </div>

            <div class="columna-12">
                <table class="tabla print" ng-if="deviceList.length && !carga2">
                    <thead style="text-align:center">
                        <th ng-click="orderByMe('cuenta')">#</th>
                        <th># dispositivo</th>
                        <th ng-click="orderByMe('nombre')" style="padding-left:85px;">Nombre dispositivo</th>
                        <th></th>
                    </thead>
                    <tbody>
                        <tr ng-repeat="d in deviceList | filter: filters2.search">
                            <td>{{$index + 1}}</td>
                            <td>{{ d.MachineNumber }}</td>
                            <td style="padding-left:85px;">{{ d.Description }}</td>
                            <td>
                                <button class="btn" style="background: #ff6666"
                                ng-if="permissions.deledispemp==true"
                                    ng-click="deleteDevice(d.IP,d.IdDevice,d.Type)">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <h3 ng-show="!deviceList.length && !carga2">Sin dispositivos</h3>
            </div>
        </div>
    </div>



    <div class="card">
        <div class="card-encabezado" style="margin-bottom: 10px">
            <h4 class="titulo">Asistencia</h4>
        </div>

        <form>
            <div class="columna-12">

                <div class="columna-6">
                    <div class="form-texto-animado" style="margin-bottom: 10px !important;">
                        <select class="input-text" name="IdDepartment" ng-model="asistencia.tipo">
                            <option value="">Fecha única</option>
                            <option value="1">Rango de fechas</option>
                        </select>
                        <label for="IdDepartment">Tipo:</label>

                    </div>
                </div>

                <div class="columna-6" ng-if="asistencia.tipo">
                    <div class="form-texto-animado" style="margin-bottom: 10px !important;">
                        <input type="date" class="input-text" name="fecha" ng-model="asistencia.fechaI" required="">
                        <label for="fecha">Fecha inicial</label>
                        <span ng-show="!exp.$pristine && exp.fechaIncio.$error.required" class="error letra">La
                            fecha es obligatoria</span>
                    </div>
                </div>



            </div>

            <div class="columna-12">
                <div class="columna-6">
                    <div class="form-texto-animado" style="margin-bottom: 10px !important;">
                        <input type="date" class="input-text" name="fecha" ng-model="asistencia.fechaF" required="">
                         <label for="fecha">Fecha final</label>
                         <span ng-show="!exp.$pristine && exp.fechaIncio.$error.required" class="error letra">La
                                        fecha es obligatoria</span>
                                </div>
                            </div>



                
                <div class="columna-6" style="padding-top: 10px !important">
                    <button class="btn form odoo pull-left" ng-click="mostrar(asistencia)">
                        <i class="fa fa-calendar"></i> Mostrar
                    </button>
                </div>

            </div>


        </form>

        <div class="card-contenido tabla-responsive columna-12" ng-if="ver">
            <div class="columna-12" style="text-align:center" ng-if="ver && carga">

                <img src="./assets/img/7YUz.gif" />

            </div>
            <div class="columna-12" ng-if="reporteporusuario.length && !carga">
                <div class="card">
                    <div class="card-encabezado">
                        <h4 class="titulo">Reporte asistencia</h4>
                    </div>
                    <div class="card-contenido tabla-responsive columna-12">
                        <div class="columna-12">
                            <div class="columna-4" style="margin-bottom: 15px;"
                                ng-if="ver && reporteporusuario.length && !carga && asistencia.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="text" class="input-text" ng-model="filters.search">
                                    <label for="buscar"><i class="fa fa-search"></i> Buscar</label>
                                </div>
                            </div>
                            <div class="columna-4" style="margin-bottom: 15px;"
                                ng-if="ver && reporteporusuario.length && !carga">
                                <button class="btn form odoo pull-left" ng-click="exportData()">
                                    <i class="fa fa-file-excel-o"></i> Exportar
                                </button>
                            </div>
                            <div class="columna-4">
                            </div>
                        </div>

                        <table class="tabla print">
                            <thead style="text-align:center">
                                <th ng-click="orderByMe('cuenta')">#</th>
                                <th ng-click="orderByMe('nombre')" style="padding-left:85px;">Nombre</th>
                                <th style="padding-left:85px;">Departamento</th>
                                <th>Horario</th>
                                <th>Hora entrada</th>
                                <th>Hora Marcó (entrada)</th>
                                <th>Dispositivo (entrada)</th>
                                <th>Hora Salida</th>
                                <th>Hora Marcó (salida)</th>
                                <th>Dispositivo (salida)</th>
                                <th>Fecha</th>
                                <th>Día</th>
                                <th>¿Llegó tarde?</th>
                                <th>Horas teóricas trabajadas al día</th>
                                <th>Horas reales trabajadas al día</th>
                                <th>Salida</th>
                                <th>Horas Extra</th>
                            </thead>
                            <tbody>
                                <tr ng-repeat="r in reporteporusuario | filter:filters.search  | orderBy:'+formedDate' |startFromGrid: currentPage * pageSize | limitTo: pageSize"
                                    ng-style="r.asis === 'SÍ' && {'background-color': 'red'}">
                                    <td>{{$index + 1}}</td>
                                    <td style="padding-left:85px;">{{ r.nombre }}</td>
                                    <td style="padding-left:85px;">{{ r.departamento }}</td>
                                    <td>{{ r.nombre_horario }}</td>
                                    <td>{{ r.hora_entrada}}:{{r.minutos_entrada}}</td>
                                    <td>{{ r.fecha_y_hora_marco_min | date: 'HH:mm'}}</td>
                                    <td>{{ r.dispositivoEntrada}}</td>
                                    <td>{{ r.hora_salida}}:{{r.minutos_salida}}</td>
                                    <td ng-if="r.fecha_y_hora_marco_min == r.fecha_y_hora_marco_max">No marcó</td>
                                    <td ng-if="r.fecha_y_hora_marco_min != r.fecha_y_hora_marco_max">
                                        {{ r.fecha_y_hora_marco_max | date: 'HH:mm'}}</td>
                                    <td ng-if="r.fecha_y_hora_marco_min == r.fecha_y_hora_marco_max">Ninguno</td>
                                    <td ng-if="r.fecha_y_hora_marco_min != r.fecha_y_hora_marco_max">
                                        {{ r.dispositivoSalida}}</td>
                                    <td>{{ r.fecha }}</td>
                                    <td>{{ r.dia }}</td>
                                    <td>{{ r.asis }}</td>
                                    <td>{{r.horastrabajadassincomer}}</td>
                                    <td>{{ r.horasrealestrabajadas}}</td>
                                    <td>{{ r.salioantes }}</td>
                                    <td>{{ r.extras }}</td>
                                </tr>
                            </tbody>
                        </table>
                        <button ng-hide="!reporteporusuario.length" type='button' class='btn form odoo'
                            ng-disabled='currentPage == 0' ng-click='currentPage = currentPage - 1'>&laquo;</button>
                        <button ng-hide="!reporteporusuario.length" type='button' class='btn form odoo'
                            ng-disabled='currentPage == page.no - 1' ng-click='setPage(page.no)'
                            ng-repeat='page in pages'>{{page.no}}</button>
                        <button ng-hide="!reporteporusuario.length" type='button' class='btn form odoo'
                            ng-disabled='currentPage >= reporteporusuario.length/pageSize - 1' ,
                            ng-click='currentPage = currentPage + 1'>&raquo;</button>


                    </div>
                </div>
            </div>
            <h3 ng-show="noreg==true && !carga">No hay registros</h3>
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

<style>
    .error {
        color: red;
    }

    .warning {
        color: #ffcc00;
    }

    .letra {
        font-size: 13px;
    }
</style>