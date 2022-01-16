# <<fonte>> lftmi/c4/ap/AP.rb
# <<fonte>> lftmi/c4/ap/AP.rb
require 'lftmi/c2/at/AT'
module Lftmi
  class AP < AT
    # AP_instanciacao
attr_reader :mq, :entrada, :pilha, :obs

    # AP::
def trs_calcular_possiveis
  # {override}
  @mq.trs_calcular_possiveis( @entrada.ler, @pilha.top )
end

    # AP::
def calcular_trs( cfgT, nova_cfg )
  cmds = []
  [ @mq, @entrada, @pilha ].each do |c|
    cmds << [c.method( :cfg_mover_para ), cfgT, nova_cfg ]
  end
  cmds << [self.method( :cfg_i_mostrar )]
  cmds
end

    # AP::
def cfg_0_def_com_entrada( w )
    super( w )
    @pilha.cfg_0_def
end

    # AP::
def cfg_final?
  @entrada.cfg_final? && @pilha.cfg_final?
end

    # AP_mecanismo_de_lembranca::
def salvar_cfg
  cfg = super
  cfg.merge( @pilha.salvar_cfg )
end
def cfg_restaurar( cfg )
  super( cfg )
  @pilha.cfg_restaurar( cfg )
end

  end
end

