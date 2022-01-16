# <<fonte>> bin/c4/mq_d_p/Pilha_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c4/at_p/pilha/Pilha'
class Pilha_FUNC < Minitest::Test
  # Pilha_FUNC_uso::
def setup
  @pilha_1 = Lftmi::Pilha.new
end

  # Pilha_FUNC_uso::
def test_instanciacao
  # Sabendo que
  p = @pilha_1
  # Quando
  true
  # Então
  assert_equal( ["Z0"], p.conteudo )
  assert_equal( "Z0", p.top )
end

  #Pilha_FUNC_uso_tipico
end

