# <<fonte>> bin/c5/aa/AT_AA_Apl.rb
require 'set'
require 'lftmi/c3/mq_nd/MQ_ND_SV'
require '05/at_adaptativo/AT_AA'
require 'util/Linha_de_Comando'
include Linha_de_Comando
w, grau = tratar( ARGV, "%a" )

# AT_AA_Apl_definicao
mqfnd = MQ_ND_SV.new({
    :q0 => 1, :fs => Set[1, 5],
    :delta => { 
        [1, "#"] => Set[3], [1, "%"] => Set[2],
        [2, "a"] => Set[1], [2, "b"] => Set[1], [2, "c"] => Set[1],
        [5, "#"] => Set[3], [5, "+"] => Set[6], [5, "*"] => Set[6],
        [4, "="] => Set[6]
    }
})

r = AT_AA.new
r.mq = MQ_AA.new( {
    :fas => {
      :a0 => ->(x) {},
      :a1 => ->(mq, s) {
        mq.remover( [2, s] )
        mq.alterar( [3, s], 4 )
        mq.alterar( [6, s], 5 )
      }
    },
    :delta => {
      # [estado corrente, simbolo de entrada]        
      [2, "a"] => [ :a0, :a1 ],
      [2, "b"] => [ :a0, :a1 ],
      [2, "c"] => [ :a0, :a1 ]
    }
} )
r.mq.acrescentar( mqfnd )
r.entrada = Fita_L.new

# AT_AA_Apl_reconhecimento
r.analisar_cadeia( w, grau )

