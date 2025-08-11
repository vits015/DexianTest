# Projeto de Teste - Sistema Delphi com SQL Server

Este projeto foi desenvolvido como parte de um teste técnico e implementa um sistema em Delphi integrado ao SQL Server, com funcionalidades de manutenção de clientes, pedidos e relatórios.

## 📂 Estrutura de Pastas e Arquivos

- **ufrmManutencao.pas / .dfm**  
  Formulário base para manutenção de registros.  
  Responsável por exibir, editar e excluir dados de forma genérica.

- **uClienteController.pas**  
  Controlador responsável pela lógica de negócios relacionada a clientes.  
  Faz a comunicação entre a interface (`Forms`) e a camada DAO (`uClienteDAO`).

- **uPedidoController.pas**  
  Controlador responsável pela lógica de negócios relacionada a pedidos.  
  Segue o mesmo padrão do `uClienteController`.

- **uClienteDAO.pas**  
  Classe de acesso a dados para a entidade Cliente.  
  Contém métodos de inserção, atualização, exclusão e consulta no banco SQL Server.

- **uPedidoDAO.pas**  
  Classe de acesso a dados para a entidade Pedido.  
  Implementa operações CRUD e consultas específicas.

---

### **📁 /reports**
Contém arquivos de relatórios gerados pelo **FastReport**.

- **Relatorio.fr3**  
  Relatório que une informações de clientes e pedidos de forma organizada, com duas consultas.

---

### **📁 /database**
Scripts e backups do banco de dados SQL Server.

- **backup_teste.bak**  
  Backup completo do banco para restauração no SQL Server.

---

## ⚙️ Requisitos

- **Delphi** (versão compatível com VCL e FastReport)
- **SQL Server** (2016+ recomendado)
- **FastReport** para Delphi
- **Driver ADO/FireDAC** configurado para conexão

---

## 🚀 Funcionalidades

- Cadastro, edição e exclusão de **Clientes**
- Cadastro, edição e exclusão de **Pedidos**
- Relatórios de clientes e pedidos
- Abertura automática do portfólio no encerramento da aplicação

---

## 📜 Observação Final

Ao fechar a aplicação, será exibida uma mensagem de agradecimento e o navegador padrão abrirá automaticamente o portfólio do desenvolvedor:

> "Foi um prazer desenvolver este projeto!  
> Se quiser conhecer mais sobre mim e meus trabalhos, visite meu portfólio."

🌐 **Portfólio:** [sitevits015.vercel.app](https://sitevits015.vercel.app)
