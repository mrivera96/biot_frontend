<div class="sheet" ng-if="permissions.creaemp==true">
    <div class="columna-12">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Registrar empleado</h4>
            </div>
            <div class="card-contenido tabla-responsive">
                <div class="columna-12" ng-if="!carga" style="text-align:center">
                   
                        <img src="./assets/img/7YUz.gif"/>
                    
                </div>
                <div class="columna-12" ng-if="crear && carga">
                    <form name="exp" novalidate>
                        <div class="columna-3">
                            <div class="form-grupo form-texto-animado" style="margin-bottom:15px">
                                <input type="text" class="input-text" name="IdUser" ng-maxlength="4" ng-model="empleado.IdUser" required>
                                <span ng-show="!exp.$pristine && exp.IdUser.$error.required" class="error letra">Este campo es obligatorio</span>
                                <span ng-show="!exp.$pristine && exp.IdUser.$error.maxlength" class="error letra">Máximo 4 caracteres</span>
                                <label>Código empleado</label>
                            </div>
                        </div>

                        <div class="columna-3">
                            <div class="form-grupo form-texto-animado"style="margin-bottom:15px">
                                <input type="text" class="input-text" name="IdentificationNumber" ng-maxlength="15" ng-minlength="13" ng-model="empleado.IdentificationNumber" required>
                                <span ng-show="!exp.$pristine && exp.IdentificationNumber.$error.required" class="error letra">El nombre es obligatorio</span>
                                <span ng-show="!exp.$pristine && exp.IdentificationNumber.$error.maxlength" class="error letra">Máximo 15 caracteres</span>
                                <span ng-show="!exp.$pristine && exp.IdentificationNumber.$error.minlength" class="error letra">Mínimo 15 caracteres</span>
                                <label>N# identidad</label>
                            </div>
                        </div>

                        <div class="columna-3">
                            <div class="form-grupo form-texto-animado"style="margin-bottom:15px">
                                <input type="text" class="input-text" name="Name" ng-maxlength="250" ng-model="empleado.Name" required>
                                <span ng-show="!exp.$pristine && exp.Name.$error.required" class="error letra">Este campo es obligatorio</span>
                                <span ng-show="!exp.$pristine && exp.Name.$error.maxlength" class="error letra">Máximo 250 caracteres</span>
                                <label>Nombre</label>
                            </div>
                        </div>

                        <div class="columna-3">
                            <div class="form-grupo form-texto-animado"style="margin-bottom:15px">
                                <input type="date" class="input-text" name="fechaF" ng-model="empleado.fechaF" required>
                                <span ng-show="!exp.$pristine && exp.fechaF.$error.required" class="error letra">Este campo es obligatorio</span>
                                <label>Fecha nacimiento</label>
                            </div>
                        </div>


                        <div class="columna-12">
                            

                            <div class="columna-3">
                                <div class="form-texto-animado" style="margin-bottom:15px">
                                    <select class="input-text" name="IdDepartment" ng-model="empleado.IdDepartment" required>
                                        <option value="">Seleccione un departamento</option>
                                        <option ng-repeat="d in departments" value="{{d.IdDepartment}}">{{d.Description}}</option>
                                    </select>
                                    <label for="">Departamento:</label>
                                    <span ng-show="!exp.$pristine && exp.IdDepartment.$error.required" class="error letra">Este campo es obligatorio</span>
                                </div>
                            </div>

                           

                            <div class="columna-3">
                                <div class="form-texto-animado" style="margin-bottom:15px">
                                    <select class="input-text" name="UseShift" ng-model="empleado.ShiftId" required>
                                        <option value="">Seleccione un horario</option>
                                        <option ng-repeat="h in horarios" value="{{h.ShiftId}}">{{h.Description}}</option>
                                    </select>
                                    <label for="UseShift">Horario:</label>
                                    <span ng-show="!exp.$pristine && exp.UseShift.$error.required" class="error letra">Este campo es obligatorio</span>
                                </div>
                            </div>

                            <div class="columna-1" style="padding-top: 25px;">
                                <label style="color: #006d6b;">Activo:</label>
                            </div>

                            <div class="columna-3">
                                <div class="form-texto-animado" style="margin-bottom:15px">
                                    <select class="input-text" name="Active" ng-model="empleado.Active" required>
                                        <option value="">Seleccione un estado</option>
                                        <option value="1">Sí</option>
                                        <option value="0">No</option>
                                    </select>
                                    <span ng-show="!exp.$pristine && exp.Active.$error.required" class="error letra">Este campo es obligatorio</span>
                                </div>
                            </div>
                        </div>
                        <div class="columna-12">
                            <div class="columna-2" style="padding-top: 10px;">
                                <button type="button" class="btn form odoo pull-left" data-toggle="modal" data-target="#exampleModal">
                                    Huellas
                                </button>

                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                    <img src="./assets/img/HANDS.png" width="100%"/>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columna-1" style="padding-top: 25px;">
                                <label style="color: #006d6b;">Dispositivo:</label>
                            </div>

                            <div class="columna-3">
                                <div class="form-texto-animado" style="margin-bottom:15px">
                                    <select class="input-text" name="IdDispositivo" ng-model="empleado.IdDispositivo">
                                        <option value="">Seleccione un dispositivo</option>
                                        <option ng-repeat="d in dispositivos" value="{{d.IdDevice}}">{{d.Description}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="columna-2">
                                <button class="btn form odoo pull-right" ng-click="agregarDispositivo()">
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
                        <button class="btn form odoo pull-right" ng-click="guardarEmpleados(empleado)" ng-if="crear"  ng-disabled="!exp.$valid || !tempProduct.length">
                            Guardar
                        </button>
                        <button class="btn form odoo pull-right" ng-click="descartarEmpleado()" ng-if="crear">
                            Descartar
                        </button>
                    </form>
                </div>

                <button class="btn form odoo pull-right" ng-click="crearEmpleado()" ng-if="!crear">
                    Crear
                </button>


            </div>

        </div>
    </div>
</div>

<div class="sheet">
    <div class="columna-12">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Lista de empleados</h4>
            </div>
            <div class="card-contenido tabla-responsive columna-12">
                <div class="columna-4"  ng-if="empleados.length">
                    <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                        <input type="text" class="input-text" ng-model="filters.search" ng-change="filterData(filters.search)">
                        <label><i class="fa fa-search"></i> Buscar</label>
                    </div>
                </div>
               
                <div class="columna-12" style="text-align:center" ng-if="carga2">
                    
                        <img src="./assets/img/7YUz.gif"/>
                    
                </div>
                <div class="columna-12">
                    <table class="tabla print" ng-if="empleados.length && !carga2">
                        <thead style="text-align:center">
                        <th ng-click="orderByMe('cuenta')">#</th>
                        <th >Código empleado</th>
                        <th ng-click="orderByMe('nombre')" style="padding-left:85px;">Nombre</th>
                        <th style="padding-left:85px;"># identidad</th>
                        <th>Departamento</th>
                        <th>Activo</th>
                        </thead>
                        <tbody>
                        <tr ng-repeat="e in empleados | filter: filters.search | startFromGrid: currentPage * pageSize | limitTo: pageSize" ng-if="deptsUsr[e.IdDepartment]==true || IdUsr==1" ng-click="verDetail(e.IdUser, e.Description)">
                            <td>{{$index + 1}}</td>
                            <td>{{ e.IdUser }}</td>
                            <td style="padding-left:85px;">{{ e.Name }}</td>
                            <td style="padding-left:85px;">{{ e.IdentificationNumber }}</td>
                            <td>{{ e.Description }}</td>
                            <td ng-if="e.Active == 1">Sí</td>
                            <td ng-if="e.Active == 0">No</td>
                        </tr>
                        </tbody>
                    </table>
                    <button ng-hide="!empleados.length" type='button' class='btn form odoo' ng-disabled='currentPage == 0' ng-click='currentPage = currentPage - 1'>&laquo;</button>
                    <button ng-hide="!empleados.length" type='button' class='btn form odoo' ng-disabled='currentPage == page.no - 1' ng-click='setPage(page.no)' ng-repeat='page in pages'>{{page.no}}</button>
                    <button ng-hide="!empleados.length" type='button' class='btn form odoo' ng-disabled='currentPage >= empleados.length/pageSize - 1' , ng-click='currentPage = currentPage + 1'>&raquo;</button>
                    <h3 ng-show="!empleados.length && !carga2">No hay empleados registrados</h3>
                </div>
            </div>
        </div>
    </div>
</div>

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