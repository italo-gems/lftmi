# <<fonte>>
require "lftmi/c6/at_turing_fi/AT_Turing_FI"
require "lftmi/c6/at_turing_fi/fita_fi_le/Fita_TI_LE"

module Lftmi
  class AT_Turing_Uni < Lftmi::AT_Turing_FI
    # AT_Turing_Uni_codificar_delta
    def codificar
      @mq.codificar
    end
  end
end
