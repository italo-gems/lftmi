# <<fonte>> bin/lftmi/c3/at_nd/AT_ND_SV_Apl.rb
require 'set'
require 'lftmi/c3/mq_nd/MQ_ND_SV'
require 'lftmi/c3/at_nd/AT_ND_SV'
require 'util/Linha_de_Comando'
include Linha_de_Comando
w, grau = tratar( ARGV, "abcd" )

# AT_ND_SV_Apl_1_definicao
# ex_3_13
r = AT_ND_SV.new
r.mq = MQ_ND_SV.new( {
  :q0 => 0, :fs => Set[4],
  :delta => {
    [0, "a"] => Set[1], 
    [0, "b"] => Set[0],
    [0, "c"] => Set[0],
    [0, "d"] => Set[0],
    [1, "a"] => Set[1],
    [1, "b"] => Set[2],
    [1, "c"] => Set[0],
    [1, "d"] => Set[0],
    [2, "a"] => Set[1],
    [2, "b"] => Set[0],
    [2, "c"] => Set[3],
    [2, "d"] => Set[0],
    [3, "a"] => Set[1],
    [3, "b"] => Set[0],
    [3, "c"] => Set[0],
    [3, "d"] => Set[4],
    [4, "a"] => Set[4],
    [4, "b"] => Set[4],
    [4, "c"] => Set[4],
    [4, "d"] => Set[4] 
  }
} )
r.entrada = Fita_L.new

# AT_ND_SV_Apl_reconhecimento
# pp r.converter_para_MQ_D
r.analisar_cadeia( w, grau )

