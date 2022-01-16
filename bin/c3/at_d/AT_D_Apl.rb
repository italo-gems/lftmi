# <<fonte>> bin/c3/afd/AFD_Apl.rb
require "set"
require "util/Linha_de_Comando"
require "03/mq_d/MQ_D"
require "03/at_d/AT_D"
include Linha_de_Comando

w, grau = tratar(ARGV, "00001")

atd = AT_D.new(MQ_D.new({
  q0: "q0", fs: Set["q1", "q2"],
  delta: {
    ["q0", "0"] => "q0", ["q0", "1"] => "q1", ["q0", "2"] => "q3",
    ["q1", "0"] => "q3", ["q1", "1"] => "q1", ["q1", "2"] => "q2",
    ["q2", "0"] => "q3", ["q2", "1"] => "q3", ["q2", "2"] => "q2",
    ["q3", "0"] => "q3", ["q3", "1"] => "q3", ["q3", "2"] => "q3",
  },
}))

atd.analisar_cadeia(w, grau)
