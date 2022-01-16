# <<fonte>> lftmi/c2/bin/AT_2_1.rb
require "lftmi/c2/at/AT"
require "lftmi/c2/at/fita_fl/Fita_L"

class AT_2_1 < Lftmi::AT
  # AT_2_1_interface_de_instanciacao::
  def initialize(mqf)
    super(mqf)
    @entrada = Lftmi::Fita_L.new
  end

  # AT_2_1_interface_de_movimentacao::
  def cfg_final?
    # {override}
    @mq.cfg_final? && @entrada.cfg_final?
  end

  def trs_calcular_possiveis # {override}
    # {override}
    @mq.trs_calcular_possiveis(@entrada.ler)
  end

  def calcular_trs(cfg_i, q_seguinte)
    # {override}
    cmds = []
    [@mq, @entrada].each do |c|
      cmds << [c.method(:cfg_mover_para), cfg_i, q_seguinte]
    end
    #cmds << [self.method( :cfg_i_mostrar )]
    cmds
  end
end
