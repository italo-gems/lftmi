# <<fonte>> lib/lftmi/c4/llc/GreibachGrm.rb
require "set"
require "lftmi/c4/glc/GLC"

module Lftmi
  class GreibachGrm < GLC
    # GreibachGrm_calcularSubstituicoes
    def calcularSubstituicoes(w)
      substituicoes = @producoes["S"]
      # GreibachGrm_calculoDerivacoes
      n = w.length
      (1..(n - 1)).each do |i|
        formasSeguintes = Set[]
        substituicoes.each do |formaSentencial|
          formasDeW = aplicarProducoesEm(formaSentencial, formaSentencial[i, 1])
          formasSeguintes |= formasDeW
        end
        substituicoes = formasSeguintes
      end

      substituicoes
    end

    # GreibachGrm_aplicarProducoesEm
    def aplicarProducoesEm(w, le)
      return Set[] if @producoes[le].nil?
      lds = @producoes[le]
      calcular_formas_de(w, [le, lds])
    end

    # GreibachGrm_calcularM
    def calcularM
      k = Set[]
      @producoes.each do |_, ld|
        k << ld.size
      end
      k.sort!
      k.last
    end
  end
end
