<div class="sheet">

    <!--<div class="columna-12">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Horarios</h4>
            </div>

            <div class="card-contenido tabla-responsive">
                <button class="btn form odoo pull-right" ng-click="mostrar()" ng-hide="formato">Crear</button>

                <div ng-show="formato">
                    <form  name="upload" novalidate>
                        <div class="columna-12">
                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado">
                                    <input type="text" class="input-text" id="Description" name="Description" ng-maxlength="100" ng-model="dataForm.Description" required>
                                    <label for="Description">Nombre del horario</label>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.required" class="error letra">El nombre del horario es obligatorio.</span>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                                </div>
                            </div>
                        </div>

                        <div class="columna-12">
                            <div class="columna-6" style="padding-top: 10px;">
                                <label style="color: #006d6b;">Establecer horas:</label>
                                <div class="form-texto-animado">
                                    <select class="input-text" name="aplicar" ng-model="dataForm.tipo">
                                        <option value="">Para todos los días</option>
                                        <option value="1">Para días específicos</option>
                                    </select>
                                    <span ng-show="!exp.$pristine && exp.aplicar.$error.required" class="error letra">Este campo es obligatorio</span>
                                </div>
                            </div>
                        </div>

                        <div class="columna-12">
                            <div class="columna-1" style="padding-top: 30px;" ng-model="dataForm.tipo" ng-if="dataForm.tipo">
                                <label style="color: #006d6b;">Lunes</label>
                            </div>

                            <div class="columna-5" ng-model="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="EntradaL" name="EntradaL" ng-model="dataForm.EntradaL" required>
                                    <label for="EntradaL">Hora de entrada</label>
                                    <span ng-show="!upload2.$pristine && upload2.EntradaL.$error.time" class="error letra">El horario de entrada es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-6" ng-model="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="SalidaL" name="SalidaL" ng-model="dataForm.SalidaL" required>
                                    <label for="SalidaL">Hora de salida</label>
                                    <span ng-show="!upload2.$pristine && upload2.SalidaL.$error.time" class="error letra">El horario de salida es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-1" style="padding-top: 30px;" ng-if="dataForm.tipo">
                                <label style="color: #006d6b;">Martes</label>
                            </div>

                            <div class="columna-5" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="EntradaM" name="EntradaM" ng-model="dataForm.EntradaM" required>
                                    <label for="EntradaM">Hora de entrada</label>
                                    <span ng-show="!upload2.$pristine && upload2.EntradaM.$error.time" class="error letra">El horario de entrada es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-6" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="SalidaM" name="SalidaM" ng-model="dataForm.SalidaM" required>
                                    <label for="SalidaM">Hora de salida</label>
                                    <span ng-show="!upload2.$pristine && upload2.SalidaM.$error.time" class="error letra">El horario de salida es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-1" style="padding-top: 30px;" ng-if="dataForm.tipo">
                                <label style="color: #006d6b;">Miercoles</label>
                            </div>

                            <div class="columna-5" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="EntradaMi" name="EntradaMi" ng-model="dataForm.EntradaMi" required>
                                    <label for="EntradaMi">Hora de entrada</label>
                                    <span ng-show="!upload2.$pristine && upload2.EntradaMi.$error.time" class="error letra">El horario de entrada es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-6" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="SalidaMi" name="SalidaMi" ng-model="dataForm.SalidaMi" required>
                                    <label for="SalidaMi">Hora de salida</label>
                                    <span ng-show="!upload2.$pristine && upload2.SalidaMi.$error.time" class="error letra">El horario de salida es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-1" style="padding-top: 30px;" ng-if="dataForm.tipo">
                                <label style="color: #006d6b;">Jueves</label>
                            </div>

                            <div class="columna-5" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="EntradaJ" name="EntradaJ" ng-model="dataForm.EntradaJ" required>
                                    <label for="EntradaJ">Hora de entrada</label>
                                    <span ng-show="!upload2.$pristine && upload2.EntradaJ.$error.time" class="error letra">El horario de entrada es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-6" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="SalidaJ" name="SalidaJ" ng-model="dataForm.SalidaJ" required>
                                    <label for="SalidaJ">Hora de salida</label>
                                    <span ng-show="!upload2.$pristine && upload2.SalidaJ.$error.time" class="error letra">El horario de salida es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-1" style="padding-top: 30px;" ng-if="dataForm.tipo">
                                <label style="color: #006d6b;">Viernes</label>
                            </div>

                            <div class="columna-5" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="EntradaV" name="EntradaV" ng-model="dataForm.EntradaV" required>
                                    <label for="EntradaV">Hora de entrada</label>
                                    <span ng-show="!upload2.$pristine && upload2.EntradaV.$error.time" class="error letra">El horario de entrada es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-6" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="SalidaV" name="SalidaV" ng-model="dataForm.SalidaV" required>
                                    <label for="SalidaV">Hora de salida</label>
                                    <span ng-show="!upload2.$pristine && upload2.SalidaV.$error.time" class="error letra">El horario de salida es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-1" style="padding-top: 30px;" ng-if="dataForm.tipo">
                                <label style="color: #006d6b;">Sábado</label>
                            </div>

                            <div class="columna-5" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="EntradaS" name="EntradaS" ng-model="dataForm.EntradaS" required>
                                    <label for="EntradaS">Hora de entrada</label>
                                    <span ng-show="!upload2.$pristine && upload2.EntradaS.$error.time" class="error letra">El horario de entrada es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-6" ng-if="dataForm.tipo">
                                <div class="form-grupo form-texto-animado">
                                    <input type="time" class="input-text" id="SalidaS" name="SalidaS" ng-model="dataForm.SalidaS" required>
                                    <label for="SalidaS">Hora de salida</label>
                                    <span ng-show="!upload2.$pristine && upload2.SalidaS.$error.time" class="error letra">El horario de salida es obligatorio.</span>
                                </div>
                            </div>
                        </div>

                        <div class="columna-12">
                            <button type="submit" ng-click="crearhorario(dataForm)" class="btn form odoo pull-right" ng-disabled="!upload.$valid">
                                <i class="fa fa-arrow-right"></i>Crear
                            </button>
                            <button type="reset" value="Reset" class="btn form odoo pull-right" ng-click="ocultar()">
                                <i class="fa fa-close"></i>Cancelar
                            </button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>-->

    <div class="columna-12">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Lista de horarios</h4>
            </div>
           
           
            <div class="card-contenido tabla-responsive columna-12">
                    <div class="columna-4"  ng-if="horarios.length">
                            <div class="form-grupo form-texto-animado" style="margin-bottom:15px !important;">
                                <input type="text" class="input-text" id="Busq" ng-model="filters.search">
                                <label for="Busq" ><i class="fa fa-search"></i> Buscar</label>
                            </div>
                        </div>
                <div class="columna-12" style="text-align:center" ng-if="carga">
                   
                        <img src="./assets/img/7YUz.gif"/>
                   
                </div>
                <table class="tabla print" ng-if="horarios.length">
                    <thead style="text-align:center">
                    <th ng-click="orderByMe('cuenta')">N#</th>
                    <th>Nombre de horario</th>
                    </thead>
                    <tbody>
                    <tr ng-click="permissions.edithrs==true && editarhorario(e.ShiftId)" ng-repeat="e in horarios | filter : filters.search">
                        <td>{{ $index + 1 }}</td>
                        <td>{{ e.Description }}</td>
                    </tr>
                    </tbody>
                </table>
                <h3 ng-show="!horarios.length">No hay horarios registrados.</h3>
            </div>
        </div>
    </div>

</div>
