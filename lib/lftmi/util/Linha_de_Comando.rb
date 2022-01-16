module Lftmi
  module Linha_de_Comando
    def self.tratar(argv, w = "", grau = 0)
      case argv.size
      when 0
        puts "??? Indique a cadeia de entrada 'w'"
        puts "??? Operando com w= #{w}"
      when 1
        w = argv[0]
      when 2
        grau = argv[0].to_i
        w = argv[1]
      end
      puts "--"
      [w, grau]
    end
  end
end
