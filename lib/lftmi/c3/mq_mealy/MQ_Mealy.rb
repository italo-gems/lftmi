# <<fonte>> lftmi/c3/mq_mealy/MQ_Mealy.rb
require "lftmi/c3/mq_nd/MQ_ND_SV"

module Lftmi
  class MQ_Mealy < MQ_ND_SV
    def lam
      abortar("faltou definir ':lam'") if @estrutura[:lam].nil?
      @estrutura[:lam]
    end
  end
end
