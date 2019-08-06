<div class="sheet">

    <div class="columna-12" ng-if="permissions.crearusrs==true">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Crear usuario</h4>
            </div>

            <div class="card-contenido tabla-responsive">

                <!-- <button id="btnusuario" class="btn form odoo pull-right" ng-click="mostrar2()" ng-hide="usuario">Usuario</button>

                <div ng-show="usuario">
                    <form  name="upload2" novalidate>
                        <div class="columna-12">
                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px !important">
                                    <input type="text" class="input-text" id="name" name="name" ng-maxlength="25" ng-model="dataForm.name" required>
                                    <label for="name">Nombres</label>
                                    <span ng-show="!upload2.$pristine && upload2.name.$error.required" class="error letra">El nombre del usuario es obligatorio.</span>
                                    <span ng-show="!upload2.$pristine && upload2.name.$error.maxlength" class="error letra">Máximo 25 caracteres</span>
                                </div>
                            </div>

                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" id="last_name" name="last_name" ng-maxlength="25" ng-model="dataForm.last_name" required>
                                    <label for="last_name">Apellidos</label>
                                    <span ng-show="!upload2.$pristine && upload2.last_name.$error.required" class="error letra">El apellido del usuario es obligatorio.</span>
                                    <span ng-show="!upload2.$pristine && upload2.last_name.$error.maxlength" class="error letra">Máximo 25 caracteres</span>
                                </div>
                            </div>
                        </div>

                        <div class="columna-12">
                            <div class="columna-6">
                                <div class="form-texto-animado" style="margin-bottom: 15px">
                                    <select class="input-text" id="genero" name="genero" ng-model="dataForm.genero" required>
                                        <option value="">Seleccione el género</option>
                                        <option value="M">M</option>
                                        <option value="F">F</option>
                                        <option value="X">Prefiero no decirlo</option>
                                    </select>
                                    <span ng-show="!upload2.$pristine && upload2.genero.$error.required" class="error letra">El genero del usuario es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" id="no_identidad" name="no_identidad" ng-maxlength="15" ng-minlength="13" ng-model="dataForm.no_identidad" required>
                                    <label for="no_identidad">N# de identidad</label>
                                    <span ng-show="!upload2.$pristine && upload2.no_identidad.$error.required" class="error letra">El N# de identidad del usuario es obligatorio.</span>
                                    <span ng-show="!upload2.$pristine && upload2.no_identidad.$error.maxlength" class="error letra">Máximo 15 caracteres</span>
                                    <span ng-show="!upload2.$pristine && upload2.no_identidad.$error.minlength" class="error letra">Mínimo 13 caracteres</span>
                                </div>
                            </div>
                        </div>

                        <div class="columna-12">
                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" id="email" name="email" ng-maxlength="100" ng-minlength="8" ng-model="dataForm.email" required>
                                    <label for="email">Correo empresarial</label>
                                    <span ng-show="!upload2.$pristine && upload2.email.$error.required" class="error letra">El Correo empresarial del usuario es obligatorio.</span>
                                    <span ng-show="!upload2.$pristine && upload2.email.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                                    <span ng-show="!upload2.$pristine && upload2.email.$error.minlength" class="error letra">Mínimo 8 caracteres</span>
                                </div>
                            </div>

                            <div class="columna-6">
                                    <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                        <input type="text" class="input-text" id="password" name="password" ng-maxlength="100" ng-minlength="3" ng-model="dataForm.password" required>
                                        <label for="password">Contraseña</label>
                                        <span ng-show="!upload2.$pristine && upload2.password.$error.required" class="error letra">La contraseña del usuario es obligatoria.</span>
                                        <span ng-show="!upload2.$pristine && upload2.password.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                                        <span ng-show="!upload2.$pristine && upload2.password.$error.minlength" class="error letra">Mínimo 3 caracteres</span>
                                    </div>
                                </div>
    
                        </div>

                        <div class="columna-12">
                            
                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" id="password_confirmation" name="password_confirmation" ng-maxlength="100" ng-minlength="3" ng-model="dataForm.password_confirmation" required>
                                    <label for="password_confirmation">Confirmar contraseña</label>
                                    <span ng-show="!upload2.$pristine && upload2.password_confirmation.$error.required" class="error letra">La confirmación de contraseña del usuario es obligatoria.</span>
                                    <span ng-show="!upload2.$pristine && upload2.password_confirmation.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                                    <span ng-show="!upload2.$pristine && upload2.password_confirmation.$error.minlength" class="error letra">Mínimo 3 caracteres</span>
                                </div>
                            </div>

                            <div class="columna-6">
                                    <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                        <input type="text" class="input-text" id="telefono" name="telefono" ng-maxlength="100" ng-minlength="3" ng-model="dataForm.telefono" required>
                                        <label for="telefono">Telefono</label>
                                        <span ng-show="!upload2.$pristine && upload2.telefono.$error.required" class="error letra">El telefono del usuario es obligatoria.</span>
                                        <span ng-show="!upload2.$pristine && upload2.telefono.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                                        <span ng-show="!upload2.$pristine && upload2.telefono.$error.minlength" class="error letra">Mínimo 3 caracteres</span>
                                    </div>
                                </div>
                        </div>

                        

                        <div class="columna-12">
                            <button type="submit" ng-click="crearusuario(dataForm)" class="btn form odoo pull-right" ng-disabled="!upload2.$valid">
                                <i class="fa fa-arrow-right"></i>Crear
                            </button>
                            <button type="reset" value="Reset" class="btn form odoo pull-right" ng-click="ocultar2()">
                                <i class="fa fa-close"></i>Cancelar
                            </button>
                        </div>
                    </form>
                </div>

                <button id="btnadmin" class="btn form odoo pull-right" ng-click="mostrar()" ng-hide="admin">Administrador</button>
-->

                <form name="upload" ng-if="crear" novalidate>
                    <div class="columna-12">
                        <div class="columna-6">
                            <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                <input type="text" class="input-text" id="name" name="name" ng-maxlength="25"
                                    ng-model="dataForm2.name" required>
                                <label for="name">Nombres</label>
                                <span ng-show="!upload.$pristine && upload.name.$error.required" class="error letra">El
                                    nombre del administrador es obligatorio.</span>
                                <span ng-show="!upload.$pristine && upload.name.$error.maxlength"
                                    class="error letra">Máximo 25 caracteres</span>
                            </div>
                        </div>

                        <div class="columna-6">
                            <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                <input type="text" class="input-text" id="last_name" name="last_name" ng-maxlength="25"
                                    ng-model="dataForm2.last_name" required>
                                <label for="last_name">Apellidos</label>
                                <span ng-show="!upload.$pristine && upload.last_name.$error.required"
                                    class="error letra">El apellido del administrador es obligatorio.</span>
                                <span ng-show="!upload.$pristine && upload.last_name.$error.maxlength"
                                    class="error letra">Máximo 25 caracteres</span>
                            </div>
                        </div>
                    </div>

                    <div class="columna-12">
                        <div class="columna-6">
                            <div class="form-texto-animado" style="margin-bottom: 15px">
                                <select class="input-text" id="genero" name="genero" ng-model="dataForm2.genero"
                                    required>
                                    <option value="">Seleccione el género</option>
                                    <option value="M">M</option>
                                    <option value="F">F</option>
                                    <option value="X">Prefiero no decirlo</option>
                                </select>
                                <span ng-show="!upload.$pristine && upload.genero.$error.required"
                                    class="error letra">El genero del administrador es obligatorio.</span>
                            </div>
                        </div>

                        <div class="columna-6">
                            <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                <input type="text" class="input-text" id="no_identidad" name="no_identidad"
                                    ng-maxlength="15" ng-minlength="13" ng-model="dataForm2.no_identidad" required>
                                <label for="no_identidad">N# de identidad</label>
                                <span ng-show="!upload.$pristine && upload.no_identidad.$error.required"
                                    class="error letra">El N# de identidad del administrador es obligatorio.</span>
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
                                    ng-minlength="8" ng-model="dataForm2.email" required>
                                <label for="email">Correo empresarial</label>
                                <span ng-show="!upload.$pristine && upload.email.$error.required" class="error letra">El
                                    Correo empresarial del administrador es obligatorio.</span>
                                <span ng-show="!upload.$pristine && upload.email.$error.maxlength"
                                    class="error letra">Máximo 100 caracteres</span>
                                <span ng-show="!upload.$pristine && upload.email.$error.minlength"
                                    class="error letra">Mínimo 8 caracteres</span>
                            </div>
                        </div>

                        <div class="columna-6">
                            <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                <input type="text" class="input-text" id="password" name="password" ng-maxlength="100"
                                    ng-minlength="3" ng-model="dataForm2.password" required>
                                <label for="password">Contraseña</label>
                                <span ng-show="!upload.$pristine && upload.password.$error.required"
                                    class="error letra">La contraseña del administrador es obligatoria.</span>
                                <span ng-show="!upload.$pristine && upload.password.$error.maxlength"
                                    class="error letra">Máximo 100 caracteres</span>
                                <span ng-show="!upload.$pristine && upload.password.$error.minlength"
                                    class="error letra">Mínimo 3 caracteres</span>
                            </div>
                        </div>
                    </div>

                    <div class="columna-12">

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
                        <div class="columna-6">
                            <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                <input type="text" class="input-text" id="telefono" name="telefono" ng-maxlength="100"
                                    ng-minlength="8" ng-model="dataForm2.telefono" required>
                                <label for="telefono">Telefono</label>
                                <span ng-show="!upload.$pristine && upload.telefono.$error.required"
                                    class="error letra">El telefono del administrador es obligatoria.</span>
                                <span ng-show="!upload.$pristine && upload.telefono.$error.maxlength"
                                    class="error letra">Máximo 100 caracteres</span>
                                <span ng-show="!upload.$pristine && upload.telefono.$error.minlength"
                                    class="error letra">Mínimo 8 caracteres</span>
                            </div>
                        </div>
                    </div>

                    <div class="columna-12">
                        <button type="submit" ng-click="crearadmin(dataForm2)" class="btn form odoo pull-right"
                            ng-disabled="!upload.$valid">
                            <i class="fa fa-arrow-right"></i>Crear
                        </button>
                        <button type="reset" value="Reset" class="btn form odoo pull-right" ng-click="ocultar()">
                            <i class="fa fa-close"></i>Cancelar
                        </button>
                    </div>
                </form>
                <button class="btn form odoo pull-right" ng-click="crearUsuario()" ng-if="!crear">
                    Crear
                </button>

            </div>
        </div>
    </div>
    <div class="columna-12">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Lista de usuarios</h4>
            </div>

            <div class="card-contenido tabla-responsive columna-12">
                <div class="columna-4" ng-if="usuarios.length">
                    <div class="form-grupo form-texto-animado" style="margin-bottom:15px;">
                        <input type="text" class="input-text" id="Busq" ng-model="filters.search">
                        <label for="Busq"><i class="fa fa-search"></i> Buscar</label>
                    </div>
                </div>
                <div class="columna-12" style="text-align:center" ng-if="carga">

                    <img src="./assets/img/7YUz.gif" />

                </div>
                <table class="tabla print" ng-if="usuarios.length && !carga">
                    <thead style="text-align:center">
                        <th ng-click="orderByMe('cuenta')">N#</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Estado</th>
                        <th>N# de identidad</th>
                        <th>Telefono</th>
                        <th>Genero</th>
                    </thead>
                    <tbody>
                        <tr ng-repeat="e in usuarios | filter : filters.search"
                            ng-click="permissions.editusrs==true && verDetail(e.id)">
                            <td style="text-align: center;">{{$index + 1}}</td>
                            <td>{{ e.fullname }}</td>
                            <td>{{ e.email }}</td>
                            <td>{{ e.nombre_rol }}</td>
                            <td style="text-align: center;" ng-if="e.activo==1">Activo</td>
                            <td style="text-align: center;" ng-if="e.activo==0">Inactivo</td>
                            <td ng-if="e.no_identidad.length!=0">{{ e.no_identidad }}</td>
                            <td ng-if="e.no_identidad.length==0">Vacio</td>
                            <td ng-if="e.telefono.length!=0">{{ e.telefono }}</td>
                            <td ng-if="e.telefono.length==0">Vacio</td>
                            <td style="text-align: center;">{{ e.genero }}</td>
                        </tr>
                    </tbody>
                </table>
                <h3 ng-show="!usuarios.length && !carga">No hay usuarios registrados</h3>
            </div>
        </div>
    </div>
</div>