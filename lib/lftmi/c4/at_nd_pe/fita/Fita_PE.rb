require "lftmi/c2/at/fita_fl/Fita_L"

module Lftmi
  class Fita_PE < Fita_L
    # Fita_PE_espaco_de_configuracoes
    def cfg_mover_para(cfg_i, nova_cfg)
      # Restauro a configuração "i"
      cfg_restaurar(cfg_i)
      # Interpreto a transição
      case nova_cfg[0]
      when :C
      when :I
        avancar
      when :R
      end
    end
  end
end
