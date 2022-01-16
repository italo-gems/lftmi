# <<fonte>> bin/lftmi/c4/llc/Greibach_Apl.rb
require "lftmi/c4/llc/Greibach"
# Greibach_estudo_entrada
case ARGV.size
when 0
  puts("> Informe a cadeia a ser processada.")
  exit(0)
when 1
  w = ARGV[0]
end
puts "--"

# Greibach_estudo_instanciação
g4_2 = Greibach.new

# Greibach_estudo_produções
g4_2.adicionar_producao({ "S" => ["aBC", "bBC"] })
g4_2.adicionar_producao({ "B" => ["bB", "b"] })
g4_2.adicionar_producao({ "C" => ["c"] })

# Greibach_estudo_pertinencia
pp g4_2.pertence?(w)
pp g4_2.substituicoes
