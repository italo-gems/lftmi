# <<fonte>> bin/c7/mtu/MQ_Turing_Uni_FUNC.rb
require "minitest/autorun"
require "lftmi/c7/mq_turing_uni/MQ_Turing_Uni"

class MQ_Turing_Uni_FUNC < Minitest::Test
  # MQ_Turing_Uni_FUNC_criacao
  def setup
    @uma_mtu = Lftmi::MQ_Turing_Uni.new({
      :q0 => 0,
      :fs => Set[2],
      :delta => {
        [0, "0"] => Set[[1, "0", :D]],
        [1, "1"] => Set[[1, "1", :D]],
        [1, "B"] => Set[[2, "B", :E]],
      },
    })
  end

  def test_codificar_MQ_Turing_Uni
    # Sabendo que
    mq = @uma_mtu
    # Quando
    ts = mq.codificar
    # Então
    assert_equal("aabbbaaaaabbbaccaaaabbbbaaaaabbbbaccaaaabbaaaaaabbac", ts)
  end
end
