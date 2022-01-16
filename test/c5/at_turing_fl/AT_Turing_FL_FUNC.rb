# <<fonte>> bin/c5/mtfl/AT_Turing_FL_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c5/mq_turing_fl/MQ_Turing_FL'
require 'lftmi/c5/at_turing_fl/AT_Turing_FL'
class AT_Turing_FL_FUNC < Minitest::Test
  # AT_Turing_FL_FUNC_setup
def setup
  @r = Lftmi::AT_Turing_FL.new
  @r.mq = Lftmi::MQ_Turing_FL.new( {
    :q0 => "q0", :fs => Set["q2"],
    :delta => {
      ["q0", "a"] => Set[["q0", "a", :D]],
      ["q0", "b"] => Set[["q1", "b", :D]],
      ["q0", ">"] => Set[["q2", ">", :E]],
      ["q1", "b"] => Set[["q1", "b", :D]],
      ["q1", ">"] => Set[["q2", ">", :E]]
    },
    :q_cor => "q0"
  } )
  @r.entrada = Lftmi::Fita_TL_LE.new
end

  def test_reconhecer_aabbb
  # Sabendo que
  r = @r
  # Quando
  r.analisar_cadeia( "aabbb" )
  # Então
end

  def test_reconhecer_aaba
  # Sabendo que
  r = @r
  # Quando
  r.analisar_cadeia( "aaba" )
  # Então
end

end

