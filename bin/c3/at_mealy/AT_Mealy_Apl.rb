# <<fonte>> bin/c3/mealy/AT_Mealy_Apl.rb
# <<fonte>> bin/c3/mealy/AT_Mealy_Apl.rb
require 'set'
require 'lftmi/c3/mq_nd/MQ_ND_SV'
require '03/at_mealy/AT_Mealy'
require 'util/Linha_de_Comando'
include Linha_de_Comando
w, grau = tratar( ARGV, "abbcabbbcab" )

# AT_Mealy_Apl_definicao

### Ambiente de execução
# Exemplo 3.47, p 231.

r = AT_Mealy.new
r.mq = MQ_ND_SV.new( {
  :q0 => "q0", :fs => Set["q1"],
  :delta => {
    ["q0", "a"] => Set["q1"],
    ["q1", "b"] => Set["q1"],
    ["q1", "c"] => Set["q0"]
  },
  :lam => {
    ["q0", "a"] => "ab",
    ["q1", "b"] => "",
    ["q1", "c"] => "c"
  }
} )
r.entrada = Fita_L.new

# AT_Mealy_Apl_reconhecimento
r.analisar_cadeia( w, grau )

