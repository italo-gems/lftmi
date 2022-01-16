# <<fonte>> lib/lftmi/c4/glc/GLC.rb
require "set"

module Lftmi
  class GLC
    # GLC_interface_instanciacao
    # GLC_construtor::
    def initialize
      # {public}
      @producoes = Set[]
    end

    attr_reader :producoes

    # GLC_interface_configuracao
    # GLC_adicionar_producao
    def adicionar_producao(p)
      # {public}
      @producoes.merge(p)
    end

    # GLC_derivacao

    public

    # GLC_derivar
    def derivar(forma_inicial, n, f = false)
      # {public}
      formasSentenciais = Set[forma_inicial]
      derivacoes = Set[]
      (1..n).each do
        formasSeguintes = Set[]
        formasSentenciais.each do |w|
          formas_de_w = aplicar_producoes_em(w)
          derivacoes.merge(w => formas_de_w)
          formasSeguintes |= formas_de_w
        end
        formasSentenciais = formasSeguintes
      end
      derivacoes_filtrar(derivacoes, f)
    end

    private

    # GLC_aplicar_producoes_em
    def aplicar_producoes_em(w) # {private}
      formas_de_w = Set[]
      @producoes.each do |le, lds|
        formas_de_w |= calcular_formas_de(w, [le, lds])
      end
      formas_de_w
    end

    # GLC_calcular_formas_de
    def calcular_formas_de(w, regra) # {private}
      le, lds = regra
      # Derivacoes de cada ocorrencia do lado esquerdo em w
      sentinela = w.gsub(le, "-")
      formas_marcadas = Set[]
      while w != sentinela
        lds.each { |ld| formas_marcadas << w.sub(le, ld) }
        w = w.sub(le, "-")
      end
      # Remocao do marcador '-'
      formas_de_w = Set[]
      formas_marcadas.each { |f| formas_de_w << f.gsub("-", le) }
      formas_de_w
    end

    def derivacoes_filtrar(formas, mostrar_sentencas)
      # {private}
      if mostrar_sentencas
        sentencas = Set[]
        formas.each do |forma|
          forma.each do |w, substituicoes|
            sentencas << w if substituicoes == Set[]
          end
        end
        sentencas
      else
        formas
      end
    end
  end
end
