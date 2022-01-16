# <<fonte>> bin/c3/afnd/MQ_ND_EPS_FUNC.rb
require 'minitest/autorun'

require 'set'
require 'lftmi/c3/mq_nd/MQ_ND_EPS'
class MQ_ND_EPS_FUNC < Minitest::Test
  # MQ_ND_SV_FUNC_uso_setup
def setup
  @mq_eps = Lftmi::MQ_ND_EPS.new({
    :q0 => 1, :fs => Set[1, 2],
    :delta => {
      [1, "a"] => Set[1],
      [1, ""] => Set[2]
    }
  })
end

  # MQ_ND_EPS_FUNC_uso_instanciacao
def test_instanciacao
  # Sabendo que
  # Quando
  mq = @mq_eps
  # Então
  assert_equal(mq.q0, 1)
  assert_equal(mq.fs, Set[1, 2])
  assert_equal(mq.delta, {
      [1, "a"] => Set[1],
      [1, ""] => Set[2]
    })
end

  # MQ_ND_EPS_FUNC_uso_remover_transicoes_em_vazio
def test_remover_transicoes_em_vazio
  # Sabendo que
  mq = Lftmi::MQ_ND_EPS.new({
    :q0 => "q1", :fs => Set["q1", "q2"],
    :delta => {
      ["q1", "a"] => Set["q1"],
      ["q1", "" ] => Set["q2"]
    }
  })
  # Quando
  ts = mq.remover_transicoes_em_vazio( mq.delta, mq.fs )
  # Então
  assert_equal(ts, {
    ["q1", "a"] => Set[ "q1", "q2" ]
    })
end

end

