/**
 * POO:
 * 
 * Encapsulamento: as variáveis de cada classe são definidas como "final", indicando que seus valores não podem ser alterados depois que são definidos.
 * 
 * Herança: a classe AtendenteTemporario e AtendenteFixo herdam atributos e métodos da classe Atendente.
 * 
 * Polimorfismo: a classe Controle contém métodos que podem ser aplicados a objetos de diferentes classes, como "gorjetaAtendente" e "distribuirGorjeta".
 * 
 * Abstração: na classe Cliente, são definidos atributos como "nome", "avaliacao" e "gorjeta", que representam as informações essenciais de um cliente no contexto do sistema.
 * 
 * 
 * 
 * SOLID:
 * 
 * SRP (Single Responsibility Principle): uma classe deve ter apenas uma única responsabilidade.
 * 
 * OCP (Open-Closed Principle): uma vez que permitem a extensão sem modificação da classe "Atendente".
 * 
 * LSP (Liskov Substitution Principle): afirma que as classes filhas devem ser substituíveis pelas classes pais. Isso pode ser aplicado na classe "AtendenteTemporario" e "AtendenteFixo", que são classes filhas de "Atendente".
 * 
 * ISP (Interface Segregation Principle):
 * 
 * DIP (Dependency Inversion Principle):  
 * */