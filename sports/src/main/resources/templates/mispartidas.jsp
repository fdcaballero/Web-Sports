<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head th:replace="layout/base::head('Mis partida','estilos')">

</head>
<body>
	<header th:replace="layout/base::header('Mis partida')"></header>

	<div class="wrapper ">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">

					<div class="row">
						<div class="col-ms-10 mx-auto ">
							<div class="card border-secondary">
								<div class="card-header">
									<h3 class="mb-0 my-2">Mis partidas</h3>
								</div>
								<div class="card-body">
								 	
								 	<p><a th:href="@{/crear-partida}" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Crear Partida</a></p>
								 	<div th:switch="${mispartidas}">
								 	<h2 th:case="null">No se han creado partidas</h2>
								 	 <div th:case="*">
										<table class="table table-striped">
											<thead>
												<tr>
													<th scope="col">Partida</th>
													<th scope="col">Deporte</th>
													<th scope="col">Ciudad</th>
													<th scope="col">Fecha</th>
													<th scope="col">Hora comienzo</th>
													<th scope="col">Participantes</th>
													<th scope="col">Acci&oacute;n</th>
												</tr>
											</thead>
											<tbody>
												 <tr th:each="partida : ${mispartidas}">
												 	<td th:text="${partida.id}"></td>
												 	<td th:text="${partida.deporte}"></td>
												 	<td th:text="${partida.ciudad}"></td>
												 	<td th:text="${partida.fecha}"></td>
												 	<td th:text="${partida.horaComienzo}"></td>
												 	<td><span class="badge badge-pill badge-warning" th:text="${#sets.size(partida.usuariosParticipantes)+'/'+partida.participantes}"></span></td>
												 	<!-- https://github.com/waylau/thymeleaf-tutorial/blob/master/docs/expression-utility-objects.md -->
												 	 <td><a th:href="@{/eliminar-partida/{id}(id=${partida.id})}"  class="btn btn-danger btn-sm active" role="button" aria-pressed="true">Eliminar</a></td>
												 </tr>
											</tbody>
										</table>
									</div>
									</div>
								</div>
							</div>
							<br>
							  <div class="row">
								<div class=" col-ms-10 mx-auto">
								  <div class="card border-secondary">
										<div class="card-header">
											<h3 class="mb-0 my-2">Partidas a las que me he unido</h3>
										</div>
									 <div class="card-body">
										<div th:switch="${partidasU}">
									 			<h2 th:case="null">No se han unido partidas</h2>
									 	  <div th:case="*">
											<table class="table table-striped">
												<thead>
													<tr>
														<th scope="col">Creador</th>
														<th scope="col">Deporte</th>
														<th scope="col">Ciudad</th>
														<th scope="col">Fecha</th>
														<th scope="col">Hora comienzo</th>
														<th scope="col">Participantes</th>
														<th scope="col">Abandonar</th>
														<th scope="col">Informaci&oacute;n</th>
													</tr>
												</thead>
												<tbody>
													 <tr th:each="partidau : ${partidasU}">
													 	<td th:text="${partidau.creador}"></td>
													 	<td th:text="${partidau.deporte}"></td>
													 	<td th:text="${partidau.ciudad}"></td>
													 	<td th:text="${partidau.fecha}"></td>
													 	<td th:text="${partidau.horaComienzo}"></td>
													 	<td><span class="badge badge-pill badge-warning" th:text="${#sets.size(partidau.usuariosParticipantes)+'/'+partidau.participantes}"></span></td>
													 	
													 	<!-- https://github.com/waylau/thymeleaf-tutorial/blob/master/docs/expression-utility-objects.md -->
													 	<td><a th:href="@{/abandonar-partida/{id}(id=${partidau.id})}"  class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Abandonar</a></td>
													 	 <td><a th:href="@{/info-partida/{id}(id=${partidau.id})}"  class="btn btn-warning btn-sm active" role="button" aria-pressed="true">+ Info</a></td>
													 	  
													 </tr>
												</tbody>
											</table>
										</div>
										</div>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
					<!--/row-->

				</div>
				<!--/col-->
			</div>
			<!--/row-->
		</div>
		<!--/container-->

	</div>

	<footer th:replace="layout/base::footer()"></footer>
</body>
</html>