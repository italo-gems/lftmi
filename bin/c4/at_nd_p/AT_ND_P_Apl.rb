# <<fonte>> bin/c3/at_nd_p/AT_ND_P_Apl.rb
require 'set'
require 'lftmi/c4/mq_nd_p/MQ_ND_P'
require 'lftmi/c4/at_nd_p/AT_ND_P'
require 'util/Linha_de_Comando'
include Linha_de_Comando
w, grau = tratar( ARGV, "ac" )

# AT_ND_P_Apl_definicao
at = Lftmi::AT_ND_P.new
at.mq = Lftmi::MQ_ND_P.new( {
    :q0 => "q0", :fs => Set["q4"],
    :delta => {
      ["q0", "a", "Z0"] => Set[
        [ "q1", ["Z0", "C", "C" ]],
        [ "q2", ["Z0", "C" ] ]
        ], 
      ["q1", "a", "C"] => Set[["q1", ["C", "C", "C"]]],
      ["q1", "c", "C"] => Set[["q3", []]],
      ["q2", "a", "C"] => Set[["q2", ["C", "C"]]],
      ["q2", "c", "C"] => Set[["q3", []]],
      ["q3", "c", "C"] => Set[["q3", []]],
      ["q3", "", "Z0"] => Set[["q4", ["Z0"]]]
    },
    :pilha => ["Z0"]
} )
at.entrada = Lftmi::Fita_L.new

# AT_ND_P_Apl_reconhecimento
at.analisar_cadeia( w, grau )

