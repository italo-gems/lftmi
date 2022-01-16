# <<fonte>> bin/c4/at_nd_p/AT_ND_P_FUNC.rb
require "minitest/autorun"
require "lftmi/c4/at_nd_p/AT_ND_P"

class AT_ND_P_FUNC < Minitest::Test
  def setup
    # Sabendo que
    @at_nd_p_1 = Lftmi::AT_ND_P.new
    @at_nd_p_1.mq = Lftmi::MQ_ND_P.new({
      :q0 => "q0",
      :fs => Set["q4"],
      :delta => {
        ["q0", "a", "Z0"] => Set[
          ["q1", ["Z0", "C", "C"]],
          ["q2", ["Z0", "C"]]
        ],
        ["q1", "a", "C"] => Set[["q1", ["C", "C", "C"]]],
        ["q1", "c", "C"] => Set[["q3", []]],
        ["q2", "a", "C"] => Set[["q2", ["C", "C"]]],
        ["q2", "c", "C"] => Set[["q3", []]],
        ["q3", "c", "C"] => Set[["q3", []]],
        ["q3", "", "Z0"] => Set[["q4", ["Z0"]]],
      },
      :pilha => ["Z0"],
    })
    @at_nd_p_1.entrada = Lftmi::Fita_L.new
  end

  def test_reconhece_ac
    # Sabendo que
    r = @at_nd_p_1
    # Quando
    s = r.analisar_cadeia("ac")
    # Então
    assert s
  end

  def test_reconhece_aacc
    # Sabendo que
    r = @at_nd_p_1
    # Quando
    s = r.analisar_cadeia("aacc")
    # Então
    assert s
  end

  def test_reconhece_aacccc
    # Sabendo que
    r = @at_nd_p_1
    # Quando
    s = r.analisar_cadeia("aacccc")
    # Então
    assert s
  end
end
