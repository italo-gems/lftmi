# <<fonte>> bin/c3/afnd/AT_ND_SV_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c3/mq_nd/MQ_ND_SV'
require 'lftmi/c3/at_nd/AT_ND_SV'
class AT_ND_SV_FUNC < Minitest::Test
  def test_ex_3_12
  # Sabendo que
  r = Lftmi::AT_ND_SV.new
  r.mq = Lftmi::MQ_ND_SV.new({ 
    :q0 => 0,
    :fs => Set[1, 2],
    :delta => {
      [0, "a"] => Set[1, 2], 
      [1, "b"] => Set[1, 2],
      [2, "c"] => Set[2]
    }
  })
  r.entrada = Lftmi::Fita_L.new
  # Quando
  res = r.analisar_cadeia( "abbccc" )
  # Então
  assert res
end

end

