require 'lftmi/c4/at_p/AP'
require 'lftmi/c4/at_nd_pe/fita/Fita_PE'
require 'lftmi/c4/at_nd_pe/pilha/Pilha_PE'
require 'lftmi/c4/at_p/obs/Terminal_AP'
module Lftmi
class AT_ND_PE < AP
  # AT_ND_PE_instanciacao
def initialize( mqf = nil )
  super( mqf )
  @pilha = Pilha_PE.new
  @obs = [Terminal_AP.new]
end

end
end

