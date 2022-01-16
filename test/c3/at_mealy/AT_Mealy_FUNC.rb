# <<fonte>> bin/c3/mealy/AT_Mealy_FUNC.rb
require "minitest/autorun"
require "lftmi/c3/mq_nd/MQ_ND_SV"
require "lftmi/c3/at_mealy/AT_Mealy"

class AT_Mealy_FUNC < Minitest::Test
  def test_reconhece_a
    # Sabendo que
    r = Lftmi::AT_Mealy.new
    r.mq = Lftmi::MQ_ND_SV.new({
      :q0 => "q0", :fs => Set["q1"],
      :delta => {
        ["q0", "a"] => Set["q1"],
        ["q1", "b"] => Set["q1"],
        ["q1", "c"] => Set["q0"],
      },
      :lam => {
        ["q0", "a"] => "ab",
        ["q1", "b"] => "",
        ["q1", "c"] => "c",
      },
    })
    r.entrada = Lftmi::Fita_L.new
    #r.automato.converter_para_MQ_D( r.automato.delta )
    # Quando
    s = r.analisar_cadeia("a")
    # Então
    assert s
    assert_equal(r.saida, "ab")
  end
end
