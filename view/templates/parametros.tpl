<div class="sheet">
    <div class="columna-12" ng-if="permissions.creaparam==true">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Parámetro</h4>
            </div>

            <div class="card-contenido tabla-responsive">
                <button class="btn form odoo pull-right" ng-click="mostrar()" ng-hide="formato">Crear</button>

                <div ng-show="formato">
                    <form  name="upload" novalidate>
                        <div class="columna-12">

                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" name="parametro" ng-maxlength="50" ng-model="dataForm.parametro" required>
                                    <label for="Description">Parámetro</label>
                                    <span ng-show="!upload.$pristine && upload.parametro.$error.required" class="error letra">El nombre del parámetro es obligatorio.</span>
                                    <span ng-show="!upload.$pristine && upload.parametro.$error.maxlength" class="error letra">Máximo 50 caracteres</span>
                                </div>
                            </div>

                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" name="valor_parametro" ng-maxlength="255" ng-model="dataForm.valor_parametro" required>
                                    <label for="Description">Valor</label>
                                    <span ng-show="!upload.$pristine && upload.valor_parametro.$error.required" class="error letra">El valor del parámetro es obligatorio.</span>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.maxlength" class="error letra">Máximo 255 caracteres</span>
                                </div>
                            </div>

                        </div>

                        <div class="columna-12">

                            <div class="columna-4">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" name="valores_permitidos" ng-model="dataForm.valores_permitidos" required>
                                    <label for="Description">Valores permitidos</label>
                                    <span ng-show="!upload.$pristine && upload.valores_permitidos.$error.required" class="error letra">Los valores permitidos son obligatorios.</span>
                                </div>
                            </div>

                            <div class="columna-4">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" id="Description" name="valor_minimo" ng-model="dataForm.valor_minimo" required>
                                    <label for="Description">Valor mínimo</label>
                                    <span ng-show="!upload.$pristine && upload.valor_minimo.$error.required" class="error letra">El valor mínimo es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-4">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" name="valor_maximo" ng-model="dataForm.valor_maximo" required>
                                    <label for="Description">Valor máximo</label>
                                    <span ng-show="!upload.$pristine && upload.valor_maximo.$error.required" class="error letra">El valor máximo es obligatorio.</span>
                                </div>
                            </div>

                        </div>

                        <div class="columna-12">

                            <div class="form-grupo form-texto-animado" style="margin-bottom: 15px;margin-left: 15px;margin-right: 15px">
                                <input type="text" class="input-text" id="Description" name="descripcion" ng-maxlength="250" ng-minlength="1" ng-model="dataForm.descripcion" required>
                                <label for="Description">Descripción</label>
                                <span ng-show="!upload.$pristine && upload.descripcion.$error.required" class="error letra">La descripción es obligatoria.</span>
                                <span ng-show="!upload.$pristine && upload.descripcion.$error.maxlength" class="error letra">Máximo 250 caracteres</span>
                                <span ng-show="!upload.$pristine && upload.descripcion.$error.minlength" class="error letra">Mínimo 1 caracter</span>
                            </div>

                       </div>

                        <div class="columna-12">
                            

                            <div class="columna-3">
                                <div class="form-texto-animado" style="margin-bottom: 15px">
                                    <select class="input-text" name="activo" ng-model="dataForm.activo" required>
                                        <option value=""></option>
                                        <option value="1">Sí</option>
                                        <option value="0">No</option>
                                    </select>
                                    <label for="activo">Activo:</label>
                                    <span ng-show="!upload.$pristine && upload.activo.$error.required" class="error letra">Este campo es obligatorio</span>
                                </div>
                            </div>

                            <div class="columna-3">
                                <div class="form-texto-animado" style="margin-bottom: 15px">
                                    <select class="input-text" name="visible" ng-model="dataForm.visible" required>
                                        <option value=""></option>
                                        <option value="s">Sí</option>
                                        <option value="n">No</option>
                                    </select>
                                    <label for="visible">Visible:</label>
                                    <span ng-show="!upload.$pristine && upload.visible.$error.required" class="error letra">Este campo es obligatorio</span>
                                </div>
                            </div>

                        </div>

                        <div class="columna-12">
                            <button type="submit" ng-click="crearparametro(dataForm)" class="btn form odoo pull-right" ng-disabled="!upload.$valid">
                                Crear
                            </button>
                            <button type="reset" value="Reset" class="btn form odoo pull-right" ng-click="ocultar()">
                                Cancelar
                            </button>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>

    <div class="columna-12">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Lista de parámetros</h4>
            </div>
            
           
            <div class="card-contenido tabla-responsive columna-12">
                    <div class="columna-4"  ng-if="parametros.length">
                            <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                <input type="text" class="input-text" id="Busq" ng-model="filters.search">
                                <label for="Busq" ><i class="fa fa-search"></i> Buscar</label>
                            </div>
                        </div>
                <table class="tabla print" ng-if="parametros.length">
                    <thead style="text-align:center">
                    <th ng-click="orderByMe('cuenta')">N#</th>
                    <th>Parámetro</th>
                    <th>Descripción</th>
                    <th>Valor</th>
                    <th>Valores permitidos</th>
                    <th>Valor mínimo</th>
                    <th>Valor máximo</th>
                    <th>Activo</th>
                    <th>Visible</th>
                    </thead>
                    <tbody>
                    <tr ng-click="editarparametro(e.id)" ng-repeat="e in parametros | filter : filters.search">
                        <td>{{$index + 1}}</td>
                        <td>{{ e.parametro }}</td>
                        <td>{{ e.descripcion }}</td>
                        <td>{{ e.valor_parametro }}</td>
                        <td>{{ e.valores_permitidos }}</td>
                        <td>{{ e.valor_minimo }}</td>
                        <td>{{ e.valor_maximo }}</td>
                        <td>{{ e.activo }}</td>
                        <td>{{ e.visible }}</td>
                    </tr>
                    </tbody>
                </table>
                <h3 ng-show="!parametros.length">No hay parametros registrados.</h3>
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
