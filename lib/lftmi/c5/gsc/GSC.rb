# <<fonte>> lftmi/c5/gsc/GSC.rb
require "lftmi/c4/glc/GLC"

module Lftmi
  class GSC < GLC
    def calcular_formas_de(w, producoes)
      le, lds = producoes
      # Derivações de cada ocorrência do lado esquerdo em w
      wMarcado = w.dup
      formas_marcadas = Set[]
      k = w.size - 1
      (0..k).each do |i|
        m = wMarcado.match(le)
        unless m.nil?
          p = m.pre_match # <--
          s = m.post_match # <--
          lds.each do |ld|
            formas_marcadas << (p + ld + s)
          end
        end
        wMarcado[i] = "-"
      end
      # Remoção do marcador '-'
      formas_de_w = Set[]
      formas_marcadas.each do |f|
        k = f.size - 1
        forma_final = ""
        (0..k).each do |i|
          forma_final += f[i] if f[i] != "-"
          forma_final += w[i] if f[i] == "-"
        end
        formas_de_w << forma_final
      end
      formas_de_w
    end
  end
end
