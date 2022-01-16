# <<fonte>> bin/c2/af/AT_2_1_Apl.rb
require "set"
require "bin/lftmi/c2/mq/MQ_2_1"
require "bin/lftmi/c2/at/AT_2_1"
require "lib/util/Linha_de_Comando"
include Linha_de_Comando

w, grau = tratar(ARGV, "a")
r = AT_2_1.new(MQ_2_1.new({
  q0: "1",
  fs: Set["2"],
  delta: { ["1", "a"] => "2" },
}))
r.analisar_cadeia(w, grau)
