# <<fonte>> lib/lftmi/c2/af/AT.rb
require "lftmi/c2/mq/MQ"
require "lftmi/c2/at/obs/Terminal_AT"
require 'lftmi/util/Erro'
module Lftmi
  class AT < MQ
    include Erro
    #--- AT_interface_de_instanciacao
# Mecanismo "Decorador::decorador"
def initialize( mqf = nil )
  @mq = mqf
  @entrada = nil
  @obs = [ Terminal_AT.new ]
  @grau = 0
end
attr_accessor :mq, :entrada

    #--- AT_interface_de_movimentacao
  # Operacoes abstratas
    # AT_cfg_final::
def cfg_final?
  # {abstract}
  abortar("cfg_final")
end

    # AT_trs_calcular_possiveis::
def trs_calcular_possiveis
  # {abstract}
  abortar("trs_calcular_possiveis")
end

    # AT_trs_comandos::
def calcular_trs
  # {abstract}
  abortar("calcular_trs")
end


  # Operacoes proprias
    # AT_analisar_cadeia::
def analisar_cadeia( w, grau = 0 )
  # {public}
  if @mq.nil?
    puts( "Faltou a definição da maquina do automato" )
    exit(1)
  end
  if @entrada.nil?
    puts( "Faltou a definição da entrada do automato" )
    exit(1)
  end
  @grau = grau # de detalhe das informações do terminal
  # Logica de controle principal
  cfg_0_def_com_entrada( w )
  cfg_i_mostrar
  mover_automato( 1, 50 ) # limite de passos sequenciais
end

    # AT_mover_automato::
def mover_automato( i, n )
  return if i == n
  trs = trs_calcular_possiveis
  if trs.empty?
    veredicto( true ) if cfg_final?
    veredicto( false ) unless cfg_final?
    return
  end
  cmds = calcular_transicoes( trs )
  cfg_mover_para( i, n, cmds )
end

    # AT_calcular_transicoes::
def calcular_transicoes( cfg_s )
  # Builder::director
  cmds = []
  cfg_s.each do |trs|
    cfgT = salvar_cfg
    trs.each do |nova_cfg|
      cmds += calcular_trs( cfgT, nova_cfg )
    end
  end
  cmds
end

    # AT_mover::
def cfg_mover_para( i, n, cmds )
  # Command::invoquer
  cmds.each do |cmd|
    c, m, cfgT = cmd
    c.call( m, cfgT )
  end
  mover_automato( i + 1, n )
end


    #--- AT_interface_complementar
  # AT_veredicto::
def veredicto( reconheceu )
  @obs.each { |o| o.veredicto( self, reconheceu ) }
end

  # AT_cfg_0_def_com_entrada::
def cfg_0_def_com_entrada( w )
  @mq.cfg_0_def
  @entrada.cfg_0_def_com_entrada( w )
end

  # AT_cfg_i::
def cfg_i
  [ @mq.q_cor, @entrada.ler ]
end

  # AT_cfg_i_mostrar::
def cfg_i_mostrar( ... )
  @obs.each { |x| x.cfg_i_mostrar( self ) } if @grau
  @obs.each { |x| x.trs_mostrar( self ) } if @grau >= 1
end

  # AT_cfg_i_lembranca::
def salvar_cfg
  cfg = @mq.salvar_cfg
  cfg.merge( @entrada.salvar_cfg )
end

def cfg_restaurar( cfg )
  @mq.cfg_restaurar( cfg )
  @entrada.cfg_restaurar( cfg )
end


  end
end

