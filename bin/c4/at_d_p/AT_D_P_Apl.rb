# <<fonte>> bin/c3/afd/AT_D_P_Apl.rb
require "set"
require "04/mq_d_p/MQ_D_P"
require "04/at_d_p/AT_D_P"
require "util/Linha_de_Comando"
include Linha_de_Comando

w, grau = tratar(ARGV, "b")

at = AT_D_P.new
at.mq = MQ_D_P.new({
  :q0 => "q0", :fs => Set[],
  :delta => {
    ["q0", "a", "Z0"] => Set[["q0", ["Z0", "C", "C"]]],
    ["q0", "a", "C"] => Set[["q0", ["C", "C", "C"]]],
    ["q0", "b", "Z0"] => Set[["q1", ["Z0"]]],
    ["q0", "b", "C"] => Set[["q1", ["C"]]],
    ["q1", "c", "C"] => Set[["q1", []]],
    ["q1", "", "Z0"] => Set[["q1", []]],
  },
  :pilha => ["Z0"],
})
at.entrada = Fita_L.new

at.analisar_cadeia(w, grau)
