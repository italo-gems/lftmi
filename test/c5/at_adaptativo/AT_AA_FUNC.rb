# <<fonte>> bin/c5/aa/AT_AA_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c3/mq_nd/MQ_ND_SV'
require 'lftmi/c5/mq_adaptativa/MQ_AA'
require 'lftmi/c5/at_adaptativo/AT_AA'
class AT_AA_FUNC < Minitest::Test
  def setup
  @um_aa = Lftmi::AT_AA.new
  @um_aa.mq = Lftmi::MQ_AA.new( {
    :fas => {
      :a0 => ->(x) {},
      :a1 => ->(mqa, s) {
        mqa.remover( [2, s] )
        mqa.alterar( [3, s], 4 )
        mqa.alterar( [6, s], 5 )
      }
    },
    :delta => {
      # [estado corrente, simbolo de entrada]        
      [2, "a"] => [ :a0, :a1 ],
      [2, "b"] => [ :a0, :a1 ],
      [2, "c"] => [ :a0, :a1 ]
    }
  } )
  @um_aa.entrada = Lftmi::Fita_L.new
  # Quando
  uma_mqfnd = Lftmi::MQ_ND_SV.new({
    :q0 => 1, :fs => Set[1, 5],
    :delta => { 
      [1, "#"] => Set[3],
      [1, "%"] => Set[2],
      [2, "a"] => Set[1],
      [2, "b"] => Set[1],
      [2, "c"] => Set[1],
      [5, "#"] => Set[3],
      [5, "+"] => Set[6],
      [5, "*"] => Set[6],
      [4, "="] => Set[6]
    }
  })
  @um_aa.mq.acrescentar( uma_mqfnd )
  @um_aa.mq.subjacente.converter_para_MQ_D( @um_aa.mq.subjacente.delta )
end

  def test_reconhecer_w1
  #Sabendo que
  r = @um_aa
  # Quando
  r.analisar_cadeia( "%a" )
  # Então
end

  def test_reconhecer_w2
  #Sabendo que
  r = @um_aa
  # Quando
  r.analisar_cadeia( "%a%c" )
  # Então
end

  def test_reconhecer_w3
  #Sabendo que
  r = @um_aa
  # Quando
  r.analisar_cadeia( "%a%c#a=c#c=a+c*c" )
  # Então
end

  def test_reconhecer_w4
  #Sabendo que
  r = @um_aa
  # Quando
  r.analisar_cadeia( "%a%c#b=c" )
  # Então
end

  def test_reconhecer_w5
  #Sabendo que
  r = @um_aa
  # Quando
  r.analisar_cadeia( "%a%c#a=a*b" )
  # Então
end

  def test_reconhecer_w6
  #Sabendo que
  r = @um_aa
  # Quando
  r.analisar_cadeia( "%a%c%a#a=c" )
  # Então
end

end

