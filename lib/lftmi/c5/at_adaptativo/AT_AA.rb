require 'lftmi/c2/at/AT'
require 'lftmi/c2/at/fita_fl/Fita_L'
require 'lftmi/c5/mq_adaptativa/MQ_AA'
module Lftmi
  class AT_AA < AT
    # AT_AA_calcular_transicoes
def calcular_transicoes( trs )
  # Builder::director
  cmds = []
  trs.each do |r|
    cfg_i = salvar_cfg
    r.each do |nova_cfg|
      cmds << calcular_trs( cfg_i, nova_cfg )
    end
  end
  cmds
end

    # AT_AA_calcular_trs
def calcular_trs( m, cfgT )
  # {override}
  cmds = []
  [ @mq, @entrada ].each do |c|
    cmds << [c.method( :cfg_mover_para ), m, cfgT ]
  end
  cmds << [ self.method( :cfg_i_mostrar ) ]
  cmds
end

    # AT_AA_mover
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

    # AT_AA_trs_calcular_possiveis
def trs_calcular_possiveis
  # {override}
  @mq.trs_calcular_possiveis( @entrada.ler )
end

    # AT_AA_cfg_final
def cfg_final?
  @mq.cfg_final?
end

  end
end

