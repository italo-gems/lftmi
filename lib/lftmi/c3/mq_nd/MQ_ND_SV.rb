# <<fonte>> lftmi/c3/afnd/MQ_ND_SV.rb
require 'lftmi/c2/mq/MQ'
module Lftmi
  class MQ_ND_SV < MQ
    # MQ_ND_SV_trs_calcular_possiveis
def trs_calcular_possiveis( sT )
  # {override}
  trs = Set[]
  delta.each do |rc, r_cfg|
    trs << r_cfg if rc == [q_cor, sT]
  end
  trs
end

    # MQ_ND_SV_cfg_final
def cfg_final?
  # {override}
  fs.include?( q_cor )
end

    # MQ_ND_SV_mover
def cfg_mover_para( cfg_i, novo_q )
  cfg_restaurar( cfg_i )
  @estrutura[ :q_cor ] = novo_q
end

    # MQ_ND_SV_converter_para_MQ_D
def converter_para_MQ_D( d )
  delta = {}
  novos = Set.new
  alfa = Set.new
  # Crio os estados unitarios
  d.each do |c, r|
    p, a = c
    alfa << a
    delta[[Set[p], a]] = r
    novos << r if r.size > 1
  end
  # Acrescento novas transições
  alfa.each do |a|
    novos.each do |r|
      delta[[r, a]] = Set.new
      r.each do |q|
          delta[[r, a]] += d[[q, a]] unless d[[q, a]].nil?
      end
    end
  end
  @estrutura[ :delta ] = delta
  @estrutura[ :q0 ] = Set[@estrutura[ :q0 ]]
  # Retorno a estrutura transformada
  @estrutura
end

  end
end

