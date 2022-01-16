# <<fonte>> bin/c3/afnd/MQ_ND_SV_FUNC.rb
require "minitest/autorun"
require "lftmi/c3/mq_nd/MQ_ND_SV"

class MQ_ND_SV_FUNC < Minitest::Test
  # MQ_ND_SV_FUNC_uso_setup
  def setup
    @mq_sv_exemplo = Lftmi::MQ_ND_SV.new({
      :q0 => "q1", :fs => Set["q1", "q2"],
      :delta => {
        ["q1", "a"] => Set["q1", "q2"],
        ["q2", "a"] => Set["q2"],
      },
    })
  end

  # MQ_ND_SV_FUNC_uso_instanciacao
  def test_instanciacao
    # Sabendo que
    true
    # Quando
    mq = @mq_sv_exemplo
    mq.cfg_0_def
    # Então
    assert_equal(mq.q0, "q1")
    assert_equal(mq.fs, Set["q1", "q2"])
    assert_equal(mq.delta, {
      ["q1", "a"] => Set["q1", "q2"],
      ["q2", "a"] => Set["q2"],
    })
    assert_equal(mq.delta[["q1", "a"]], Set["q1", "q2"])
    assert_includes(mq.fs, "q1")
    assert_includes(mq.fs, "q2")
    assert_equal(mq.q_cor, "q1")
  end

  #MQ_ND_SV_FUNC_uso_converter_para_MQ_D
  # MQ_ND_SV_FUNC_uso_trs_calcular_possiveis1
  def test_trs_calcular_possiveis1
    # Sabendo que
    mq = @mq_sv_exemplo
    mq.cfg_0_def
    # Quando
    trs_comandos_possiveis_a = mq.trs_calcular_possiveis("a")
    # Então
    assert_equal(trs_comandos_possiveis_a, Set[Set["q1", "q2"]])
  end

  #MQ_ND_SV_FUNC_uso_trs_calcular_possiveis2
end
