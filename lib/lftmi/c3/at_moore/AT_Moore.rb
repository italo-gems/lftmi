# <<fonte>> lib/03/moore/AT_Moore.rb
require "lftmi/c2/at/fita_fl/Fita_L"
require "lftmi/c3/at_nd/AT_ND_SV"
require "lftmi/c3/at_moore/obs/Terminal_AT_Moore"

module Lftmi
  class AT_Moore < Lftmi::AT_ND_SV
    # AT_Moore_construir::
    def initialize(mq = nil)
      super(mq)
      @obs = [Lftmi::Terminal_AT_Moore.new]
      @saida = ""
    end

    attr_reader :saida

    # AT_Moore_cfg_0_def_com_entrada
    def cfg_0_def_com_entrada(w)
      super(w)
      @saida = @mq.lam[@mq.q_cor]
    end

    # AT_Moore_mover
    def cfg_mover_para(i, n, cfg)
      # Command::invoquer
      m = salvar_cfg
      cfg.each do |cmds|
        cmds.each do |cmd|
          c, m, cfgT = cmd
          c.call(m, cfgT)
        end

        emitir(@mq.q_cor)

        mover_automato(i + 1, n)
        cfg_restaurar(m) unless m.nil?
      end
    end

    # AT_Moore_emitir
    def emitir(q_cor)
      @saida += @mq.estrutura[:lam][q_cor]
    end
  end
end
