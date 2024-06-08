#language: pt

Funcionalidade: Login

-Eu como ususario
-Quero realizar o login com sucesso

Cenario: Login com sucesso
Dado que acesso o sistema do SEI
Quando informo a matricula, senha e aciono o botão login
Então o sistema apresenta a home do sistema sei com a modal Login efetuado com sucesso!
