require "lftmi/c4/at_p/pilha/Pilha"

module Lftmi
  class Pilha_PE < Pilha
    # Pilha_PE_espaco_de_configuracoes
    def cfg_mover_para(cfg_i, nova_cfg)
      # Restauro a configuração "i"
      cfg_restaurar(cfg_i)
      # Interpreto a transição
      case nova_cfg[0]
      when :C
        i, q_cor, zT = nova_cfg
        push(zT)
      when :I
      when :R
        i, q_cor, zq = nova_cfg
        pop
      end
    end
  end
end
