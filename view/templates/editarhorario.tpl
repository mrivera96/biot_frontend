<!--<div class="columna-12">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Nombre de horario</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <form  name="upload" novalidate>
                <div class="columna-12">
                    <div class="columna-6">
                        <div class="form-grupo form-texto-animado">
                            <input type="text" class="input-text" id="Description" name="Description" ng-maxlength="100" ng-model="editarhorario.nombre_horario" required>
                            <label for="Description">Nombre del horario</label>
                            <span ng-show="!upload.$pristine && upload.Description.$error.required" class="error letra">El nombre del horario es obligatorio.</span>
                            <span ng-show="!upload.$pristine && upload.Description.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                        </div>
                    </div>
                </div>

                <div class="columna-12">
                    <button type="submit" ng-click="editarnombrehorario(editarhorario)" class="btn form odoo pull-right" ng-disabled="!upload.$valid">
                        <i class="fa fa-arrow-right"></i>Actualizar
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>-->


<div class="columna-12">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Establecer horario</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <form  name="upload2" novalidate>
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
                    <button type="submit" ng-click="editarhorariodetalle(dataForm)" class="btn form odoo pull-right" ng-disabled="!upload2.$valid ">
                        <i class="fa fa-arrow-right"></i>Actualizar
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


<style>
    .tdNombre{
        max-width:380px;
        overflow:hidden;
        text-overflow:ellipsis;
        white-space:nowrap;

    }
</style>