# <<fonte>> lib/lftmi/c4/glc/Greibach.rb
require "lftmi/c4/llc/GreibachGrm"

module Lftmi
  class Greibach
    public

    # Greibach_instanciação
    def initialize
      @glc = GreibachGrm.new
    end

    attr_reader :substituicoes

    # Greibach_adicionar_producao
    def adicionar_producao(p)
      @glc.adicionar_producao(p)
    end

    # Greibach_pertence
    def pertence?(w)
      @substituicoes = calcularSubstituicoes(w)
      return true if @substituicoes.include?(w)
      false
    end

    # Greibach_calcularSubstituições
    def calcularSubstituicoes(w)
      @glc.calcularSubstituicoes(w)
    end

    # Greibach_mostrarSubstituições
    def mostrarSubstituicoes
      @substituicoes.inspect
    end
  end
end
