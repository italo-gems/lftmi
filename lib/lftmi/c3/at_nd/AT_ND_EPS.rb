require 'lftmi/c2/at/fita_fl/Fita_L'
require 'lftmi/c3/at_nd/AT_ND_SV'
module Lftmi
class AT_ND_EPS < AT_ND_SV
  # AT_ND_EPS_remover_transicoes_em_vazio
  def remover_transicoes_em_vazio
    @mq.remover_transicoes_em_vazio( @mq.delta, @mq.fs )
  end

  # AT_ND_EPS_converter_para_MQ_D
def converter_para_MQ_D
  @mq.converter_para_MQ_D( @mq.delta )
end

end
end

