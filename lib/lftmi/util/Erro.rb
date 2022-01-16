module Lftmi
  module Erro
    def abortar( nome = "" )
      info = "??? #{self.class} não definiu a operação "
      + "\n#{nome} [#{__method__}]"
      puts info
      exit 0
    end
  end
end

