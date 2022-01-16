# <<fonte>> bin/c2/bin/AT_2_1_FUNC.rb
require 'minitest/autorun'
require 'c2/at/MQ_2_1'
require 'c2/at/AT_2_1'
class AT_2_1_FUNC < Minitest::Test
  # AT_2_1_FUNC_prototipo_de_estudo::
def setup
  mqf = MQ_2_1.new( {
    :q0 => "q0", :fs => Set[ "q1" ],
    :delta => { ["q0", "a"] => Set["q1"] }
  } )
  @at_2_1 = AT_2_1.new( mqf )
end

  # AT_2_1_FUNC_propriedades_de_instanciacao::
def test_propriedades_de_instanciacao
  # Sabendo que
  r = @at_2_1
  # Quando
  true
  # Então
  assert_equal(r.mq.q0, "q0")
  assert_equal(r.mq.fs, Set["q1"])
  assert_equal(r.entrada.cadeia, ["<", ">"])
  assert_equal(r.entrada.cursor, 1)
end

  # AT_2_1_FUNC_possibilidades_de_transicao::
def test_possibilidades_de_transicao
  # Sabendo que
  r = @at_2_1
  r.cfg_0_def_com_entrada( "a" )
  cfg_0 = r.cfg_i
  # Quando
  trs = r.trs_calcular_possiveis
  # Então
  assert_equal(r.entrada.cadeia, "<a>")
  assert_equal(r.entrada.cursor, 1)
  assert_equal(cfg_0, ["q0", "a"])
  assert_equal(trs, Set[ Set[ "q1" ] ])
end

  # AT_2_1_FUNC_movimentacao::
def test_movimentacao
  # Sabendo que
  r = @at_2_1
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
  assert_equal(2, cmds.size)
  assert_equal({ :cursor => 1, :q_cor => "q0" }, cfg_0)
  assert_equal(["q0", "a"], cfg_1)
  assert_equal(["q0", ">"], cfg_2)
end

  # AT_2_1_FUNC_resultado_da_analise::
def test_resultado_da_analise
  # Sabendo que
  r = @at_2_1
  r.cfg_0_def_com_entrada( "a" )
  cfg_0 = r.salvar_cfg
  # Quando
  cmds = r.calcular_trs( cfg_0, r.mq.q0 )
  cmds.each { |cmd| cmd[0].call( cmd[1], cmd[2] ) }
  cfg_3 = r.cfg_i
  # Então
  assert_equal(2, cmds.size)
  assert_equal({ :cursor => 1, :q_cor => "q0" }, cfg_0)
  assert_equal(["q0", ">"], cfg_3)
  refute(r.cfg_final?)
end

end

