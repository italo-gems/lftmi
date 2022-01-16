require "lftmi/c2/mq/MQ"

module Lftmi
  class MQ_AA < MQ
    # MQ_AA_acrescentar_subjacente
    def acrescentar(a)
      @subjacente = a
    end

    attr_accessor :subjacente

    # MQ_AA_mover
    def cfg_mover_para(m, cfgT)
      @subjacente.cfg_mover_para(m, cfgT)
      # Aplicar faa...
      @estrutura[:fas][@faa].(self, @faa_s) unless @faa.nil?
    end

    # MQ_AA_trs_calcular_possiveis
    def trs_calcular_possiveis(sT)
      # {override}
      @faa = nil
      @faa_s = sT
      delta.each do |rc, r_cfg|
        next unless rc == [q_cor, sT]
        fab, faa = r_cfg
        @estrutura[:fas][fab].call(@subjacente)
        @faa = faa
      end
      @subjacente.trs_calcular_possiveis(sT)
    end

    def remover(cfgT)
      q_cor, sT = cfgT
      @subjacente.estrutura[:delta].delete([q_cor, sT])
    end

    def alterar(cfgT, q)
      q_cor, sT = cfgT
      @subjacente.estrutura[:delta][[q_cor, sT]] = Set[q]
    end

    # MQ_AA_estrutura_basica
    def fs
      @subjacente.fs
    end

    # MQ_AA_estado_corrente
    def q_cor
      @subjacente.q_cor
    end

    # MQ_AA_cfg_0_def
    def cfg_0_def
      @subjacente.cfg_0_def
    end

    # MQ_AA_cfg_final
    def cfg_final?
      @subjacente.cfg_final?
    end

    # MQ_AA_cfg_i_lembranca
    def salvar_cfg
      @subjacente.salvar_cfg
    end

    def cfg_restaurar(cfg)
      @subjacente.cfg_restaurar(cfg)
    end
  end
end
