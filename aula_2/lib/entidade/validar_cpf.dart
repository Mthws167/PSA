class ValidarCPF{
  bool ehVazio(String cpf){
    if(cpf.isEmpty)throw Exception('CPF não pode ser vazio!');
    return true;
  }

  bool tamanhoCorreto(String cpf){
    if(cpf.length() != 14)throw Exception('CPF não pode ter menos de 14 caracteres!');
    return true;
  }
}