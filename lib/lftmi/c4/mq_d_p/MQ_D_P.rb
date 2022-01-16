# <<fonte>> lftmi/c4/mq_d_p/MQ_D_P.rb
require "lftmi/c2/mq/MQ"

module Lftmi
  class MQ_D_P < MQ
    # MQ_D_P::
    def trs_calcular_possiveis(sT, zT)
      # {override}
      trs = Set[]
      delta.each do |rc, r_cfg|
        trs << r_cfg if rc == [q_cor, sT, zT]
      end
      trs
    end

    # MQ_D_P::
    def cfg_mover_para(cfg_i, nova_cfg)
      # Restauro a configuração "i"
      cfg_restaurar(cfg_i)
      # Interpreto a transição
      @estrutura[:q_cor] = nova_cfg[0]
    end
  end
end
