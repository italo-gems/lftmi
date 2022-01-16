# <<fonte>> lftmi/c4/ape/MQ_ND_PE.rb
require 'lftmi/c2/mq/MQ'
module Lftmi
  class MQ_ND_PE < MQ
      # MQ_ND_PE_trs_calcular_possiveis
def trs_calcular_possiveis( sT, zT )
  # {override}
  trs = Set[]
  delta.each do |cfgT, nova_cfg|
    qc, zc = cfgT
    case cfgT.size
    when 1 # chamada
      trs << [[:C, nova_cfg[0], nova_cfg[1]]] if cfgT == [q_cor]
    when 2 # interna
      trs << [[:I, nova_cfg]] if cfgT == [q_cor, sT]
    when 3 # retorno
      trs << [[:R, zT, [zT]]] if cfgT == [q_cor, "", zT]
    end
  end
  trs
end

      # MQ_ND_PE_cfg_mover_para
def cfg_mover_para( cfg_i, nova_cfg )
  # Restauro a configuração "i"
  cfg_restaurar( cfg_i )
  # Interpreto a transição
  case nova_cfg[0]
  when :C
    i, q_cor, zT = nova_cfg
    @estrutura[ :q_cor ] = q_cor
  when :I
    i, q_cor = nova_cfg
    @estrutura[ :q_cor ] = q_cor
  when :R
    i, q_cor, zq = nova_cfg
    @estrutura[ :q_cor ] = q_cor
  end
end

  end
end

