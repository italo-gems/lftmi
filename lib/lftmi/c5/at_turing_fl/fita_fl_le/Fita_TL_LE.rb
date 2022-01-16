# <<fonte>> lib/lftmi/c5/at_turing_fl/fita_fl_le/Fita_TL_LE
require 'lftmi/c2/at/fita_fl/Fita_L'
module Lftmi
  class Fita_TL_LE < Fita_L
    # Fita_TL_LE_comportamento_elementar
def escrever( s )
  @cadeia[ @cursor ] = s
end

def recuar
  @cursor -= 1 if @cadeia[ @cursor ] != "<"
end


    # Fita_TL_LE_espaco_de_configuracoes
  def cfg_mover_para( _, cfgT )
  # {override}
  escrever( cfgT[1])
  avancar if cfgT[2] == :D
  recuar if cfgT[2] == :E
end


  end
end

