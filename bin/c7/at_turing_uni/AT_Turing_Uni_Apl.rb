# <<fonte>> bin/c7/mtu/AT_Turing_Uni_Apl.rb
require 'set'
require '07/mq_turing_uni/MQ_Turing_Uni'
require '07/at_turing_uni/AT_Turing_Uni'
require 'util/Linha_de_Comando'
include Linha_de_Comando
w, grau = tratar( ARGV, "01" )

# `AT_Turing_Uni_Apl_definicao`

# Ex 6.4, p. 564
at = AT_Turing_Uni.new
at.mq = MQ_Turing_Uni.new( {
    :q0 => 0,
    :fs => Set[2],
    :delta => {
      [0, "0"] => Set[[1, "0", :D]],
      [1, "1"] => Set[[1, "1", :D]],
      [1, "B"] => Set[[2, "B", :E]]
    },
    :q_cor => 0
} )
at.entrada = Fita_TI_LE.new

# AT_Turing_Uni_Apl_reconhecimento
puts at.codificar
at.analisar_cadeia( w, grau )

