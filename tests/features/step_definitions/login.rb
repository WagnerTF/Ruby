 #login_page = LoginPage.new

Dado('que acesso o sistema do SEI') do
  user.load
  @texto = find('div[class="col-md-12"]')
  expect(@texto.text).to eql 'Faça login para iniciar a sessão Matricula Senha Login'
end

Quando('informo a matricula, senha e aciono o botão login') do
  user.login
  sleep(3)
end
  
Então('o sistema apresenta a home do sistema sei com a modal Login efetuado com sucesso!') do
  @texto = find('div[class="toast-message"]')
  expect(@texto.text).to eql 'Login efetuado com sucesso!'
  sleep(5)
end