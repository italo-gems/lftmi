# <<fonte>> bin/c3/mq_d/MQ_D_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c3/mq_d/MQ_D'
class MQ_D_FUNC < Minitest::Test
  # MQ_D_FUNC_uso_setup
def setup
  @md_d_exemplo = Lftmi::MQ_D.new({
    :q0 => "q1", :fs => Set[ "q2" ],
    :delta => {
      ["q1", "a"] => "q1",
      ["q1", "b"] => "q2",
      ["q2", "a"] => "q2",
      ["q2", "b"] => "q2"
    }
  })
end

  # MQ_D_FUNC_uso_instanciacao
def test_instanciacao
  # Sabendo que
  mq = @md_d_exemplo
  # Quando
  mq.cfg_0_def
  # Então
  assert_equal(mq.q0, "q1")
  assert_equal(mq.fs, Set[ "q2" ])
  assert_equal(mq.delta, {
    ["q1", "a"] => "q1",
    ["q1", "b"] => "q2",
    ["q2", "a"] => "q2",
    ["q2", "b"] => "q2"
  })
  assert_equal(mq.delta[ ["q1", "a"] ], "q1")
  assert_equal(mq.q_cor, "q1")
end

  # MQ_D_FUNC_uso_trs_calcular_possiveis
def test_trs_calcular_possiveis
  # Sabendo que
  mq = @md_d_exemplo
  mq.cfg_0_def
  # Quando
  trs_a = mq.trs_calcular_possiveis( "a" )
  trs_b = mq.trs_calcular_possiveis( "b" )
  # Então
  assert_equal(trs_a, Set[ "q1" ])
  assert_equal(trs_b, Set[ "q2" ])
end

  # MQ_D_FUNC_uso_mover_para_q0
def test_mover_para_q0
  # Sabendo que
  mq = @md_d_exemplo
  mq.cfg_0_def
  # Quando
  q_seguinte = mq.delta[ [mq.q_cor, "a"] ]
  mq.cfg_mover_para( { :q_cor => "q1" }, "q1" )
  # Então
  assert_equal(q_seguinte, "q1")
  assert_equal(mq.q_cor, "q1")
end

  # MQ_D_FUNC_uso_mover_para_q2
def test_mover_para_q2
  # Sabendo que
  mq = @md_d_exemplo
  mq.cfg_0_def
  # Quando
  q_seguinte = mq.delta[ [mq.q_cor, "a"] ]
  mq.cfg_mover_para( { :q_cor => "q1" }, q_seguinte )
  # Então
  assert_equal(mq.q_cor, "q1")
end

  # MQ_D_lembranca_configuracao
def test_salvar_cfg_cor
  # Sabendo que
  mq = @md_d_exemplo
  mq.cfg_0_def
  # Quando
  cfg_0 = mq.salvar_cfg
  mq.cfg_mover_para( cfg_0, "q2" )
  cfg_1 = mq.salvar_cfg
  mq.cfg_restaurar( cfg_0 )
  # Então
  assert_equal(cfg_0[ :q_cor ], "q1")
  assert_equal(cfg_1[ :q_cor ], "q2")
  assert_equal(mq.q_cor, "q1")
end

end

