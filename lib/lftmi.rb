# frozen_string_literal: true

require_relative "lftmi/version"
require_relative "lftmi/util/Erro"
require_relative "lftmi/util/Linha_de_Comando"
require_relative "lftmi/c2/at/AT"
require_relative "lftmi/c2/mq/MQ"
require_relative "lftmi/c3/mq_d/MQ_D"
require_relative "lftmi/c3/at_d/AT_D"
require_relative "lftmi/c3/at_nd/AT_ND_SV"
require_relative "lftmi/c3/at_nd/AT_ND_EPS"
require_relative "lftmi/c3/mq_moore/MQ_Moore"
require_relative "lftmi/c3/at_moore/AT_Moore"
require_relative "lftmi/c3/mq_mealy/MQ_Mealy"
require_relative "lftmi/c3/at_mealy/AT_Mealy"

require_relative "lftmi/c4/glc/GLC"
require_relative "lftmi/c4/llc/Greibach"
require_relative "lftmi/c4/mq_d_p/MQ_D_P"
require_relative "lftmi/c4/at_d_p/AT_D_P"
require_relative "lftmi/c4/mq_nd_p/MQ_ND_P"
require_relative "lftmi/c4/at_nd_p/AT_ND_P"
require_relative "lftmi/c4/mq_nd_pe/MQ_ND_PE"
require_relative "lftmi/c4/at_nd_pe/AT_ND_PE"
require_relative "lftmi/c5/gsc/GSC"
require_relative "lftmi/c5/mq_turing_fl/MQ_Turing_FL"
require_relative "lftmi/c5/at_turing_fl/AT_Turing_FL"
require_relative "lftmi/c5/at_adaptativo/AT_AA"
require_relative "lftmi/c6/at_turing_fi/AT_Turing_FI"
require_relative "lftmi/c7/mq_turing_uni/MQ_Turing_Uni"
require_relative "lftmi/c7/at_turing_uni/AT_Turing_Uni"

module Lftmi
  class Error < StandardError; end

  # Your code goes here...
end
