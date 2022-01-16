# <<fonte>> bin/lftmi/c3/at_nd/AT_ND_SV_Apl.rb
require "set"
require "lftmi/c3/mq_nd/MQ_ND_EPS"
require "lftmi/c3/at_nd/AT_ND_EPS"
require "util/Linha_de_Comando"
include Linha_de_Comando
w, grau = tratar(ARGV, "ab")

# AT_ND_SV_Rec_Apl_1_definicao
# ex_3_13
r = AT_ND_EPS.new
r.mq = MQ_ND_EPS.new({
  :q0 => 0,
  :fs => Set[1],
  :delta => {
    [0, "a"] => Set[0],
    [0, ""] => Set[1],
    [1, "b"] => Set[1],
  },
})
r.entrada = Fita_L.new

# AT_ND_SV_Rec_Apl_reconhecimento
#  pp r.remover_transicoes_em_vazio
#  pp r.converter_para_MQ_D
r.analisar_cadeia(w, grau)
