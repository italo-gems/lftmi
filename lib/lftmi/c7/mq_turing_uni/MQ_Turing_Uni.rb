# <<fonte>> lib/lftmi/c7/mtu/MQ_Turing_Uni.rb
require "lftmi/c5/mq_turing_fl/MQ_Turing_FL"

module Lftmi
  class MQ_Turing_Uni < Lftmi::MQ_Turing_FL
    def cod_q(i)
      return "a" * (2 * (i + 1)) unless fs.include?(i)
      return "a" * ((2 * i) + 1) if fs.include?(i)
    end

    def cod_s(s)
      case s
      when "<"
        "ba"
      when "B"
        "bba"
      when :E
        "c"
      when :D
        "cc"
      else
        "#{"b" * (s.to_i + 3)}a"
      end
    end

    def cod_t(c, cfgs)
      cod = ""
      q1, s1 = c
      cfgs.each do |cfg|
        q2, s2, d = cfg
        cod += cod_q(q1)
        cod += cod_s(s1)
        cod += cod_q(q2)
        cod += cod_s(s2)
        cod += cod_s(d)
      end
      cod
    end

    # MQ_Turing_Uni_codificar_delta
    def codificar
      cod = ""
      delta.each do |c, a|
        cod += cod_t(c, a)
      end
      cod
    end
  end
end
