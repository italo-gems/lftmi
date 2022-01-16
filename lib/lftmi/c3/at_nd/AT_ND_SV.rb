# <<fonte>> lib/lftmi/c3/at_nd/AT_ND_SV.rb
require 'lftmi/c2/at/AT'
require 'lftmi/c2/at/fita_fl/Fita_L'
module Lftmi
  class AT_ND_SV < Lftmi::AT
    # AT_ND_SV_trs_calcular_possiveis
def trs_calcular_possiveis
  # {override}
  @mq.trs_calcular_possiveis( @entrada.ler )
end

    # AT_ND_SV_cfg_final
def cfg_final?
  # {override}
  @mq.cfg_final? && @entrada.cfg_final?
end

    # AT_ND_SV_calcular_transicoes
def calcular_transicoes( trs )
  # Construtor::diretor
  cmds = []
  trs.each do |cfgs|
    cfg_i = salvar_cfg
    cfgs.each do |nova_cfg|
      cmds << calcular_trs( cfg_i, nova_cfg )
    end
  end
  cmds
end

    # AT_ND_SV_calcular_trs
def calcular_trs( cfg_i, nova_cfg )
  # {override}
  cmds = []
  [ @mq, @entrada ].each do |c|
    cmds << [ c.method( :cfg_mover_para ), cfg_i, nova_cfg ]
  end
  cmds << [ self.method( :cfg_i_mostrar ) ]
  cmds
end

    # AT_ND_SV_mover
def cfg_mover_para( i, n, cmdss )
  # Comando::invocador
  # {override}
  cfg_i = salvar_cfg
  cmdss.each do |cmds|
    cmds.each do |cmd|
      c, cfgT, nova_cfg = cmd
      c.call( cfgT, nova_cfg )
    end
    mover_automato( i + 1, n ) # chamada recursiva
    cfg_restaurar( cfg_i ) unless cfg_i.nil?
  end
end

    # AT_ND_SV_converter_para_MQ_D
def converter_para_MQ_D
  @mq.converter_para_MQ_D( @mq.delta )
end

  end
end

