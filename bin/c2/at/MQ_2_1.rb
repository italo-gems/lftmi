# <<fonte>> test/c2/mq/MQ_2_1.rb
require "lftmi/c2/mq/MQ"

class MQ_2_1 < Lftmi::MQ
  #--- MQ_2_1_interface_de_movimentacao
  # MQ_2_1_trs_possiveis::
  def trs_calcular_possiveis(s_i)
    # {override}
    # Estado "q_cor" contribui para a configuracao de calculo
    cfg_i = [q_cor, s_i]
    # Calculo o estado seguinte
    trs_i = Set[]
    delta.each do |cfg_t, q_seguinte|
      trs_i << q_seguinte if cfg_t == cfg_i
    end
    # Retorno o resultado calculado
    trs_i
  end

  # MQ_2_1_cfg_mover_para::
  def cfg_mover_para(cfg_i, q_seguinte)
    # {override}
    cfg_restaurar(cfg_i)
    @estrutura[:q_cor] = q_seguinte
  end

  # MQ_2_1_cfg_final::
  def cfg_final?
    # {override}
    fs.include?(q_cor)
  end
end
