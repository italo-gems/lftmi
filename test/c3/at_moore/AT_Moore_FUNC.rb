# <<fonte>> bin/c3/moore/AT_Moore_FUNC.rb
require "minitest/autorun"
require "lftmi/c3/mq_moore/MQ_Moore"
require "lftmi/c3/at_moore/AT_Moore"

class AT_Moore_FUNC < Minitest::Test
  def setup
    @mq_moore = Lftmi::MQ_Moore.new({
      :q0 => 1, :fs => [1, 2],
      :delta => {
        [1, "a"] => Set[[2, "a"]],
      },
      :lam => {
        "q0" => "1",
        "q1" => "",
      },
    })
  end

  # AT_Moore_FUNC_uso_instanciacao::
  def test_instanciacao
    # Sabendo que
    # Quando
    mq = @mq_moore
    a = Lftmi::AT_Moore.new
    a.mq = mq
    a.entrada = Lftmi::Fita_L.new
    # Então
    assert_equal(["<", ">"], a.entrada.cadeia)
    assert_equal(1, a.entrada.cursor)
    assert_equal("", a.saida)
  end

  # AT_Moore_FUNC_cadeia_1::
  def test_cadeia_1
    # Sabendo que
    mq = Lftmi::MQ_Moore.new({
      :q0 => "q0", :fs => Set["q1"],
      :delta => {
        ["q0", "a"] => Set["q1"],
        ["q1", "b"] => Set["q1"],
        ["q1", "c"] => Set["q0"],
      },
      :lam => {
        "q0" => "1",
        "q1" => "",
      },
    })
    a = Lftmi::AT_Moore.new
    a.mq = mq
    a.entrada = Lftmi::Fita_L.new
    # Quando
    a.analisar_cadeia("abbcabbbcab")
    # Então
    assert_equal("<abbcabbbcab>", a.entrada.cadeia)
    assert_equal(12, a.entrada.cursor)
    assert_equal("111", a.saida)
  end
end
