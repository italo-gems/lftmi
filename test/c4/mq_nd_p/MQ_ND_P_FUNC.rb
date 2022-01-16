# <<fonte>> bin/c3/mq_nd_p/MQ_ND_P_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c4/mq_nd_p/MQ_ND_P'
class MQ_ND_P_FUNC < Minitest::Test
  # MQ_ND_P_FUNC_uso_setup
def setup
  @a = Lftmi::MQ_ND_P.new({
    :q0 => "q1", :fs => Set["q2"],
    :delta => {
      ["q1", "a", "Z0"] => Set[
        ["q1", ["Z0", "C", "C"]],
        ["q2", ["Z0", "C"]]
      ]
    },
    :pilha => ["Z0"]
  })
end

  # MQ_ND_P_FUNC_uso_instanciacao
def test_instanciacao
  # Sabendo que
  # Quando
  mq = @a
  # Então
  assert_equal(mq.q0, "q1")
  assert_equal(mq.fs, Set["q2"])
  assert_equal(mq.delta, {
      ["q1", "a", "Z0"] => Set[
        ["q1", ["Z0", "C", "C"]],
        ["q2", ["Z0", "C"]]
      ]
    })
  assert_equal(["Z0"], mq.estrutura[ :pilha ])
end

  # MQ_ND_P_FUNC_uso_mover_para_q0
def test_mover_para_q0
  # Sabendo que
  mq = @a
  cfg_0 = mq.salvar_cfg
  # Quando
  mq.cfg_mover_para( cfg_0, [mq.q0, ["Z0"]] )
  # Então
  assert_equal(mq.q_cor, "q1")
end

  # MQ_ND_P_FUNC_uso_mover_para_q2
def test_mover_para_q2
  # Sabendo que
  mq = @a
  cfg_0 = mq.salvar_cfg
  mq.cfg_mover_para( cfg_0, [mq.q0, ["Z0"]] )
  cfg_1 = mq.salvar_cfg
  # Quando
  mq.cfg_mover_para( cfg_1, ["q2", ["Z0", "C"]] )
  # Então
  assert_equal(mq.q_cor, "q2")
end

end

