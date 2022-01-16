# <<fonte>> bin/lftmi/c6/at_turing_fi/AT_Turing_FI_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c5/mq_turing_fl/MQ_Turing_FL'
require 'lftmi/c6/at_turing_fi/AT_Turing_FI'
class AT_Turing_FI_FUNC < Minitest::Test
  # AT_Turing_FI_FUNC_setup
def setup
  @r = Lftmi::AT_Turing_FI.new
  @r.mq = Lftmi::MQ_Turing_FL.new( {
    :q0 => "q1", :fs => Set[ "q5" ],
    :delta => {
      ["q0", "<"] => Set[["q1", "<", :D]],
      ["q1", "a"] => Set[["q2", "a", :D]],
      ["q2", "b"] => Set[["q3", "b", :D]],
      ["q3", "c"] => Set[["q4", "c", :D]],
      ["q4", "a"] => Set[["q4", "a", :D]],
      ["q4", "b"] => Set[["q4", "b", :D]],
      ["q4", "c"] => Set[["q4", "c", :D]],
      ["q4", "B"] => Set[["q5", "B", :D]]    
    }
  } )
  @r.entrada = Lftmi::Fita_TI_LE.new
end

  def test_reconhecer_abc
  # Sabendo que
  r = @r
  # Quando
  r.analisar_cadeia( "abc" )
  # Então
end

  def test_reconhecer_abca
  # Sabendo que
  r = @r
  # Quando
  r.analisar_cadeia( "abca" )
  # Então
end

  def test_reconhecer_abccba
  # Sabendo que
  r = @r
  # Quando
  r.analisar_cadeia( "abccba" )
  # Então
end

end

