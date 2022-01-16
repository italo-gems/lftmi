# <<fonte>> lib/lftmi/c2/fita/Fita_L.rb
require "lftmi/c2/at/fita/Fita"

module Lftmi
  class Fita_L < Fita
    #--- Fita_L_interface_de_instanciacao::
    def initialize
      super # logica do ancestral que posiciona cursor
      @cadeia = "<>".chars
    end

    #--- Fita_L_interface_de_movimentacao
    # Fita_L_avancar::
    def avancar
      @cursor += 1 if @cadeia[@cursor] != ">"
    end

    # Fita_L_cfg_final::
    def cfg_final?
      ler == ">"
    end

    #--- Fita_L_interface_complementar
    def cfg_0_def_com_entrada(w) # {override}
      @cadeia = "<#{w}>"
      @cursor = 1
    end
  end
end
