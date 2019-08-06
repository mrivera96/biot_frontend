<div class="sheet">
    <div class="card">
        <div class="card-encabezado">
            <h3 class="titulo">Información del usuario</h3>
        </div>

        <div class="card-contenido tabla-responsive">
            <div class="columna-12" ng-if="cargar" style="text-align:center;">
                <img src="./assets/img/7YUz.gif" />
            </div>
            <form name="upload" novalidate>
                <div class="columna-12">
                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                            <input type="text" class="input-text" id="name" name="name" ng-maxlength="25"
                                ng-model="currUsr.name" required>
                            <label for="name">Nombres</label>
                            <span ng-show="!upload.$pristine && upload.name.$error.required" class="error letra">El
                                nombre del usuario es obligatorio.</span>
                            <span ng-show="!upload.$pristine && upload.name.$error.maxlength" class="error letra">Máximo
                                25 caracteres</span>
                        </div>
                    </div>

                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                            <input type="text" class="input-text" id="last_name" name="last_name" ng-maxlength="25"
                                ng-model="currUsr.last_name" required>
                            <label for="last_name">Apellidos</label>
                            <span ng-show="!upload.$pristine && upload.last_name.$error.required" class="error letra">El
                                apellido del usuario es obligatorio.</span>
                            <span ng-show="!upload.$pristine && upload.last_name.$error.maxlength"
                                class="error letra">Máximo 25 caracteres</span>
                        </div>
                    </div>
                </div>

                <div class="columna-12">
                    <div class="columna-6">
                        <div class="form-texto-animado" style="margin-bottom: 15px">
                            <select class="input-text" id="genero" name="genero" ng-model="currUsr.genero" required>
                                <option value="">Seleccione el género</option>
                                <option value="M">M</option>
                                <option value="F">F</option>
                                <option value="X">Prefiero no decirlo</option>
                            </select>
                            <label for="genero">Género:</label>
                            <span ng-show="!upload.$pristine && upload.genero.$error.required" class="error letra">El
                                genero del usuario es obligatorio.</span>
                        </div>
                    </div>

                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                            <input type="text" class="input-text" id="no_identidad" name="no_identidad"
                                ng-maxlength="15" ng-minlength="13" ng-model="currUsr.no_identidad" required>
                            <label for="no_identidad">N# de identidad</label>
                            <span ng-show="!upload.$pristine && upload.no_identidad.$error.required"
                                class="error letra">El N# de identidad del usuario es obligatorio.</span>
                            <span ng-show="!upload.$pristine && upload.no_identidad.$error.maxlength"
                                class="error letra">Máximo 15 caracteres</span>
                            <span ng-show="!upload.$pristine && upload.no_identidad.$error.minlength"
                                class="error letra">Mínimo 13 caracteres</span>
                        </div>
                    </div>
                </div>

                <div class="columna-12">
                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                            <input type="text" class="input-text" id="email" name="email" ng-maxlength="100"
                                ng-minlength="8" ng-model="currUsr.email" required>
                            <label for="email">Correo empresarial</label>
                            <span ng-show="!upload.$pristine && upload.email.$error.required" class="error letra">El
                                Correo empresarial del usuario es obligatorio.</span>
                            <span ng-show="!upload.$pristine && upload.email.$error.maxlength"
                                class="error letra">Máximo 100 caracteres</span>
                            <span ng-show="!upload.$pristine && upload.email.$error.minlength"
                                class="error letra">Mínimo 8 caracteres</span>
                        </div>
                    </div>

                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                            <input type="text" class="input-text" id="telefono" name="telefono" ng-maxlength="100"
                                ng-minlength="8" ng-model="currUsr.telefono" required>
                            <label for="telefono">Telefono</label>
                            <span ng-show="!upload.$pristine && upload.telefono.$error.required" class="error letra">El
                                telefono del usuario es obligatoria.</span>
                            <span ng-show="!upload.$pristine && upload.telefono.$error.maxlength"
                                class="error letra">Máximo 100 caracteres</span>
                            <span ng-show="!upload.$pristine && upload.telefono.$error.minlength"
                                class="error letra">Mínimo 8 caracteres</span>
                        </div>
                    </div>
                </div>

                <!-- <div class="columna-12">

                 <div class="columna-6">
                        <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                            <input type="text" class="input-text" id="password" name="password" ng-maxlength="100"
                                ng-minlength="3" ng-model="dataForm2.password" required>
                            <label for="password">Contraseña</label>
                            <span ng-show="!upload.$pristine && upload.password.$error.required" class="error letra">La
                                contraseña del administrador es obligatoria.</span>
                            <span ng-show="!upload.$pristine && upload.password.$error.maxlength"
                                class="error letra">Máximo 100 caracteres</span>
                            <span ng-show="!upload.$pristine && upload.password.$error.minlength"
                                class="error letra">Mínimo 3 caracteres</span>
                        </div>
                    </div>

                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                            <input type="text" class="input-text" id="password_confirmation"
                                name="password_confirmation" ng-maxlength="100" ng-minlength="3"
                                ng-model="dataForm2.password_confirmation" required>
                            <label for="password_confirmation">Confirmar contraseña</label>
                            <span ng-show="!upload.$pristine && upload.password_confirmation.$error.required"
                                class="error letra">La confirmación de contraseña del administrador es
                                obligatoria.</span>
                            <span ng-show="!upload.$pristine && upload.password_confirmation.$error.maxlength"
                                class="error letra">Máximo 100 caracteres</span>
                            <span ng-show="!upload.$pristine && upload.password_confirmation.$error.minlength"
                                class="error letra">Mínimo 3 caracteres</span>
                        </div>
                    </div>
                   
                </div>
                -->
                <div class="columna-12">
                    <div class="columna-6">
                        <div class="form-texto-animado" style="margin-bottom: 15px !important"
                            ng-if="permissions.agdispemp==true">
                            <select class="input-text" name="IdDispositivo" ng-model="currUsr.selectedDevice">
                                <option value="">Seleccione un dispositivo</option>
                                <option ng-repeat="d in dispositivos" value="{{d.IdDevice}}">{{d.Description}}
                                </option>
                            </select>
                            <label for="IdDispositivo">Dispositivo:</label>
                        </div>
                    </div>

                    <div class="columna-6">
                        <button class="btn form odoo pull-right" ng-click="agregarDispositivo()" ng-if="permissions.agdispemp==true">
                            Agregar Dispositivo
                        </button>
                    </div>
                </div>

                <div class="columna-12">
                    <table class="tabla" ng-if="tempDevArray.length">
                        <thead style="text-align:center">
                            <th>#</th>
                            <th>Id de Dispositivo</th>
                            <th>Nombre de Dispositivo</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr  ng-repeat="t in tempDevArray">
                                <td>{{$index+1}}</td>
                                <td>{{t.IdDevice}}</td>
                                <td>{{t.description}}</td>
                            
                                <td>
                                    <button class="btn" style="background: #ff6666" ng-click="deleteMate($index)">
                                        <i class="fa fa-trash-o"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


                <div class="columna-12">
                    <div class="columna-6">
                        <div class="form-texto-animado" style="margin-bottom: 15px !important"
                            ng-if="permissions.agdispemp==true">
                            <select class="input-text" name="IdDepartamento" ng-model="currUsr.selectedDept">
                                <option value="">Seleccione un departamento</option>
                                <option ng-repeat="d in departamentos" value="{{d.IdDepartment}}">{{d.Description}}
                                </option>
                            </select>
                            <label for="IdDispositivo">Departamentos asignados:</label>
                        </div>
                    </div>

                    <div class="columna-6">
                        <button class="btn form odoo pull-right" ng-click="agregarDepartamento()">
                            Agregar Departamento
                        </button>
                    </div>
                </div>
                
                <div class="columna-12">
                    <table class="tabla" ng-if="tempDeptArray.length">
                        <thead style="text-align:center">
                            <th>#</th>
                            <th>Id de Departamento</th>
                            <th>Nombre de Departamento</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr  ng-repeat="t in tempDeptArray">
                                <td>{{$index+1}}</td>
                                <td>{{t.Id_department}}</td>
                                <td>{{t.description}}</td>
                            
                                <td>
                                    <button class="btn" style="background: #ff6666" ng-click="deleteMate1($index)">
                                        <i class="fa fa-trash-o"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="columna-12">
                    <button type="submit" ng-click="guardarDatos(currUsr)" class="btn form odoo pull-right"
                        ng-disabled="!upload.$valid">
                        <i class="fa fa-arrow-right"></i>Guardar
                    </button>

                </div>
            </form>

        </div>
    </div>

    <div class="card">
        <div class="card-encabezado">
            <h3 class="titulo">Puertas asignadas</h3>
        </div>

        <div class="card-contenido tabla-responsive permisos">
            <div class="columna-12" ng-if="cargar" style="text-align:center;">
                <img src="./assets/img/7YUz.gif" />
            </div>
            <div class="columna-12">
                <table class="tabla print" ng-if="currUsr.devices.length">
                    <thead style="text-align:center">
                        <th ng-click="orderByMe('cuenta')">#</th>
                        <th>Id Dispositivo</th>
                        <th ng-click="orderByMe('nombre')" >Nombre dispositivo</th>
                        <th></th>
                    </thead>
                    <tbody>
                        <tr ng-repeat="d in currUsr.devices ">
                            <td>{{$index+1}}</td>
                            <td>{{ d.Id_Device }}</td>
                            <td>{{d.Description}}</td>
                            
                            <td>
                                <button class="btn" style="background: #ff6666" ng-if="permissions.deledispemp==true"
                                    ng-click="deleteDevice(d.Id_Device)">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <h3 ng-show="!currUsr.devices.length">Sin dispositivos</h3>
            </div>

        </div>

    </div>

    <div class="card">
        <div class="card-encabezado">
            <h3 class="titulo">Permisos del usuario</h3>
        </div>
    
        <div class="card-contenido tabla-responsive permisos">
            <div class="columna-12" ng-if="cargar" style="text-align:center;">
                <img src="./assets/img/7YUz.gif" />
            </div>
            <div class="columna-12">
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.reporasis" type="checkbox" class="custom-control-input" id="reporasis">
                        <label class="custom-control-label" for="reporasis">Reportes de Asistencia</label>
                    </div>
                </div>
    
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.creaemp" type="checkbox" class="custom-control-input" id="creaemp">
                        <label class="custom-control-label" for="creaemp">Creación de Empleados</label>
                    </div>
                </div>
    
            </div>
    
            <div class="columna-12">
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.agdispemp" type="checkbox" class="custom-control-input" id="agdispemp">
                        <label class="custom-control-label" for="agdispemp">Agregar dispositivos a empleados</label>
                    </div>
                </div>
    
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.editemp" type="checkbox" class="custom-control-input" id="editemp">
                        <label class="custom-control-label" for="editemp">Modificación de empleados</label>
                    </div>
                </div>
    
            </div>
    
            <div class="columna-12">
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.reghue" type="checkbox" class="custom-control-input" id="reghue">
                        <label class="custom-control-label" for="reghue">Registrar huellas de empleados</label>
                    </div>
                </div>
    
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.deledispemp" type="checkbox" class="custom-control-input"
                            id="deledispemp">
                        <label class="custom-control-label" for="deledispemp">Eliminar dispositivos de empleados</label>
                    </div>
                </div>
    
            </div>
    
            <div class="columna-12">
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.dept" type="checkbox" class="custom-control-input" id="dept">
                        <label class="custom-control-label" for="dept">Sección departamentos</label>
                    </div>
                </div>
    
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.creadisp" type="checkbox" class="custom-control-input" id="creadisp">
                        <label class="custom-control-label" for="creadisp">Crear dispositivos</label>
                    </div>
                </div>
            </div>
    
            <div class="columna-12">
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.opdoor" type="checkbox" class="custom-control-input" id="opdoor">
                        <label class="custom-control-label" for="opdoor">Abrir puertas</label>
                    </div>
                </div>
    
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.editdisp" type="checkbox" class="custom-control-input" id="editdisp">
                        <label class="custom-control-label" for="editdisp">Modificar dispositivos</label>
                    </div>
                </div>
            </div>
    
    
            <div class="columna-12">
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.exportusrdisp" type="checkbox" class="custom-control-input"
                            id="exportusrdisp">
                        <label class="custom-control-label" for="exportusrdisp">Exportar usuarios por dispositivos
                        </label>
                    </div>
                </div>
    
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.mapadisp" type="checkbox" class="custom-control-input" id="mapadisp">
                        <label class="custom-control-label" for="mapadisp">Sección mapa de dispositivos </label>
                    </div>
                </div>
            </div>
    
            <div class="columna-12">
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.edithrs" type="checkbox" class="custom-control-input" id="edithrs">
                        <label class="custom-control-label" for="edithrs">Modificar horarios
                        </label>
                    </div>
                </div>
    
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.creaparam" type="checkbox" class="custom-control-input" id="creaparam">
                        <label class="custom-control-label" for="creaparam">Crear parámetros </label>
                    </div>
                </div>
            </div>
    
            <div class="columna-12">
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.crearusrs" type="checkbox" class="custom-control-input" id="crearusrs">
                        <label class="custom-control-label" for="crearusrs">Crear usuarios
                        </label>
                    </div>
                </div>
    
                <div class="columna-6">
                    <div class="custom-control custom-checkbox">
                        <input ng-model="permisos.editusrs" type="checkbox" class="custom-control-input" id="editusrs">
                        <label class="custom-control-label" for="editusrs">Editar Usuarios </label>
                    </div>
                </div>
            </div>
    
            <div class="columna-12">
                <button class="btn form odoo pull-right" ng-click="guardar()" ng-disabled="carga2">
                    Modificar
                </button>
            </div>
    
    
        </div>
</div>

<div class="card">
        <div class="card-encabezado">
            <h3 class="titulo">Departamentos Asignados</h3>
        </div>
    
        <div class="card-contenido tabla-responsive">
            
                <div class="columna-12" style="text-align:center" ng-if="carga">

                    <img src="./assets/img/7YUz.gif" />

                </div>

                <table class="tabla print" ng-if="currUsr.departments.length">
                    <thead style="text-align:center">
                        <th ng-click="orderByMe('cuenta')">N#</th>
                        <th>Id de Departamento</th>
                        <th>Nombre de Departamento</th>
                        <th></th>
                    </thead>
                    <tbody>
                        <tr ng-repeat="e in currUsr.departments">
                            <td>{{$index + 1}}</td>
                            <td>{{ e.Id_department }}</td>
                            <td>{{ e.Description }}</td>
                            <td>
                                <button class="btn" style="background: #ff6666"  ng-click="deleteDepartment(e.Id_department)">
                                    <i class="fa fa-trash-o"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
               
                <h3 ng-show="!currUsr.departments.length ">No hay departamentos registrados</h3>
            </div>
</div>


