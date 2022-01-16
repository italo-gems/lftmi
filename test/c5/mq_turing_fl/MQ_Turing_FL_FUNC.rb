# <<fonte>> bin/c5/mtfi/MQ_Turing_FL_FUNC.rb
require 'minitest/autorun'
require 'lftmi/c5/mq_turing_fl/MQ_Turing_FL'
class MQ_Turing_FL_FUNC < Minitest::Test
  # MQ_Turing_FL_FUNC_uso_setup
def setup
  @mq_turing_1 = Lftmi::MQ_Turing_FL.new({
    :q0 => 1, :fs => [1, 2],
    :delta => {
      [1, "a"] => Set[[2, "a", :D]]
    }
  })
end

  # MQ_Turing_FL_FUNC_uso_instanciacao
def test_instanciacao
  # Sabendo que
  a = @mq_turing_1
  # Quando
  true
  # Então
  assert_equal(a.q0, 1)
  assert_equal(a.fs, [1, 2])
  assert_equal(a.delta, {
      [1, "a"] => Set[[2, "a", :D]]
    })
end

end

