# <<fonte>> lib/lftmi/c2/at/fita/Fita.rb::
module Lftmi
  class Fita # {abstract}
    # Fita_interface_de_instanciacao::
    def initialize
      @cursor = 1
    end

    attr_reader :cadeia, :cursor

    #--- Fita_interface_de_movimentacao
    # Operacoes abstratas
    # Fita_cfg_final::
    def cfg_final? # {abstract}
      abortar("cfg_final?")
    end

    # Fita_avancar::
    def avancar # {abstract}
      abortar("avancar")
    end

    # Operacoes concretas
    # Fita_ler::
    def ler
      @cadeia[@cursor]
    end

    # Fita_cfg_mover_para::
    def cfg_mover_para(_cfg_i, nova_cfg)
      avancar if nova_cfg != ""
    end

    # Fita_interface_complementar
    # Fita_cfg_0_def_com_entrada::
    def cfg_0_def_com_entrada(_w)
      # {abstract}
      abortar("cfg_0_def_com_entrada")
    end

    # Fita_cfg_i_lembranca::
    def salvar_cfg
      { :cursor => @cursor }
    end

    def cfg_restaurar(cfg_i)
      @cursor = cfg_i[:cursor]
    end

    # Fita_parte_alfa::
    def parte_alfa
      @cadeia[0..(@cursor - 1)]
    end

    # Fita_parte_beta::
    def parte_beta
      n = @cadeia.size
      @cadeia[@cursor..(n - 1)]
    end
  end
end
