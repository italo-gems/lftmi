# <<fonte>> bin/c3/moore/AT_Moore_Apl.rb
require 'set'
require '03/mq_moore/MQ_Moore'
require 'lftmi/c3/at_moore/AT_Moore'
require 'util/Linha_de_Comando'
include Linha_de_Comando
w, grau = tratar( ARGV, "abbcabbbcab" )

# AT_Moore_Trad_Apl_1_definicao
### Ambiente de execucao
# ex_3_13
r = Lftmi::AT_Moore.new
r.mq = Lftmi::MQ_Moore.new( {
  :q0 => "q0", :fs => Set["q1"],
  :delta => {
    ["q0", "a"] => Set["q1"],
    ["q1", "b"] => Set["q1"],
    ["q1", "c"] => Set["q0"]
  },
  :lam => {
    "q0" => "1",
    "q1" => ""
  }
} )
r.entrada = Fita_L.new
# AT_Moore_Trad_Apl_reconhecimento
r.analisar_cadeia( w, grau )

