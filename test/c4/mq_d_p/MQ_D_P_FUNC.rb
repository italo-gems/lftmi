# <<fonte>> bin/c4/mq_d_p/MQ_D_P_FUNC.rb
require "minitest/autorun"
require "lftmi/c4/mq_d_p/MQ_D_P"

class MQ_D_P_FUNC < Minitest::Test
  # MQ_D_P_FUNC::
  def setup
    @mq_d_p_1 = Lftmi::MQ_D_P.new({
      :q0 => "q1", :fs => Set["q1", "q2"],
      :delta => {
        ["q1", "a", "Z0"] => ["q2", ["Z0", "C"]],
      },
      :pilha => ["Z0"],
    })
  end

  # MQ_D_P_FUNC::
  def test_instanciacao
    # Sabendo que
    mq = @mq_d_p_1
    # Quando
    true
    # Então
    assert_equal("q1", mq.q0)
    assert_equal(Set["q1", "q2"], mq.fs)
    assert_equal({
      ["q1", "a", "Z0"] => ["q2", ["Z0", "C"]],
    }, mq.delta)
    assert_equal(["Z0"], mq.estrutura[:pilha])
  end

  # MQ_D_P_FUNC::
  def test_cfg_mover_para
    # Sabendo que
    mq = @mq_d_p_1
    cfg_0 = mq.salvar_cfg
    # Quando
    mq.cfg_mover_para(cfg_0, ["q2", ["Z0", "C"]])
    # Então
    assert_equal("q2", mq.q_cor)
    assert_equal(["Z0"], mq.estrutura[:pilha])
  end

  # MQ_D_P_FUNC::
  def test_salvar_cfg_cor
    # Sabendo que
    mq = @mq_d_p_1
    # Quando
    mq.cfg_mover_para({ :q_cor => "q1" }, ["q2", ["Z0", "C"]])
    # Então
    assert_equal("q2", mq.q_cor)
    assert_equal(["Z0"], mq.estrutura[:pilha])
  end

  # MQ_D_P_FUNC::
  def test_cfg_restaurar
    # Sabendo que
    mq = @mq_d_p_1
    cfg_0 = mq.salvar_cfg
    mq.cfg_mover_para(cfg_0, ["q2", ["Z0", "C"]])
    cfg_1 = mq.salvar_cfg
    mq.cfg_mover_para(cfg_1, ["q1", ["C"]])
    # Quando
    mq.cfg_restaurar(cfg_1)
    # Então
    assert_equal("q2", mq.q_cor)
  end
end
