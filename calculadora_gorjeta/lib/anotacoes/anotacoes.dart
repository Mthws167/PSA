/**
 * POO:
 * 
 * Encapsulamento: aplicado no método "gorjetaMinima", onde encapsula o valor da gorjeta e verifica seu valor mínimo.
 * 
 * Herança: a classe AtendenteTemporario e AtendenteFixo herdam atributos e métodos da classe Atendente.
 * 
 * Polimorfismo: o método "gorjetaAtendente" é um exemplo já que trata o "atendenteFixo" e o "atendenteTemporario" de formas diferentes 
 * 
 * Abstração: os métodos descritos nas Classes "Gorjeta","Avaliacao","AtendenteTemporario" e "AtendenteFixo"  identificam comportamentos essenciais de um objeto e representá-los em uma classe.
 * 
 * 
 * 
 * SOLID:
 * 
 * SRP (Single Responsibility Principle): uma classe deve ter apenas uma única responsabilidade (Aplicado nas Classes "Gorjeta" e "Avaliação").
 * 
 * OCP (Open-Closed Principle): uma vez que permitem a extensão sem modificação da classe "Atendente".
 * 
 * LSP (Liskov Substitution Principle): afirma que as classes filhas devem ser substituíveis pelas classes pais. Isso pode ser aplicado na classe "AtendenteTemporario" e "AtendenteFixo", que são classes filhas de "Atendente".
 * 
 * ISP (Interface Segregation Principle):
 * 
 * DIP (Dependency Inversion Principle):  
 * */