# <<fonte>> test/c2/MQ_2_1_FUNC.rb::
# require 'minitest/autorun'

require "minitest/autorun"
require "set"
require "c2/at/MQ_2_1"
# class MQ_2_1_FUNC < Minitest::Test
class MQ_2_1_FUNC < Minitest::Test
  # MQ_2_1_FUNC_prototipo_de_estudo::
  def setup
    @mq_2_1 = MQ_2_1.new({
      :q0 => "1", :fs => Set["2"],
      :delta => { ["1", "a"] => "2" },
    })
  end

  # MQ_2_1_FUNC_propriedades_de_instanciacao::
  def test_instanciacao
    # Sabendo que
    mq = @mq_2_1
    # Quando
    # true
    # Então
    assert_equal(mq.q0, "1")
    assert_equal(mq.fs, Set["2"])
    assert_equal(mq.delta, { ["1", "a"] => "2" })
  end

  # MQ_2_1_FUNC_possibilidades_de_transicao::
  def test_transicoes_habilitadas
    # Sabendo que
    mq = @mq_2_1
    mq.cfg_0_def
    # Quando
    q_seguinte = mq.trs_calcular_possiveis("a")
    # Então
    assert_equal(mq.q_cor, "1")
    assert_equal(mq.q_cor, mq.q0)
    assert_equal(q_seguinte, Set["2"])
  end

  # MQ_2_1_FUNC_movimentacao::
  def test_movimentacao
    # Sabendo que
    mq = @mq_2_1
    mq.cfg_0_def
    cfg_0 = mq.salvar_cfg
    q_seguinte_1 = mq.trs_calcular_possiveis("a")
    # Quando
    mq.cfg_mover_para(cfg_0, q_seguinte_1)
    q_seguinte_2 = mq.trs_calcular_possiveis("a")
    # Então
    assert refute_equal(mq.q_cor, mq.q0)
    assert_equal(mq.q_cor, q_seguinte_1)
    assert_equal(q_seguinte_2, Set[])
  end

  # MQ_2_1_FUNC_configuracao_final::
  def test_cfg_final
    # Sabendo que
    mq = @mq_2_1
    # Quando
    mq.cfg_0_def
    # Então
    refute(mq.cfg_final?)
  end
end
