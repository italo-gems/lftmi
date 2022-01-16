require "lftmi/c2/at/fita/Fita"

module Lftmi
  class Fita_TI_LE < Fita
    def initialize
      # {override}
      super
      @cadeia = "<B".chars
    end

    # Fita_TI_LE_comportamento_elementar
    def escrever(x)
      @cadeia << "B" if (@cursor + 1) == @cadeia.size && ler != "B"
      @cadeia[@cursor] = x
    end

    def avancar
      # {override}
      @cadeia << "B" if (@cursor + 1) == @cadeia.size
      @cursor += 1
    end

    def recuar
      @cursor -= 1 if @cadeia[@cursor] != "<"
    end

    def cfg_0_def_com_entrada(w)
      # {override}
      @cadeia = "<#{w}B".chars
      @cursor = 1
    end

    def cfg_mover_para(_, nova_cfg)
      # {override}
      escrever(nova_cfg[1])
      avancar if nova_cfg[2] == :D
      recuar if nova_cfg[2] == :E
    end
  end
end
