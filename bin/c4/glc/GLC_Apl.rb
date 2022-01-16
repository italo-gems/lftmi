# <<fonte>> bin/lftmi/c4/glc/GLC_apl.rb
require 'set'
require 'lftmi/c4/glc/GLC'
    # GLC_apl_passos_de_derivacao
case ARGV.size
when 0
    puts( "> Informe\n\t(i) a quantidade de passos de simulação (>= 0) e\n\t(ii) se apenas formas sentenciais devem ser listadas (\"f\").")
    exit( 0 )
when 1
    n = ARGV[0].to_i
    mostrar_sentencas = false
when 2
    n = ARGV[0].to_i
    mostrar_sentencas = true # assume "f"
end
puts "--"

    # GLC_apl_instanciacao_da_gramatica
g4_1 = Lftmi::GLC.new

    # GLC_estudo_produções
g4_1.adicionar_producao( { "E" => ["T+E", "T"] } )
g4_1.adicionar_producao( { "T" => [ "F*T", "F" ] } )
g4_1.adicionar_producao( { "F" => [ "(E)", "a" ] } )

    # GLC_estudo_derivação
derivacoes = g4_1.derivar( "E", n )

    # GLC_estudo_resultado
if mostrar_sentencas
    sentencas = Set[]
    derivacoes.each do |forma|
        forma.each do |w, substituicoes|
            sentencas << w if substituicoes == Set[]
        end
    end
    pp sentencas
else
    pp derivacoes
end


