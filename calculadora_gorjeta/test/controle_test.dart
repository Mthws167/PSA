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
    Cliente cliente = Cliente(nome: "Matheus");
    Gorjeta gorjeta = Gorjeta(atendente: null, valor: 0);
    Avaliacao avaliacao = Avaliacao(atendente: null, estrelas: 0);
    expect(Controle().gorjetaExiste(gorjeta), false);
  });

  test("A gorjeta, quando oferecida, não deverá ser negativa", () {
    Cliente cliente = Cliente(nome: "Matheus");
    Gorjeta gorjeta = Gorjeta (atendente: Atendente(nome: "Júlio", salario: 1250), valor: -10);
    Avaliacao avaliacao = Avaliacao(atendente: null, estrelas: 0);
    expect(Gorjeta(valor: gorjeta!.valor,atendente: gorjeta?.atendente).gorjetaNegativa(gorjeta!.valor),0.0);
  });

  test("A gorjeta deve ter valor mínimo de 5% do valor da conta e o valor máximo de 30% do valor da conta, quando oferecida.",() {
    Cliente cliente = Cliente(nome: "Matheus");
    Gorjeta gorjeta = Gorjeta (atendente: Atendente(nome: "Júlio", salario: 1250), valor: 3.5);
    Gorjeta gorjeta1 = Gorjeta (atendente: Atendente(nome: "Júlio", salario: 1250), valor: 0.5);
    Gorjeta gorjeta2 = Gorjeta(atendente: Atendente(nome: "Júlio", salario: 1250), valor: 3.0);
    expect(Gorjeta(valor: gorjeta!.valor,atendente: gorjeta?.atendente).gorjetaMaxima(gorjeta!.valor),30.0);
    expect(Gorjeta(valor: gorjeta1!.valor,atendente: gorjeta1?.atendente).gorjetaMinima(gorjeta1!.valor), 5.0);
    expect( Gorjeta(valor: gorjeta2!.valor,atendente: gorjeta2?.atendente).gorjetaMaxima(gorjeta2!.valor),30.0);
  });

  test("A avaliação do cliente não é obrigatória.", () {
    Cliente cliente = Cliente(nome: "Matheus");
    Avaliacao avaliacao = Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1250), estrelas: 0);
    expect(Controle().avaliacaoExiste(avaliacao), false);
  });

  test("O cliente poderá realizar avaliação por meios de estrelas.", () {
    Cliente cliente = Cliente(nome: "Matheus");
    Avaliacao avaliacao = Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1350), estrelas: 1);
    expect(Avaliacao(atendente: Atendente(nome: avaliacao.atendente!.nome, salario: avaliacao.atendente!.salario),
    estrelas: avaliacao.estrelas).avaliacaoPorEstrela(avaliacao.nome),"Estrelas");
  });

  test("A avaliação do cliente deve ter no máximo 5 estrelas e  no mínimo 0 estrelas, quando oferecido.",() {
    Cliente cliente = Cliente(nome: "Matheus");
    Avaliacao avaliacao = Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1350), estrelas: -1);
    Avaliacao avaliacao1 = Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1350), estrelas: 3);
    Avaliacao avaliacao2 = Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1350), estrelas: 6);
    expect(Avaliacao(atendente: avaliacao?.atendente,estrelas: avaliacao!.estrelas).avaliacaoMinima(avaliacao.estrelas),0);
    expect(Avaliacao(atendente: avaliacao1?.atendente,estrelas: avaliacao1!.estrelas).avaliacaoMinima(avaliacao1.estrelas),3);
    expect(Avaliacao(atendente: avaliacao2?.atendente,estrelas: avaliacao2!.estrelas).avaliacaoMaxima(avaliacao2.estrelas),5);
  });

  test("A gorjeta e a avaliação deve ser relacionada apenas a um atendente.",() {
    Cliente cliente = Cliente(nome: "Matheus");
    Avaliacao avaliacao = Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1350), estrelas: -1);
    Gorjeta gorjeta = Gorjeta (atendente: Atendente(nome: "Júlio", salario: 1250), valor: 3.0);

    Cliente cliente1 = Cliente(nome: "Matheus");
    Avaliacao avaliacao1 = Avaliacao(atendente: Atendente(nome: "Júlio", salario: 1350), estrelas: -1);
    Gorjeta gorjeta1 = Gorjeta (atendente: Atendente(nome: "João", salario: 1250), valor: 3.0);
    expect(Controle().gorjetaAvaliacaoAtendente(avaliacao.atendente!.nome,gorjeta.atendente!.nome),true);
    expect(Controle().gorjetaAvaliacaoAtendente(avaliacao1.atendente!.nome,gorjeta1.atendente!.nome),false);
  });

  test("A gorjeta deve ser adicionada a diária do atendente que está relacionado.",() {
    Cliente cliente = Cliente(nome: "Matheus");
    Gorjeta gorjeta = Gorjeta (atendente: Atendente(nome: "Júlio", salario: 1250), valor: 3.0);
    expect(Controle().gorjetaAtendente(gorjeta.valor, gorjeta.atendente!.salario),1253);
  });

  test("O atendente pode ser fixo ou temporário.", () {
    AtendenteFixo atendenteFixo = AtendenteFixo(nome: "João", salario: 2000.0);
    AtendenteTemporario atendenteTemporario =AtendenteTemporario(nome: "Maria", salario: 1500.0);
    expect(AtendenteFixo(nome: atendenteFixo.nome, salario: atendenteFixo.salario).atendenteFixo(atendenteFixo),true);
    expect(AtendenteTemporario(nome: atendenteTemporario.nome,salario: atendenteTemporario.salario).atendenteTemporario(atendenteTemporario),true);
  });

  test("A gorjeta quando não há atendente relacionado, deve ser distribuída a todos funcionários.", () {
    AtendenteFixo atendenteFixo = AtendenteFixo(nome: "João", salario: 2000.0);
    AtendenteTemporario atendenteTemporario =AtendenteTemporario(nome: "Maria", salario: 1500.0);
    var atendentes = [atendenteFixo, atendenteTemporario];
    Cliente cliente1 = Cliente(nome: "Matheus");
    Gorjeta gorjeta = Gorjeta (atendente: null, valor: 3.0);
    expect(Controle().distribuirGorjeta(atendentes, gorjeta), 1.5);
  });
}
