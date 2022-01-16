# <<fonte>> bin/c4/ape/AT_ND_PE_Apl.rb
require "set"
require "04/mq_nd_pe/MQ_ND_PE"
require "lftmi/c4/at_nd_pe/AT_ND_PE"
require "util/Linha_de_Comando"
include Linha_de_Comando
w, grau = tratar(ARGV, "axb")

# AT_ND_PE_Apl_definicao
# Ex 4.49, p. 392
e = {
      ["q1", "x"] => "q2",
      ["q1", "a"] => "q3",
      ["q4", "b"] => "q2",
    }

at = AT_ND_PE.new
at.mq = MQ_ND_PE.new({
  :q0 => "q1",
  :fs => Set["q2"],
  :delta => e.merge(
    { ["q3"] => ["q1", ["q4"]],
        ["q2", "", "q4"] => "q4" }
  ),
  :pilha => [],
  :q_cor => "q1",
})
at.entrada = Fita_PE.new

# AT_ND_PE_Apl_reconhecimento
at.analisar_cadeia(w, grau)
