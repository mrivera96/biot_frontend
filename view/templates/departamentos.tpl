<div class="sheet">

    <!--<div class="columna-12">

        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Departamentos</h4>
            </div>

            <div class="card-contenido tabla-responsive">
                <button class="btn form odoo pull-right" ng-click="mostrar()" ng-hide="formato">Crear</button>

                <div ng-show="formato">
                    <form  name="upload" novalidate>
                        <div class="columna-12">
                            <div class="columna-4">
                                <div class="form-texto-animado">
                                    <select class="input-text" id="IdParent" name="IdParent" ng-model="dataForm.IdParent" required>
                                        <option value="">Seleccione un departamento padre</option>
                                        <option ng-repeat="d in departamentos" value="{{d.IdDepartment}}">{{d.Description}}</option>
                                    </select>
                                    <span ng-show="!upload.$pristine && upload.IdParent.$error.required" class="error letra">El departemento padre es obligatorio.</span>
                                </div>
                            </div>
                        </div>

                        <div class="columna-12">
                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado">
                                    <input type="text" class="input-text" id="Description" name="Description" ng-maxlength="100" ng-minlength="8" ng-model="dataForm.Description" required>
                                    <label for="Description">Nombre del departamento</label>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.required" class="error letra">El nombre del departamento es obligatorio.</span>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.minlength" class="error letra">Mínimo 8 caracteres</span>
                                </div>
                            </div>

                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado">
                                    <input type="text" class="input-text" id="SupervisorName" name="SupervisorName" ng-maxlength="100" ng-minlength="3" ng-model="dataForm.SupervisorName" required>
                                    <label for="SupervisorName">Supervisor</label>
                                    <span ng-show="!upload.$pristine && upload.SupervisorName.$error.required" class="error letra">El nombre del supervisor(a) es obligatoria.</span>
                                    <span ng-show="!upload.$pristine && upload.SupervisorName.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                                    <span ng-show="!upload.$pristine && upload.SupervisorName.$error.minlength" class="error letra">Mínimo 3 caracteres</span>
                                </div>
                            </div>
                        </div>



                        <div class="columna-12">
                            <button type="submit" ng-click="creardepartamento(dataForm)" class="btn form odoo pull-right" ng-disabled="!upload.$valid">
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
                <h4 class="titulo">Lista de departamentos</h4>
            </div>

            <div class="card-contenido tabla-responsive">
                <div class="columna-4" ng-if="departamentos.length">
                    <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                        <input type="text" class="input-text" id="Busq" ng-model="filters.search">
                        <label for="Busq"><i class="fa fa-search"></i> Buscar</label>
                    </div>
                </div>

                <div class="columna-12" style="text-align:center" ng-if="carga">

                    <img src="./assets/img/7YUz.gif" />

                </div>

                <table class="tabla print" ng-if="departamentos.length && !carga">
                    <thead style="text-align:center">
                        <th ng-click="orderByMe('cuenta')">N#</th>
                        <th>Nombre de Departamento</th>
                    </thead>
                    <tbody>
                        <tr ng-click="editardepartamento(e.IdDepartment)"
                            ng-repeat="e in departamentos | filter : filters.search | startFromGrid: currentPage * pageSize | limitTo: pageSize" ng-if="deptsUsr[e.IdDepartment]==true || IdUsr==1">
                            <td>{{$index + 1}}</td>
                            <td>{{ e.Description }}</td>
                        </tr>
                    </tbody>
                </table>
                <button ng-hide="!departamentos.length" type='button' class='btn form odoo'
                    ng-disabled='currentPage == 0' ng-click='currentPage = currentPage - 1'>&laquo;</button>
                <button ng-hide="!departamentos.length" type='button' class='btn form odoo'
                    ng-disabled='currentPage == page.no - 1' ng-click='setPage(page.no)'
                    ng-repeat='page in pages'>{{page.no}}</button>
                <button ng-hide="!departamentos.length" type='button' class='btn form odoo'
                    ng-disabled='currentPage >= departamentos.length/pageSize - 1' ,
                    ng-click='currentPage = currentPage + 1'>&raquo;</button>
                <h3 ng-show="!departamentos.length && !carga">No hay departamentos registrados</h3>
            </div>
        </div>
    </div>

</div>