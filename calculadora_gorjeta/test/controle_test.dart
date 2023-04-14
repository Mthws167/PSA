import 'package:flutter_test/flutter_test.dart';
import '../lib/controle/controle.dart';
import '../lib/entidade/atendente.dart';
import '../lib/entidade/atendente_fixo.dart';
import '../lib/entidade/atendente_temporario.dart';
import '../lib/entidade/avaliacao.dart';
import '../lib/entidade/cliente.dart';
import '../lib/entidade/gorjeta.dart';

// >>A gorjeta não é obrigatória. (FEITO)

// >>A gorjeta deve ter valor mínimo de 5% do valor da conta e o valor máximo de 30% do valor da conta, quando oferecida. (FEITO)

// >>A gorjeta, quando oferecida, não deverá ser negativa. (FEITO)

// >> A avaliação do cliente não é obrigatória. (FEITO)

// >>O cliente poderá realizar avaliação por meios de estrelas.(FEITO)

// >>A avaliação do cliente deve ter no máximo 5 estrelas e  no mínimo 0 estrelas, quando oferecido.(FEITO)

// >>A gorjeta e a avaliação deve ser relacionada apenas a um atendente. (FEITO)

// >>A gorjeta quando não há atendente relacionado, deve ser distribuída a todos funcionários. (FEITO)

// >>O atendente pode ser fixo ou temporário. (FEITO)

// >>A gorjeta deve ser adicionada a diária do atendente que está relacionado.(FEITO)



void main() {
  test("Gorjeta não é obrigatória", () {
    Cliente cliente = Cliente(nome: "Matheus", avaliacao: null, gorjeta: null);
    expect(()=>Controle().gorjetaExiste(cliente.gorjeta), returnsNormally);
  });

   test("A gorjeta, quando oferecida, não deverá ser negativa", () {
     Cliente cliente = Cliente(nome: "Matheus", avaliacao: null, gorjeta: Gorjeta(atendente: Atendente(nome: "Júlio", salario: 1250), valor: -10));
    expect(Gorjeta(valor: cliente.gorjeta!.valor, atendente: cliente.gorjeta?.atendente).gorjetaNegativa(cliente.gorjeta?.valor), 0.0);
  });

  test("A gorjeta deve ter valor mínimo de 5% do valor da conta e o valor máximo de 30% do valor da conta, quando oferecida.", () {
    Cliente cliente = Cliente(nome: "Matheus", avaliacao: null, gorjeta: Gorjeta(atendente: Atendente(nome: "Júlio", salario: 1250), valor: 3.5));
    Cliente cliente1 = Cliente(nome: "Matheus", avaliacao: null, gorjeta: Gorjeta(atendente: Atendente(nome: "Júlio", salario: 1250), valor: 0.5));
    Cliente cliente2 = Cliente(nome: "Matheus", avaliacao: null, gorjeta: Gorjeta(atendente: Atendente(nome: "Júlio", salario: 1250), valor: 3.0));
    expect(Gorjeta(valor: cliente.gorjeta!.valor, atendente: cliente.gorjeta?.atendente).gorjetaMaxima(cliente.gorjeta?.valor), 30.0);
    expect(Gorjeta(valor: cliente1.gorjeta!.valor, atendente: cliente1.gorjeta?.atendente).gorjetaMinima(cliente1.gorjeta?.valor), 5.0);
    expect(Gorjeta(valor: cliente2.gorjeta!.valor, atendente: cliente2.gorjeta?.atendente).gorjetaMaxima(cliente2.gorjeta?.valor), 30.0);
  });

  test("A avaliação do cliente não é obrigatória.",(){
    Cliente cliente = Cliente(nome: "Matheus", avaliacao: null, gorjeta: null);
    expect(()=>Controle().avaliacaoExiste(cliente.avaliacao), returnsNormally);
  });

  test("O cliente poderá realizar avaliação por meios de estrelas.",(){
    Cliente cliente = Cliente(nome: "Matheus", avaliacao: Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1350), estrelas: 1), gorjeta: null);
    expect(Avaliacao(atendente: cliente.avaliacao?.atendente,estrelas: cliente.avaliacao!.estrelas).avaliacaoPorEstrela(cliente.avaliacao?.nome), "Estrelas");
  });

  test("A avaliação do cliente deve ter no máximo 5 estrelas e  no mínimo 0 estrelas, quando oferecido.", () {
    Cliente cliente = Cliente(nome: "Matheus", avaliacao: Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1250), estrelas: -1), gorjeta: null);
    Cliente cliente1 = Cliente(nome: "Matheus", avaliacao: Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1250), estrelas: 3), gorjeta: null);
    Cliente cliente2 = Cliente(nome: "Matheus", avaliacao: Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1250), estrelas: 6), gorjeta: null);
    expect(Avaliacao(atendente: cliente.avaliacao?.atendente,estrelas: cliente.avaliacao!.estrelas).avaliacaoMinima(cliente.avaliacao?.estrelas), 0);
    expect(Avaliacao(atendente: cliente1.avaliacao?.atendente,estrelas: cliente1.avaliacao!.estrelas).avaliacaoMinima(cliente1.avaliacao?.estrelas), 3);
    expect(Avaliacao(atendente: cliente2.avaliacao?.atendente,estrelas: cliente2.avaliacao!.estrelas).avaliacaoMaxima(cliente2.avaliacao?.estrelas), 5);
  });

  test("A gorjeta e a avaliação deve ser relacionada apenas a um atendente.",(){
    Cliente cliente = Cliente(nome: "Matheus", avaliacao: Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1250), estrelas: -1), gorjeta: Gorjeta(atendente: Atendente(nome: "Júlio", salario: 1250), valor: 3.0));
    Cliente cliente1 = Cliente(nome: "Matheus", avaliacao: Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1250), estrelas: -1), gorjeta: Gorjeta(atendente: Atendente(nome: "João", salario: 1250), valor: 3.0));
    expect(Controle().gorjetaAvaliacaoAtendente(cliente.avaliacao?.atendente?.nome, cliente.gorjeta?.atendente?.nome), true);
    expect(Controle().gorjetaAvaliacaoAtendente(cliente1.avaliacao?.atendente?.nome, cliente1.gorjeta?.atendente?.nome), false);
  });

  test("A gorjeta deve ser adicionada a diária do atendente que está relacionado.", () {
    Cliente cliente = Cliente(nome: "Matheus", avaliacao: null, gorjeta: Gorjeta(atendente: Atendente(nome: "Júlio", salario: 1250), valor: 3.0));
    expect(Controle().gorjetaAtendente(cliente.gorjeta?.valor, cliente.gorjeta?.atendente?.salario), 1253);
  });

  test("O atendente pode ser fixo ou temporário.",(){
    AtendenteFixo atendenteFixo = AtendenteFixo(nome: "João", salario: 2000.0);
    AtendenteTemporario atendenteTemporario = AtendenteTemporario(nome: "Maria", salario: 1500.0);
    expect(AtendenteFixo(nome: atendenteFixo.nome,salario: atendenteFixo.salario).atendenteFixo(atendenteFixo), true);
    expect(AtendenteTemporario(nome: atendenteTemporario.nome,salario: atendenteTemporario.salario).atendenteTemporario(atendenteTemporario), true);
  });

  test("A gorjeta quando não há atendente relacionado, deve ser distribuída a todos funcionários.",(){
    AtendenteFixo atendenteFixo = AtendenteFixo(nome: "João", salario: 2000.0);
    AtendenteTemporario atendenteTemporario = AtendenteTemporario(nome: "Maria", salario: 1500.0);
    var atendentes = [atendenteFixo, atendenteTemporario];
    Cliente cliente1 = Cliente(nome: "Matheus", avaliacao: null, gorjeta: Gorjeta(atendente: null, valor: 3.0));
    expect(Controle().distribuirGorjeta(atendentes,cliente1),1.5);

  });
}
