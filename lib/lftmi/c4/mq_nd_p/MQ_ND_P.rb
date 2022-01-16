# <<fonte>> lftmi/c3/apnd/MQ_ND_P.rb
require "lftmi/c2/mq/MQ"

module Lftmi
  class MQ_ND_P < MQ
    # MQ_ND_P_trs_calcular_possiveis
    def trs_calcular_possiveis(sT, zT)
      # {override}
      trs = Set[]
      delta.each do |cfgT, nova_cfg|
        trs << nova_cfg if cfgT == [q_cor, sT, zT]
        trs << nova_cfg if cfgT == [q_cor, "", zT]
      end
      trs
    end

    # MQ_ND_P_cfg_mover_para
    def cfg_mover_para(cfg_i, nova_cfg)
      # Restauro a configuração "i"
      cfg_restaurar(cfg_i)
      # Interpreto a transição
      novo_q, s, z = nova_cfg
      @estrutura[:q_cor] = novo_q
    end
  end
end
