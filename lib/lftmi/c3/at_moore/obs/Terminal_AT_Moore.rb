# <<fonte>> lftmi/c3/apnd/Terminal_AT_Moore.rb
require 'lftmi/c2/at/obs/Terminal_AT'
module Lftmi
  class Terminal_AT_Moore < Terminal_AT
    def veredicto( a, reconheceu )
      # {override}
      super( a, reconheceu )
      puts "\tSaida = #{a.saida}" if reconheceu
    end
  end
end

