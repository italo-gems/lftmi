# <<fonte>> lftmi/c5/mtfl/MQ_Turing_FL.rb
require 'lftmi/c3/mq_nd/MQ_ND_EPS'
module Lftmi
  class MQ_Turing_FL < MQ_ND_EPS
    # MQ_Turing_FL_mover
def cfg_mover_para( cfg_i, nova_cfg )
  # Restauro a configuração "i"
  cfg_restaurar( cfg_i )
  # Interpreto a transição
  q_i, s_i, c_i = nova_cfg
  @estrutura[ :q_cor ] = q_i
end

  end
end

