# <<fonte>> lib/lftmi/c4/at_p/Pilha.rb
module Lftmi
  class Pilha
    # Pilha::
    def initialize
      @conteudo = ["Z0"]
    end

    attr_reader :conteudo

    # Pilha_comportamento_elementar
    # Pilha::
    def top
      @conteudo[-1]
    end

    # Pilha::
    def pop
      @conteudo.pop
    end

    # Pilha::
    def push(x)
      @conteudo += x
    end

    # Pilha::
    def empty?
      @conteudo.top == "Z0"
    end

    # Pilha_espaco_de_configuracoes
    # Pilha::
    def cfg_0_def
      @conteudo = ["Z0"]
    end

    # Pilha::
    def cfg_mover_para(cfg_i, nova_cfg)
      # Restauro a configuração "i"
      cfg_restaurar(cfg_i)
      # Interpreto a transição
      pop
      push(nova_cfg[1])
    end

    # Pilha::
    def salvar_cfg
      { :conteudo => @conteudo + [] }
    end

    def cfg_restaurar(m)
      @conteudo = m[:conteudo]
    end

    # Pilha::
    def cfg_final?
      top == "Z0"
    end
  end
end
