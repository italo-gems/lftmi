# <<fonte>> lftmi/c3/mq_d/MQ_D.rb
require 'lftmi/c2/mq/MQ'
module Lftmi
class MQ_D < MQ
  #--- MQ_D_interface_de_movimentacao
    # MQ_D_trs_calcular_possiveis
def trs_calcular_possiveis( sT )
  # {override}
  trs = Set[]
  delta.each do |cfgT, nova_cfg|
    trs << nova_cfg if cfgT == [q_cor, sT]
  end
  trs
end

    def cfg_mover_para( cfg_i, novo_q ) # {override}
  cfg_restaurar( cfg_i )
  @estrutura[ :q_cor ] = novo_q
end

    # MQ_D_cfg_final
def cfg_final? # {override}
  fs.include?( q_cor )
end

end
end

