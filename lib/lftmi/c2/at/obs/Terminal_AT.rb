# <<fonte>> lib/lftmi/c2/at/obs/Terminal_AT.rb
module Lftmi
  class Terminal_AT
    #--- Terminal_AT_interface_de_movimentacao
      def cfg_i_mostrar( at )
  alfa = at.entrada.parte_alfa
  beta = at.entrada.parte_beta
  puts "(#{alfa}, #{at.mq.q_cor}, #{beta})"
end

      def trs_mostrar( at )
  puts "\t#{at.trs_calcular_possiveis}"
end

      # Terminal_AT_veredictor
def veredicto( _at, reconheceu )
  if reconheceu
    puts "\tSUCESSO"
  else
    puts "\tFRACASSO"
  end
end

  end
end

