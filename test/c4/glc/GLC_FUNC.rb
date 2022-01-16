# <<fonte>> bin/lftmi/c4/glc/GLC_FUNC.rb
require 'minitest/autorun'
require "lftmi/c4/glc/GLC"
class GLC_FUNC < Minitest::Test
  def setup
  @gr_1 = Lftmi::GLC.new
end

  # GLC_FUNC_construtor
def test_instanciacao
    # Sabendo que
    g = @gr_1
    # Quando
    true
    # Então
    assert_equal( Set[], g.producoes )
end

  # GLC_FUNC_adicionar_producao
def test_adicionar_producao
    # Sabendo que
    g = @gr_1
    # Quando
    g.adicionar_producao( { "E" => ["T+E", "T"] } )
    g.adicionar_producao( { "F" => [ "(E)", "a" ] } )
    # Então
    ### assert_equal( Set[ 
    #  "E" => ["T+E", "T"], 
    #  "F" => [ "(E)", "a" ] 
    # ], g.producoes )
end

  # GLC_FUNC_derivar_sentencas
def test_derivar_sentencas
    # Sabendo que
    g = @gr_1
    g.adicionar_producao( { "E" => ["T+E", "T"] } )
    g.adicionar_producao( { "T" => [ "F*T", "F" ] } )
    g.adicionar_producao( { "F" => [ "(E)", "a" ] } )
    # Quando
    s0 = g.derivar( "E", 0 )
    s1 = g.derivar( "E", 1 )
    s2 = g.derivar( "E", 2 )
    # Então
    assert_equal(Set[], s0)
    assert_equal(Set[[ "E", Set["T+E", "T"] ]], s1)

    # assert_equal(Set[
    #  { "E" => Set["T+E", "T"] },
    #  { "T+E" => Set["T+T+E", "T+T", "F*T+E", "F+E"] },
    #  { "T" => Set["F*T", "F"] }], 
    #             s2 )
end

end

