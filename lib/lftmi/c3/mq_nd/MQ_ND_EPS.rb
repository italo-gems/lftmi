# <<fonte>> lftmi/c3/afnd/MQ_ND_EPS.rb
require 'lftmi/c3/mq_nd/MQ_ND_SV'
module Lftmi
  class MQ_ND_EPS < MQ_ND_SV
    # MQ_ND_EPS_trs_calcular_possiveis
def trs_calcular_possiveis( sT )
  # {override}
  trs = Set[]
  delta.each do |rc, r_cfg|
    trs << r_cfg if rc == [q_cor, sT]
    trs << r_cfg if rc == [q_cor, ""]
  end
  trs
end

    # MQ_ND_EPS_remover_transicoes_em_vazio
def remover_transicoes_em_vazio( delta, fs )
  # algoritmo 3.5, p. 177
  # Calculo o alfabeto de entrada
  alfa = Set.new
  delta.each do |c, _|
    p, a = c
    alfa << a if a != ""
  end
  # Removo as transições em vazio
  novaD = {}
  delta.each do |c, r|
    p, a = c
    if a == ""
      alfa.each do |s|
        novaD[ [p, s] ] = r if novaD[ [p, s] ].nil?
        novaD[ [p, s] ] += r unless novaD[ [p, s] ].nil?
      end
      fs << p unless (r | fs).empty?
    else
      novaD[ c ] = r
    end
  end
  novaD
end

    def converter_para_MQ_D( delta )
  d = remover_transicoes_em_vazio( delta, fs )
  super( d )
end

  end
end

