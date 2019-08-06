<!--<div class="columna-12">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Editar departamento</h4>
        </div>

        <form  name="upload" novalidate>
            <div class="columna-12">
                <div class="columna-4">
                    <div class="form-texto-animado">
                        <select class="input-text" id="IdParent" name="IdParent" ng-model="departamento.IdParent" required>
                            <option value="">Seleccione un departamento padre</option>
                            <option ng-repeat="d in padres" value="{{d.IdDepartment}}">{{d.Description}}</option>
                        </select>
                        <span ng-show="!upload.$pristine && upload.IdParent.$error.required" class="error letra">El departemento padre es obligatorio.</span>
                    </div>
                </div>
            </div>

            <div class="columna-12">
                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" id="Description" name="Description" ng-maxlength="100" ng-minlength="8" ng-model="departamento.Description" required>
                        <label for="Description">Nombre del departamento</label>
                        <span ng-show="!upload.$pristine && upload.Description.$error.required" class="error letra">El nombre del departamento es obligatorio.</span>
                        <span ng-show="!upload.$pristine && upload.Description.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                        <span ng-show="!upload.$pristine && upload.Description.$error.minlength" class="error letra">Mínimo 8 caracteres</span>
                    </div>
                </div>

                <div class="columna-6">
                    <div class="form-grupo form-texto-animado">
                        <input type="text" class="input-text" id="SupervisorName" name="SupervisorName" ng-maxlength="100" ng-minlength="3" ng-model="departamento.SupervisorName" required>
                        <label for="SupervisorName">Supervisor</label>
                        <span ng-show="!upload.$pristine && upload.SupervisorName.$error.required" class="error letra">El nombre del supervisor(a) es obligatoria.</span>
                        <span ng-show="!upload.$pristine && upload.SupervisorName.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                        <span ng-show="!upload.$pristine && upload.SupervisorName.$error.minlength" class="error letra">Mínimo 3 caracteres</span>
                    </div>
                </div>
            </div>

            <div class="columna-12">
                <button type="submit" ng-click="editardepartamento(departamento)" class="btn form odoo pull-right" ng-disabled="!upload.$valid">
                    Actualizar
                </button>
            </div>

        </form>
    </div>
</div>-->

<div class="columna-12">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo">Lista de empleados</h4>
        </div>
        <div class="card-contenido tabla-responsive">
            <div class="columna-12">
                <div class="columna-4"  ng-if="empleados.length">
                    <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                        <input type="text" class="input-text" ng-model="filters.search">
                        <label for="buscar" ><i class="fa fa-search"></i> Buscar</label>
                    </div>
                </div>
            </div>

            <table class="tabla print" ng-if="empleados.length">
                <thead style="text-align:center">
                    <th ng-click="orderByMe('cuenta')">N#</th>
                    <th >Código empleado</th>
                    <th ng-click="orderByMe('nombre')" style="padding-left:85px;">Nombre</th>
                    <th style="padding-left:85px;">N# identidad</th>
                </thead>
                <tbody>
                    <tr ng-repeat="e in empleados | filter : filters.search| orderBy : '+Name' | startFromGrid: currentPage * pageSize | limitTo: pageSize" ng-click="verDetail(e.IdUser)">
                        <td>{{$index + 1}}</td>
                        <td>{{ e.IdUser }}</td>
                        <td style="padding-left:85px;">{{ e.Name }}</td>
                        <td style="padding-left:85px;">{{ e.IdentificationNumber }}</td>
                    </tr>
                </tbody>
            </table>
            <button ng-hide="!empleados.length" type='button' class='btn form odoo' ng-disabled='currentPage == 0' ng-click='currentPage = currentPage - 1'>&laquo;</button>
            <button ng-hide="!empleados.length" type='button' class='btn form odoo' ng-disabled='currentPage == page.no - 1' ng-click='setPage(page.no)' ng-repeat='page in pages'>{{page.no}}</button>
            <button ng-hide="!empleados.length" type='button' class='btn form odoo' ng-disabled='currentPage >= empleados.length/pageSize - 1' , ng-click='currentPage = currentPage + 1'>&raquo;</button>
            <h3 ng-show="!empleados.length">No hay empleados registrados</h3>
        </div>
    </div>
</div>
