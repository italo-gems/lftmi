require "lftmi/c2/at/AT"
require "lftmi/c2/at/fita_fl/Fita_L"
require "lftmi/c3/mq_d/MQ_D"

module Lftmi
  class AT_D < AT
    #--- AT_D_interface_de_movimentacao
    # AT_D_calcular_transicoes_possiveis
    def trs_calcular_possiveis
      # {override}
      @mq.trs_calcular_possiveis(@entrada.ler)
    end

    # AT_D_cfg_final
    def cfg_final?
      # {override}
      @mq.cfg_final? && @entrada.cfg_final?
    end

    # AT_D_calcular_transicoes
    def calcular_transicoes(trs)
      # Builder::director
      cmds = []
      trs.each do |novo_q|
        cfg_i = salvar_cfg
        cmds += calcular_trs(cfg_i, novo_q)
      end
      cmds
    end

    # AT_D_calcular_trs
    def calcular_trs(cfg_i, novo_q)
      # {override}
      cmds = []
      [@mq, @entrada].each do |c|
        cmds << [c.method(:cfg_mover_para), cfg_i, novo_q]
      end
      cmds << [self.method(:cfg_i_mostrar)]
      cmds
    end
  end
end
