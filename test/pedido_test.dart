// não deve criar um pedido com CPF inválido
// CPF válido 264.310.820-52
// deve criar um pedido com 3 itens
// ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item
// deve apresentar a soma de um item corretamente
// deve permitir desconto do item de no máximo 15%
// deve apresentar o total do pedido corretamente
// deve validar e calcular o desconto de um cupom de desconto
// deve adicionar um cupom de desconto
import 'package:aula_16_02/entidade/pedido.dart';
import 'package:aula_16_02/entidade/produto.dart';
import 'package:aula_16_02/entidade/produto_pedido.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Não deve criar um pedido com CPF inválido", () {
    expect(() => Pedido(CPF: '111'), throwsException);
  });

  test("Deve criar um pedido com 3 itens", () {
    var pedido = Pedido(CPF: '264.310.820-52');
    pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'coca-cola', precoUnidade: 5.50),
        quantidade: 1));
    pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'fanta', precoUnidade: 5.50), quantidade: 1));
    pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'chokito', precoUnidade: 4.50), quantidade: 1));
    expect(pedido.contarItem(), 3);
  });

  test(
      "Ao adicionar um produto existente no pedido, deve alterar a quantidade sem criar um novo item",
      () {
    var pedido = Pedido(CPF: '264.310.820-52');
    pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'coca-cola', precoUnidade: 5.50),
        quantidade: 1));
    pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'coca-cola', precoUnidade: 5.50),
        quantidade: 1));
    pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'chokito', precoUnidade: 4.50), quantidade: 1));
    expect(pedido.contarItem(), 2);
  });

  test("Deve apresentar a soma de um item corretamente", () {
    var pedido = Pedido(CPF: '264.310.820-52');
    var totalItem = pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'coca-cola', precoUnidade: 6.50),
        quantidade: 2));
    expect(totalItem, 13.0);
  });

  test("Deve permitir desconto do item de no máximo 15%", () {
    var pedido = Pedido(CPF: '264.310.820-52');
    expect(
        () => pedido.addItem(Produto_Pedido(
            produto: Produto(nome: 'coca-cola', precoUnidade: 5.50),
            quantidade: 1,
            descontoEmReais: 5.50)),
        throwsException);
    expect(
        pedido.addItem(Produto_Pedido(
            produto: Produto(nome: 'fanta', precoUnidade: 15),
            quantidade: 1,
            descontoEmReais: 1)),
        14);
  });

  test("Deve apresentar o total do pedido corretamente", () {
    var pedido = Pedido(CPF: '264.310.820-52');
    pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'fanta', precoUnidade: 15),
        quantidade: 1,
        descontoEmReais: 1));
    expect(pedido.getTotal(), 14);
  });

  test("Deve validar e calcular o desconto de um cupom de desconto", () {
    var pedido = Pedido(CPF: '264.310.820-52');
    expect(pedido.validarCupom("CUPOM20"), 0.2);
  });

  test("Deve adicionar um cupom de desconto", () {
    var pedido = Pedido(CPF: '264.310.820-52');
    pedido.addItem(Produto_Pedido(
        produto: Produto(nome: 'fanta', precoUnidade: 15), quantidade: 1));
    expect(pedido.calcularCupom("CUPOM20"), 12);
  });
}
