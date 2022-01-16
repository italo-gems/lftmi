# <<fonte>> lib/lftmi/c4/at_p/obs/Terminal_AP.rb
require "lftmi/c2/at/obs/Terminal_AT"

module Lftmi
  class Terminal_AP < Terminal_AT
    def cfg_i_mostrar(a) # {override}
      puts "(#{a.entrada.parte_alfa}, #{a.mq.q_cor}, #{a.entrada.parte_beta}, [#{a.pilha.conteudo.join(",")}>)"
    end
  end
end
