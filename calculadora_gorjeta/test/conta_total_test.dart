import 'package:contador_gorjeta/controle/conta_total.dart';
import 'package:contador_gorjeta/entidade/conta.dart';
import 'package:flutter_test/flutter_test.dart';

// >>A gorjeta não é obrigatória.

// >>A gorjeta deve ter valor mínimo de 5% do valor da conta, quando oferecida.

// >>A gorjeta deve ter valor máximo de 30% do valor da conta.

// >>A gorjeta deve ser relacionada apenas a um atendente.

// >>Ao adicionar a gorjeta o cliente pode adicionar um comentário.

// >>O cliente poderá realizar avaliação por meios de estrelas e não obrigatório.

// >>A avaliação do cliente deve ter no máximo 5 estrelas, quando oferecido.

// >>A avaliação do cliente deve ter no mínimo 0 estrelas, quando oferecido.

// >>A gorjeta deve ser adicionada ao salário mensal do atendente que está relacionado.

// >>A gorjeta, quando oferecida, não deve ser negativa.

void main() {
  test("Gorjeta não é obrigatória", () {
    expect(()=>ContaTotal().gorjetaExiste(null), returnsNormally);
  });
}
