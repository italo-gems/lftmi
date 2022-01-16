require 'lftmi/c2/at/fita_fl/Fita_L'
require 'lftmi/c4/at_p/AP'
require 'lftmi/c4/at_p/pilha/Pilha'
require 'lftmi/c4/at_p/obs/Terminal_AP'
module Lftmi
  class AT_ND_P < AP
    #--- AT_ND_P_interface_de_instanciacao
      # AT_ND_P_instanciacao
def initialize( mqf = nil )
  super( mqf )
  @pilha    = Pilha.new
  @obs      = [Terminal_AP.new]
end

    #--- AT_ND_P_interface_de_movimentacao
      # AT_ND_P_calcular_transicoes
def calcular_transicoes( trs_comandos_possiveis )
  # Builder::director
  cmds = []
  trs_comandos_possiveis.each do |cfgs|
    cfgT = salvar_cfg
    cfgs.each do |nova_cfg|
      cmds << calcular_trs( cfgT, nova_cfg )
    end
  end
  cmds
end

      # AT_ND_P_mover
def cfg_mover_para( i, n, cmdss )
  # Command::invoquer
  # {override}
  m = salvar_cfg
  cmdss.each do |cmds|
    cmds.each do |cmd|
      c, cfgT, nova_cfg = cmd
      c.call( cfgT, nova_cfg )
    end
    mover_automato( i + 1, n )
    cfg_restaurar( m ) unless m.nil?
  end
end

  end
end

