# <<fonte>> bin/c3/afd/AT_D_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c3/at_d/AT_D'
class AT_D_FUNC < Minitest::Test
  def setup
  @at_d_1 = Lftmi::AT_D.new
  @at_d_1.mq = Lftmi::MQ_D.new( {
    :q0 => "q0", :fs => Set[ "q0", "q1" ],
    :delta => {
      ["q0", "a"] => "q0",
      ["q0", "b"] => "q1",
      ["q1", "a"] => "q1",
      ["q1", "b"] => "q1"
    }
  } )
  @at_d_1.entrada = Lftmi::Fita_L.new
end

  # AT_2_1_FUNC_trs_calcular_possiveis
def test_trs_calcular_possiveis
  # Sabendo que
  r = @at_d_1
  r.cfg_0_def_com_entrada( "ab" )
  cfg_0 = r.cfg_i
  # Quando
  trs_calcular_possiveis = r.trs_calcular_possiveis
  # Então
  assert_equal(r.entrada.cadeia, "<ab>")
  assert_equal(r.entrada.cursor, 1)
  assert_equal(cfg_0, ["q0", "a"])
  assert_equal(trs_calcular_possiveis, Set[ "q0" ])
end

  # AT_D_FUNC_movimentacao
def test_movimentacao
  # Sabendo que
  r = @at_d_1
  r.cfg_0_def_com_entrada( "a" )  
  cfg_0 = r.salvar_cfg
  # Quando
  cmds = r.calcular_trs( cfg_0, r.mq.q0 )
  cmd = cmds[0]
  cmd[0].call( cmd[1], cmd[2] )
  cfg_1 = r.cfg_i
  cmd = cmds[1]
  cmd[0].call( cmd[1], cmd[2] )
  cfg_2 = r.cfg_i
  # Então
  assert_equal(3, cmds.size)
  assert_equal({ :cursor => 1, :q_cor => "q0" }, cfg_0)
  assert_equal(["q0", "a"], cfg_1)
  assert_equal(["q0", ">"], cfg_2)
end

  # AT_D_FUNC_configuracao_final
def test_configuracao_final
  # Sabendo que
  r = @at_d_1
  r.cfg_0_def_com_entrada( "a" )  
  cfg_0 = r.salvar_cfg
  # Quando
  cmds = r.calcular_trs( cfg_0, r.mq.q0 )
  cmds.each { |cmd| cmd[0].call(cmd[1], cmd[2])}
  cfg_3 = r.cfg_i
  # Então
  assert_equal(3, cmds.size)
  assert_equal({ :cursor => 1, :q_cor => "q0" }, cfg_0)
  assert_equal(["q0", ">"], cfg_3)
  assert r.cfg_final?
end


  # AT_D_FUNC_reconhecer_12
  # AT_D_FUNC_reconhecer_222
  # AT_D_FUNC_reconhecer_0122
  # AT_D_FUNC_reconhecer_0022
  # AT_D_FUNC_reconhecer_00001
  # AT_D_FUNC_reconhecer_0011222
end

