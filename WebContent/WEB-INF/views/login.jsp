<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>FarmaWeb</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.12/jquery.mask.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
img {
	background-repeat: no-repeat;
}

.bottom-left {
	position: fixed;
	bottom: 0;
	left: 0;
}

#menu {
    position: absolute;
    top: 15px;
    right: 10px;
}

</style>

</head>
<body>
	<div class="container">
		<div class="bottom-left">
			<img alt="" src="https://previews.123rf.com/images/iosphere/iosphere1406/iosphere140600173/29270500-illustration-of-cartoon-pharmacist-with-medicine-pills-and-bottle-Stock-Photo.jpg" width="300" height="300"></img>
		</div>
		<div class="row">
			<nav id="menu">
				<a href data-toggle="modal" data-target="#farmaciaModal">Cadastre sua Farm�cia!</a>
			</nav>
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<h1 class="text-center login-title"
					style="color: DodgerBlue; font-size: 70px;">FarmaWeb</h1>
				<div class="account-wall">
					<form class="form-signin" action="/FarmaWeb/login" method="POST">
						<input type="text" class="form-control" placeholder="Usuario"
							name="usuario" required autofocus> <input type="password"
							class="form-control" placeholder="Senha" name="senha" required>
						<button class="btn btn-lg btn-primary btn-block" type="submit">
							Entrar</button>
					</form>
					
					<a href data-toggle="modal" data-target="#clienteModal">Cliente n�o cadastrado?</a>
					
					<c:if test="${verificaResultado == 0}">
						<div class="alert alert-danger">
							<strong>Aten��o!</strong> Login ou Senha incorretos.
						</div>
					</c:if>
					<c:if test="${verificaResultado == 1}">
						<div class="alert alert-success">
							<strong>Aten��o!</strong> Cliente cadastrado com sucesso!.
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>

<div id="clienteModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Cadastro de cliente</h4>
			</div>
			<div class="modal-body">
				<form class="form-signin" action="/FarmaWeb/cadastrarUsuario"
					method="POST">
					<div class="form-group">
						<h4 class="modal-title">Cliente</h4>
						<label for="Usuario">Usuario:</label> <input type="text" minlength="3" maxlength="20" name="usuario" style="border-radius: 5px;" required> </br><label for="Senha">Senha:</label>
						<input type="password" minlength="6" maxlength="30" name="senha" style="border-radius: 5px;" required>
						</br> 
						<label for="Nome">Nome:</label>
						<input type="text" name="nome_cliente" style="border-radius: 5px;" required> 
						</br> 
						<label for="Cpf">Cpf:</label> 
						<input type="text" id="cpf" name="cpf_cliente" style="border-radius: 5px;" required>
						</br> 
						<label for="Email">Email:</label> 
						<input type="text" name="email_cliente" style="border-radius: 5px;" required>
						</br> 
						<label for="Telefone">Telefone:</label> 
						<input type="text" id="telefone" name="tel_cliente" style="border-radius: 5px;" required> 
						<input type="hidden" name="tipo" value="1" />
					</div>
					<div class="form-group">
						<h4 class="modal-title">Endere�o</h4>
						<label for="cep">Cep:</label> 
						<input id="cep" type="text" name="cep" style="border-radius: 5px;" required>
						</br>
						<label for="rua">Rua:</label> 
						<input id="rua" type="text" name="rua" style="border-radius: 5px;" readonly="true" required>
						</br>
						<label for="numero">N�mero:</label> 
						<input type="text" name="numero" style="border-radius: 5px;" required>
						</br>
						<label for="bairro">Bairro:</label> 
						<input id="bairro" type="text" name="bairro" style="border-radius: 5px;" readonly="true" required>
						</br>
						<label for="cidade">Cidade:</label> 
						<input id="cidade" type="text" name="cidade" style="border-radius: 5px;" readonly="true" required>
						</br>
						<label for="estado">Estado:</label> 
						<input id="estado" type="text" name="estado" style="border-radius: 5px;" readonly="true" required>
						</br>
						<label for="complemento">Complemento:</label> 
						<input type="text" name="complemento" style="border-radius: 5px;">
						
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" type="submit">Salvar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<c:if test="${incluirClienteFarmacia == 1}">
	<div id="adminModal" role="dialog" >
		<div class="modal-dialog">
	
			<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Cadastre um usu�rio</h4>
			</div>
			<div class="modal-body">
				<form class="form-signin" action="/FarmaWeb/incluirFuncionario"
					method="POST">
					<div class="form-group">
	
						<label for="Usuario">Usuario:</label>
						<input type="text" minlength="3" maxlength="20" name="usuario" style="border-radius: 5px;" required>
						</br>
						<label for="Senha">Senha:</label>
						<input type="password" minlength="6" maxlength="30" name="senha" style="border-radius: 5px;" required>
						</br> 
						<label for="Nome">Nome do funcionario:</label>
						<input type="text" name="nome_funcionario" style="border-radius: 5px;" required> 
						</br> 
						<label for="Matricula">Matricula:</label> 
						<input type="text" name="matricula_funcionario" style="border-radius: 5px;" required>
						</br>
						<label for="Telefone">Telefone:</label> 
						<input type="text" id="telefone" name="tel_funcionario" style="border-radius: 5px;" required>
						</br> 
						<label for="Fun��o">Fun��o:</label> 
						<input type="text" name="funcao" style="border-radius: 5px;" required> 
							<input type="hidden" name="tipo" value="2" />
							<input type="hidden" name="cod_farm_func" value="${cod_farm_func}"/>
					</div>
						<div class="modal-footer">
							<button class="btn btn-default" type="submit">Salvar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</c:if>

<div id="farmaciaModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Cadastro de Farm�cia</h4>
			</div>
			<div class="modal-body">
				<form class="form-signin" action="/FarmaWeb/incluirFarmacia"
					method="POST">
					<div class="form-group">
						<h4 class="modal-title">Farm�cia</h4>
						<label for="nome_fantasia">Nome Fantasia:</label> 
						<input type="text" minlength="6" maxlength="40" name="nome_fantasia" style="border-radius: 5px;" required> 
						</br>
						</br> 
						<label for="razao_social">Raz�o Social:</label>
						<input type="text" name="razao_social" style="border-radius: 5px;" required> 
						</br> 
						<label for="cnpj">CNPJ:</label> 
						<input type="text" id="cnpj" name="cnpj" style="border-radius: 5px;" required>
						</br> 
						<label for="tel_farmacia">Telefone:</label> 
						<input type="text" id="telefone" name="tel_farmacia" style="border-radius: 5px;" required>
						</br> 		
						<label for="tel_farmacia">Taxa de entrega:</label> 
						<input type="text" name="taxa_entrega" style="border-radius: 5px;" required>
						</br> 	
						<label for="tel_farmacia">Tempo estimado:</label> 
						<input type="text" name="tempo_entrega" style="border-radius: 5px;" required>
						</br> 
						<label for="observacao">Observa��o:</label>
						</br>
						<textarea rows="3" cols="50" name="observacao" style="border-radius: 5px;" placeholder="Ex.: Horario de Funcionamento"></textarea> 
					</div>
					<div class="form-group">
						<h4 class="modal-title">Endere�o</h4>
						<label for="cep">Cep:</label> 
						<input id="cep_farmacia" type="text" name="cep_farmacia" style="border-radius: 5px;" required>
						</br>
						<label for="rua">Rua:</label> 
						<input id="rua_farmacia" type="text" name="rua_farmacia" style="border-radius: 5px;" readonly="true" required>
						</br>
						<label for="numero">N�mero:</label> 
						<input type="text" name="numero" style="border-radius: 5px;" required>
						</br>
						<label for="bairro">Bairro:</label> 
						<input id="bairro_farmacia" type="text" name="bairro_farmacia" style="border-radius: 5px;" readonly="true" required>
						</br>
						<label for="cidade">Cidade:</label> 
						<input id="cidade_farmacia" type="text" name="cidade_farmacia" style="border-radius: 5px;" readonly="true" required>
						</br>
						<label for="estado">Estado:</label> 
						<input id="estado_farmacia" type="text" name="estado_farmacia" style="border-radius: 5px;" readonly="true" required>
						</br>
						<label for="complemento">Complemento:</label> 
						<input type="text" name="complemento" style="border-radius: 5px;">	
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" type="submit" data-toggle="modal"
					data-target="usuario">Salvar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


</html>

<script type="text/javascript">
		
		$('#cpf').mask('000.000.000-00', {reverse: true});
		$('#cnpj').mask('00.000.000/0000-00', {reverse: true});
		$('#telefone').mask('0000-0000');
		 
		$("#cep").focusout(function(){
			$.ajax({
				url: 'https://viacep.com.br/ws/'+$(this).val()+'/json/unicode/',
				dataType: 'json',
				success: function(resposta){
					$("#rua").val(resposta.logradouro);
					$("#bairro").val(resposta.bairro);
					$("#cidade").val(resposta.localidade);
					$("#estado").val(resposta.uf);
				}
			});
		});
		
		$("#cep_farmacia").focusout(function(){
			$.ajax({
				url: 'https://viacep.com.br/ws/'+$(this).val()+'/json/unicode/',
				dataType: 'json',
				success: function(resposta){
					$("#rua_farmacia").val(resposta.logradouro);
					$("#bairro_farmacia").val(resposta.bairro);
					$("#cidade_farmacia").val(resposta.localidade);
					$("#estado_farmacia").val(resposta.uf);
				}
			});
		});
</script>