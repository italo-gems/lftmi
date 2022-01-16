# <<fonte>> lftmi/c4/at_d_p/AT_D_P.rb
require 'lftmi/c2/at/fita_fl/Fita_L'
require 'lftmi/c4/at_p/AP'
require 'lftmi/c4/at_p/pilha/Pilha'
require 'lftmi/c4/at_p/obs/Terminal_AP'
module Lftmi
  class AT_D_P < AP
      # AT_D_P_instanciacao
def initialize( mqf = nil )
    super( mqf )
    @pilha      = Pilha.new
    @obs        = [Terminal_AP.new]
end

  end
end

