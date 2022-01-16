# <<fonte>> lib/lftmi/c2/mq/MQ.rb::
require "lftmi/util/Erro"

module Lftmi
  class MQ
    # {abstract}
    include Erro
    #--- MQ_interface_de_instanciacao
    # MQ_metodo_de_instanciacao::
    def initialize(e) # metodo de construção
      @estrutura = e
    end

    attr_reader :estrutura # funcao de leitura

    # MQ_estrutura_elementar {abstract}
    def q0
      abortar("q0") if @estrutura[:q0].nil?
      @estrutura[:q0]
    end

    def fs
      abortar("fs") if @estrutura[:fs].nil?
      @estrutura[:fs]
    end

    def delta
      abortar("delta") if @estrutura[:delta].nil?
      @estrutura[:delta]
    end

    # MQ_interface_de_movimentacao
    def trs_calcular_possiveis
      # {abstract}
      abortar("trs_calcular_possiveis")
    end

    def cfg_mover_para(_cfg_i, _q_seguinte)
      # {abstract}
      abortar("cfg_mover_para")
    end

    def cfg_final?
      # {abstract}
      abortar("cfg_final?")
    end

    # MQ_interface_complementar
    # MQ_cfg_0_def::
    def cfg_0_def
      @estrutura[:q_cor] = @estrutura[:q0]
    end

    # MQ_estado_corrente::
    def q_cor
      @estrutura[:q_cor]
    end

    # MQ_cfg_i_lembranca::
    def salvar_cfg
      { :q_cor => @estrutura[:q_cor] }
    end

    def cfg_restaurar(cfg_i)
      @estrutura[:q_cor] = cfg_i[:q_cor]
    end
  end
end
