# <<fonte>> test/c5/gsc/CasoUsoGSC.rb
require "05/gsc/GSC"
    # CasoUsoGSC_instanciacao
g5_1 = GSC.new

    # CasoUsoGSC_estrutura
g5_1.adicionarProducao({ "S" => ["aSBC", "aBC"] })
g5_1.adicionarProducao({ "CB" => ["BC"] })
g5_1.adicionarProducao({ "aB" => ["ab"] })
g5_1.adicionarProducao({ "bB" => ["bb"] })
g5_1.adicionarProducao({ "bC" => ["bc"] })
g5_1.adicionarProducao({ "cC" => ["cc"] })

    # CasoUsoGSC_derivacoes
derivacoes = g5.derivar( "S", 4 )
pp derivacoes
    

