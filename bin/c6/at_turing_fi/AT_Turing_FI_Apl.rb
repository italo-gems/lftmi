# <<fonte>> bin/c6/mtfi/AT_Turing_FI_Apl.rb
require "set"
require "05/mq_turing_fl/MQ_Turing_FL"
require "lftmi/c6/at_turing_fi/AT_Turing_FI"
require "util/Linha_de_Comando"
include Linha_de_Comando
w, grau = tratar(ARGV, "abc")

# AT_Turing_FI_Apl_1_definicao
# Ex 6.2, p. 555
r = AT_Turing_FI.new
r.mq = MQ_Turing_FL.new({
  :q0 => "q0",
  :fs => Set["q0"],
  :delta => {
    ["q0", "a"] => Set[["q1", "X", :D]],
    ["q1", "a"] => Set[["q1", "a", :D]],
    ["q1", "b"] => Set[["q1", "b", :D]],
    ["q1", "X"] => Set[["q2", "X", :E]],
    ["q1", "B"] => Set[["q2", "B", :E]],
    ["q1", "Y"] => Set[["q2", "Y", :E]],
    ["q2", "a"] => Set[["q3", "X", :E]],
    ["q3", "a"] => Set[["q3", "a", :E]],
    ["q3", "b"] => Set[["q3", "b", :E]],
    ["q3", "X"] => Set[["q0", "X", :D]],

    ["q0", "b"] => Set[["q4", "Y", :D]],
    ["q4", "a"] => Set[["q4", "a", :D]],
    ["q4", "b"] => Set[["q4", "b", :D]],
    ["q4", "X"] => Set[["q5", "X", :E]],
    ["q4", "B"] => Set[["q5", "B", :E]],
    ["q4", "Y"] => Set[["q5", "Y", :E]],
    ["q5", "b"] => Set[["q6", "Y", :E]],
    ["q6", "a"] => Set[["q6", "a", :E]],
    ["q6", "b"] => Set[["q6", "b", :E]],
    ["q6", "Y"] => Set[["q0", "Y", :D]],
  },
  :q_cor => "q0",
})
r.entrada = Fita_TI_LE.new

# AT_Turing_FI_Apl_reconhecimento
r.analisar_cadeia(w, grau)
