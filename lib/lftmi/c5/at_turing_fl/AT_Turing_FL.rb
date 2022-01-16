require 'lftmi/c2/at/AT'
require 'lftmi/c5/at_turing_fl/fita_fl_le/Fita_TL_LE'
module Lftmi
  class AT_Turing_FL < AT
    # AT_Turing_FL_calcular_transicoes
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

    # AT_Turing_FL_calcular_trs
def calcular_trs( cfg_i, nova_cfg )
  # {override}
  cmds = []
  [ @mq, @entrada ].each do |c|
    cmds << [ c.method( :cfg_mover_para ), cfg_i, nova_cfg ]
  end
  cmds << [ self.method( :cfg_i_mostrar ) ]
  cmds
end

    # AT_Turing_FL_mover
def cfg_mover_para( i, n, cmdss )
  # Command::invoquer
  # {override}
  cfg_i = salvar_cfg
  cmdss.each do |cmds|
    cmds.each do |cmd|
      c, cfgT, nova_cfg = cmd
      c.call( cfgT, nova_cfg )
    end
    mover_automato( i + 1, n )
    cfg_restaurar( cfg_i ) unless cfg_i.nil?
  end
end

    # AT_Turing_FL_trs_calcular_possiveis
def trs_calcular_possiveis
  # {override}
  @mq.trs_calcular_possiveis( @entrada.ler )
end

    # AT_Turing_FL_cfg_final
def cfg_final?
  @mq.cfg_final?
end

  end
end

