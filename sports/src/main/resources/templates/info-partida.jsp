
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head th:replace ="layout/base::head('Informacion partida' , 'estilos')">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header th:replace = "layout/base::header('Informacion de la partida')"></header>
			 <div class="col-md-7 mx-auto">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">Creador</th>
							<th scope="col">Deporte</th>
							<th scope="col">Ciudad</th>
							<th scope="col">Fecha</th>
							<th scope="col">Hora comienzo</th>
							<th scope="col">Hora fin</th>
							<th scope="col">Participantes</th>
							<th scope="col">Suplentes</th>
						</tr>
					</thead>
					<tbody>
						 <tr th:each="partida : ${infoPartida}">
						 	 <td th:text="${partida.creador}"></td>
							 <td th:text="${partida.deporte}"></td>
							 <td th:text="${partida.ciudad}"></td>
							 <td th:text="${partida.fecha}"></td>
							 <td th:text="${partida.horaComienzo}"></td>
							 <td th:text="${partida.horaFin}"></td>
							 <td><span class="badge badge-pill badge-warning" th:text="${#sets.size(partida.usuariosParticipantes)+'/'+partida.participantes}"></span></td>
							 <td><span class="badge badge-pill badge-warning" th:text="${partida.suplentes}"></span></td>					
						 </tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-7 mx-auto">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col"> Comentarios</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td th:text="${infoPartida.descripcion}"></td>
						</tr>
					</tbody>
				</table>
			</div>
	<footer th:replace="layout/base::footer()"></footer>
</body>
</html>