# <<fonte>> bin/c5/mtfl/AT_Turing_FL_Apl.rb
require "set"
require "05/mq_turing_fl/MQ_Turing_FL"
require "lftmi/c5/at_turing_fl/AT_Turing_FL"
require "util/Linha_de_Comando"
include Linha_de_Comando
w, grau = tratar(ARGV, "aabbb")

# AT_Turing_FL_Apl_1_definicao
at = AT_Turing_FL.new
at.mq = MQ_Turing_FL.new({
  :q0 => "q0", :fs => Set["q2"],
  :delta => {
    ["q0", "a"] => Set[["q0", "a", :D]],
    ["q0", "b"] => Set[["q1", "b", :D]],
    ["q0", ">"] => Set[["q2", ">", :E]],
    ["q1", "b"] => Set[["q1", "b", :D]],
    ["q1", ">"] => Set[["q2", ">", :E]],
  },
  :q_cor => "q0",
})
at.entrada = Fita_TL_LE.new

# AT_Turing_FL_Apl_reconhecimento
at.analisar_cadeia(w, grau)
