<div class="columna-6" ng-if="permissions.reporasis==true">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="reportes">Asistencia</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left" ng-click="asistencia()">
                Comprobar asistencia
            </button>
        </div>
    </div>
</div>

<div class="columna-6">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="usuarios">Empleados</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left" ng-click="empleados()">
                Ver empleados
            </button>
        </div>
    </div>
</div>


<div class="columna-6">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="reportes">Departamentos</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left"
            ng-click="departamentos()">
                Ver departamentos
            </button>
        </div>
    </div>
</div>

<!--
<div class="columna-6">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="puertas">Puertas</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left"
            ng-click="puertas()">
                Ver Puertas
            </button>
        </div>
    </div>
</div>
-->

<div class="columna-6">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="usuarios">Dispositivos</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left"
            ng-click="dispositivos()">
                Ver dispositivos
            </button>
        </div>
    </div>
</div>

<div class="columna-6"  ng-if="permissions.mapadisp==true">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="reportes">Mapa de Dispositivos</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left"
            ng-click="mapadispositivos()">
                Ver mapa de dispositivos
            </button>
        </div>
    </div>
</div>

<div class="columna-6" ng-if="permissions.hors_sect==true">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="reportes">Horarios</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left"
            ng-click="horarios()">
                Ver horarios
            </button>
        </div>
    </div>
</div>

<div class="columna-6" ng-if="permissions.param_sect==true">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="reportes">Parámetros del Sistema</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left"
            ng-click="parametros()">
                Ver parámetros
            </button>
        </div>
    </div>
</div>

<div class="columna-6" ng-if="permissions.users_sect==true">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="reportes">Usuarios</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left"
            ng-click="usuarios()">
                Ver usuarios
            </button>
        </div>
    </div>
</div>


<!--<div class="columna-6">
    <div class="card">
        <div class="card-encabezado">
            <h4 class="titulo" id="reportes">Depurar</h4>
        </div>

        <div class="card-contenido tabla-responsive">
            <button class="btn form odoo pull-left"
            ng-click="depurar()">
                Depurar
            </button>
        </div>
    </div>
</div>-->

