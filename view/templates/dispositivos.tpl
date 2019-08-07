<div class="sheet">
    <div class="columna-12" ng-if="permissions.creadisp==true">
        <div class="card">

            <div class="card-encabezado">
                <h4 class="titulo">Dispositivo</h4>
            </div>

            <div class="card-contenido tabla-responsive">
                <button class="btn form odoo pull-right" ng-click="mostrar()" ng-hide="formato">Crear</button>
                <div ng-show="formato">
                    <form id="upload" name="upload" novalidate>
                        <div class="columna-12">
                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" id="Description" name="Description" ng-maxlength="100" ng-minlength="3" ng-model="dataForm.Description" required>
                                    <label for="Description">Nombre de dispositivo</label>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.required" class="error letra">El nombre del dispositivo es obligatorio.</span>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.maxlength" class="error letra">Máximo 100 caracteres</span>
                                    <span ng-show="!upload.$pristine && upload.Description.$error.minlength" class="error letra">Mínimo 3 caracteres</span>
                                </div>
                            </div>

                            <div class="columna-6">
                                <div class="form-texto-animado" style="margin-bottom: 15px">
                                    <select class="input-text" id="Type" name="Type" ng-model="dataForm.Type" required>
                                        <option value="">Seleccione el tipo</option>
                                        <option value="11">Pantalla monocromática</option>
                                        <option value="12">Identificador de rostro</option>
                                    </select>
                                    <span ng-show="!upload.$pristine && upload.Type.$error.required" class="error letra">El tipo de dispositivo es obligatorio.</span>
                                </div>
                            </div>
                        </div>

                        <div class="columna-12">
                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="number" class="input-text" id="MachineNumber" name="MachineNumber" ng-model="dataForm.MachineNumber" required>
                                    <label for="MachineNumber">Número de dispositivo</label>
                                    <span ng-show="!upload.$pristine && upload.MachineNumber.$error.time" class="error letra">El número de dispositivo es obligatorio.</span>
                                </div>
                            </div>

                            <div class="columna-6">
                                <div class="form-texto-animado" style="margin-bottom: 15px">
                                    <select class="input-text" id="ConnectionType" name="ConnectionType" ng-model="dataForm.ConnectionType" required>
                                        <option value="">Seleccione el tipo de comunicación</option>
                                        <option value="0">Ethernet</option>
                                        <option value="12">USB</option>
                                    </select>
                                    <span ng-show="!upload.$pristine && upload.Type.$error.required" class="error letra">El tipo de dispositivo es obligatorio.</span>
                                </div>
                        </div>
                        </div>

                       

                        <div class="columna-12">
                            <div class="columna-6">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="text" class="input-text" id="IP" name="IP" ng-maxlength="100" ng-minlength="3" ng-model="dataForm.IP" required>
                                    <label for="IP">Dirección IP</label>
                                    <span ng-show="!upload.$pristine && upload.IP.$error.required" class="error letra">La dirección IP del dispositivo es obligatoria.</span>
                                    <span ng-show="!upload.$pristine && upload.IP.$error.maxlength" class="error letra">Máximo 15 caracteres</span>
                                    <span ng-show="!upload.$pristine && upload.IP.$error.minlength" class="error letra">Mínimo 15 caracteres</span>
                                </div>
                            </div>

                            <div class="columna-3">
                                <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                    <input type="number" class="input-text" id="PortNumber" name="PortNumber" ng-model="dataForm.PortNumber" required>
                                    <label for="PortNumber">Puerto</label>
                                    <span ng-show="!upload.$pristine && upload.PortNumber.$error.time" class="error letra">El número de dispositivo es obligatorio.</span>
                                </div>
                            </div>
                        </div>

                        <div class="columna-12">
                            <button type="submit" ng-click="creardispositivo(dataForm)" class="btn form odoo pull-right" ng-disabled="!upload.$valid">
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
    </div>


	
    <div class="columna-12">
        <div class="card">
            <div class="card-encabezado">
                <h4 class="titulo">Lista de dispositivos</h4>
            </div>
            
            <div class="card-contenido tabla-responsive columna-12">

                    <div class="columna-4"  ng-if="dispositivos.length">
                            <div class="form-grupo form-texto-animado" style="margin-bottom: 15px">
                                <input type="text" class="input-text" id="Busq" ng-model="filters.search">
                                <label for="Busq" ><i class="fa fa-search"></i> Buscar</label>
                            </div>
                        </div>
                <div class="columna-12" style="text-align:center" ng-if="carga">
                   
                        <img src="./assets/img/7YUz.gif"/>
                    
                </div>
                <table class="tabla print" ng-if="dispositivos.length && !carga">
                    <thead style="text-align:center">
                    <th ng-click="orderByMe('cuenta')">N#</th>
                    <th ng-click="orderByMe('dispositivo')" style="padding-left:85px;">N# de Dispositivo</th>
                    <th>Nombre de Dispositivo</th>
                    <th>IP</th>
                    <th>Puerto</th>
                    <th ng-if="permissions.opdoor==true">Control de Puerta</th>
                </thead>
                <tbody>
                    <tr ng-click="pordispositivo(e.IdDevice, e.IP, e.Type)" ng-repeat="e in dispositivos | filter : filters.search | startFromGrid: currentPage * pageSize | limitTo: pageSize">
                        <td>{{$index + 1}}</td>
                        <td style="padding-left:85px;">{{ e.MachineNumber }}</td>
                        <td>{{ e.Description }}</td>
                        <td>{{ e.IP }}</td>
                        <td>{{ e.PortNumber }}</td>
                        <td ng-if="permissions.opdoor==true"><img ng-if="e.tiene_puerta==1" width="29p" height="35p" ng-click="openDoor(e.Type,e.IP);$event.stopPropagation();" src="./assets/img/puerta_on.png"/>
                
                        </td>
                    </tr>
                </tbody>
            </table>
            <button ng-hide="!dispositivos.length" type='button' class='btn form odoo' ng-disabled='currentPage == 0' ng-click='currentPage = currentPage - 1'>&laquo;</button>
            <button ng-hide="!dispositivos.length" type='button' class='btn form odoo' ng-disabled='currentPage == page.no - 1' ng-click='setPage(page.no)' ng-repeat='page in pages'>{{page.no}}</button>
            <button ng-hide="!dispositivos.length" type='button' class='btn form odoo' ng-disabled='currentPage >= dispositivos.length/pageSize - 1' , ng-click='currentPage = currentPage + 1'>&raquo;</button>
            <h3 ng-show="!dispositivos.length &&  !carga">No hay dispositivos registrados</h3>
        </div>
                                
    </div>

</div>