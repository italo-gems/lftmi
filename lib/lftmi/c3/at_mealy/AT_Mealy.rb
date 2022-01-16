# <<fonte>> lftmi/c3/mealy/AT_Mealy.rb
require "lftmi/c2/at/fita_fl/Fita_L"
require "lftmi/c3/at_nd/AT_ND_SV"
require "lftmi/c3/at_moore/obs/Terminal_AT_Moore"

module Lftmi
  class AT_Mealy < AT_ND_SV
    # AT_Mealy_instanciacao
    def initialize(mqf = nil)
      super(mqf)
      @obs = [Terminal_AT_Moore.new]
      @saida = ""
    end

    attr_reader :saida

    # AT_Mealy_cfg_0_def_com_entrada
    def cfg_0_def_com_entrada(w)
      super(w)
      @saida = @mq.estrutura[:lam][[@mq.q_cor, @entrada.ler]] if @entrada.ler != ">"
    end

    # AT_Mealy_mover
    def cfg_mover_para(i, n, cfg)
      # Command::invoquer
      m = salvar_cfg
      cfg.each do |cmds|
        cmds.each do |cmd|
          c, m, cfgT = cmd
          c.call(m, cfgT)
        end

        emitir(@mq.q_cor, @entrada.ler) if @entrada.ler != ">"

        mover_automato(i + 1, n)
        cfg_restaurar(m) unless m.nil?
      end
    end

    # AT_Mealy_emitir
    def emitir(q_cor, sT)
      @saida += @mq.estrutura[:lam][[q_cor, sT]]
    end
  end
end
