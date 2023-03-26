import 'package:contador_gorjeta/controle/conta_total.dart';
import 'package:contador_gorjeta/entidade/conta.dart';
import 'package:flutter_test/flutter_test.dart';

// >>A gorjeta não é obrigatória.

// >>A gorjeta deve ter valor mínimo de 5% do valor da conta e o valor máximo de 30% do valor da conta, quando oferecida.

// >> A avaliação do cliente não é obrigatória.

// >>A gorjeta deve ser relacionada apenas a um atendente.

// >>A gorjeta quando não há atendente relacionado, deve ser distribuída a todos funcionários.

// >>O cliente poderá realizar avaliação por meios de estrelas.

// >>A avaliação do cliente deve ter no máximo 5 estrelas e  no mínimo 0 estrelas, quando oferecido.

// >>O atendente pode ser fixo ou temporário.

// >>A gorjeta deve ser adicionada a diária do atendente que está relacionado.

// >>A gorjeta, quando oferecida, não deverá ser negativa.

void main() {
  test("Gorjeta não é obrigatória", () {
    expect(()=>ContaTotal().gorjetaCalculo(null), returnsNormally);
  });

   test("A gorjeta, quando oferecida, não deverá ser negativa", () {
    expect(ContaTotal().gorjetaNegativa(-10), 0.0);
  });

  test("A gorjeta deve ter valor mínimo de 5% do valor da conta e o valor máximo de 30% do valor da conta, quando oferecida.", () {
    expect(ContaTotal().gorjetaMinima(3.5), 0.0);
    expect(ContaTotal().gorjetaMinima(0.5), 5.0);
    expect(ContaTotal().gorjetaMinima(3), 30.0);
  });
}
