# Trabalho Final Programação de Dispositivos Movéis

Leonardo Messa Wagner

# SIstema de cadastro de cidades, onde a cidade só é cadastrada se for validada que existe por uma API externa;

# Tecnologias Usadas:

  - Flutter 3.13.2;
  - Dart SDK 3.1.0;
  - Google Firebase;
  - Google Cloud Firestore;

# API:

 -  ViaCEP (https://viacep.com.br/);

### Execução e testes do app foram feitos nos emuladores do chrome e do edge;


   ##Requisito 1 Login com Firebase:

   - login esta funcionando com o firebase atraves de email e senha:

  #tela Login/Cadastro:

  ![image](https://github.com/LeonardoMessaWagner/flutter_trabalho/assets/62308324/700f4d82-8eda-4784-af44-c6268293d3a9)

  ![image](https://github.com/LeonardoMessaWagner/flutter_trabalho/assets/62308324/1bfac8ed-cd6a-4283-877f-bdf0df6d99a2)


  ##Requisito 2 CRUD FirebaseFireStore ou SqLite

   - Foi usado o Cloud Firestore para realizar a construção do CRUD

  - Home do usuario listando todas as casas cadastradas:

  ![image](https://github.com/LeonardoMessaWagner/flutter_trabalho/assets/62308324/673cfb6a-aea4-454b-b674-477b078fb58e)

  - Drawer com o botão para cadastrar casas:
  
  ![image](https://github.com/LeonardoMessaWagner/flutter_trabalho/assets/62308324/b10a922a-9e5d-40ca-8e99-55d153493a48)

  - Tela de edição da casa:

  ![image](https://github.com/LeonardoMessaWagner/flutter_trabalho/assets/62308324/21b8d403-b24e-4046-93c3-695a5a72fde9)

  - Tela de cadastro de casa:

  ![image](https://github.com/LeonardoMessaWagner/flutter_trabalho/assets/62308324/2ad81e75-2ac0-41c2-87eb-07e4a6d8ee78)

  ## Requisito 3 Consumo de API:

  - Foi usado a API do https://viacep.com.br, para verificar se o CEP informado pelo usuario é valido, sendo permitido o cadastro de uma casa somente se o cep for valido:

  ![image](https://github.com/LeonardoMessaWagner/flutter_trabalho/assets/62308324/0c50e001-b034-4e96-9081-351eca43f97b)

  


  




  




   





