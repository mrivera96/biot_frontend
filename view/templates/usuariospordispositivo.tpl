<div class="sheet">
    <div class="columna-12" >
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Nombre de dispositivo</h4>
            </div>

            <div class="card-contenido tabla-responsive">
                <form name="upload" novalidate>
                    <div class="columna-12">

                        <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                            <input type="text" class="input-text" id="Description" name="Description" ng-maxlength="100"
                                ng-model="dispositivo.Description" required>
                            <label for="Description">Nombre del dispositivo</label>
                            <span ng-show="!upload.$pristine && upload.Description.$error.required"
                                class="error letra">El nombre del dispositivo es obligatorio.</span>
                            <span ng-show="!upload.$pristine && upload.Description.$error.maxlength"
                                class="error letra">Máximo 100 caracteres</span>
                        </div>

                    </div>

                    <div class="columna-12" ng-if="permissions.editdisp==true">
                        <button type="submit" ng-click="editardispositivo(dispositivo)" class="btn form odoo pull-right"
                            ng-disabled="!upload.$valid">
                            <i class="fa fa-arrow-right"></i>Actualizar
                        </button>
                    </div>
                </form>
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
                <div class="columna-4"  ng-if="usuariospordispositivo.length && !carga">
                    <div class="form-grupo form-texto-animado" style="margin-bottom:15px !important;">
                        <input type="text" class="input-text" ng-model="filters.search">
                        <label><i class="fa fa-search"></i> Buscar</label>
                    </div>
                    <div class="columna-4" style="margin-bottom:15px !important;" ng-if="usuariospordispositivo.length && !carga && permissions.exportusrdisp==true">
                        <button class="btn form odoo pull-left" ng-click="exportData()">
                            <i class="fa fa-file-excel-o"></i> Exportar
                        </button>
                    </div>
                </div>

                
                    <div class="columna-12" style="text-align:center" ng-if="carga">
                        <img src="./assets/img/7YUz.gif" />
                    </div>
                    <table class="tabla print" style="margin-top: 0px" ng-if="usuariospordispositivo.length && !carga">
                        <thead style="text-align:center">
                            <th ng-click="orderByMe('cuenta')">N#</th>
                            <th>Código empleado</th>
                            <th ng-click="orderByMe('nombre')" style="padding-left:85px;">Nombre</th>
                            <th style="padding-left:85px;">N# identidad</th>
                            <th>Departamento</th>
                            <th>Activo</th>
                        </thead>
                        <tbody>
                            <tr ng-repeat="e in usuariospordispositivo | filter: filters.search | startFromGrid: currentPage * pageSize | limitTo: pageSize"
                                ng-click="verDetail(e.IdUser, e.Description)">
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
                    <button ng-hide="!usuariospordispositivo.length" type='button' class='btn form odoo'
                        ng-disabled='currentPage == 0' ng-click='currentPage = currentPage - 1'>&laquo;</button>
                    <button ng-hide="!usuariospordispositivo.length" type='button' class='btn form odoo'
                        ng-disabled='currentPage == page.no - 1' ng-click='setPage(page.no)'
                        ng-repeat='page in pages'>{{page.no}}</button>
                    <button ng-hide="!usuariospordispositivo.length" type='button' class='btn form odoo'
                        ng-disabled='currentPage >= usuariospordispositivo.length/pageSize - 1' ,
                        ng-click='currentPage = currentPage + 1'>&raquo;</button>
                    <h3 ng-show="!usuariospordispositivo.length && !carga">No hay empleados registrados</h3>
                
            </div>
        </div>
    </div>
</div>