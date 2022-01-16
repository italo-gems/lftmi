# <<fonte>> bin/lftmi/c3/at_nd/AT_ND_EPS_FUNC.rb
require "minitest/autorun"
require "lftmi/c3/mq_nd/MQ_ND_EPS"
require "lftmi/c3/at_nd/AT_ND_EPS"

class AT_ND_EPS_FUNC < Minitest::Test
  def setup
    @at_nd_eps_1 = Lftmi::AT_ND_EPS.new
    @at_nd_eps_1.mq = Lftmi::MQ_ND_EPS.new({
      :q0 => 0,
      :fs => Set[1],
      :delta => {
        [0, "a"] => Set[0],
        [0, ""] => Set[1],
        [1, "b"] => Set[1],
      },
    })
    @at_nd_eps_1.entrada = Lftmi::Fita_L.new
  end

  def test_ex_3_13
    # Sabendo que
    r = @at_nd_eps_1
    # Quando
    res = r.analisar_cadeia("abbccc")
    # Então
    assert res
  end

  def test_instanciacao
    # Sabendo que
    r = @at_nd_eps_1
    # Quando
    res = r.analisar_cadeia("ab")
    # Então
    assert res
  end

  #AT_ND_EPS_FUNC_resultado_de_analise
end
