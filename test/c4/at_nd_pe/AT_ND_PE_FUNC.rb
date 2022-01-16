# <<fonte>> bin/c4/ape/AT_ND_PE_FUNC.rb
require "minitest/autorun"
require "lftmi/c4/mq_nd_pe/MQ_ND_PE"
require "lftmi/c4/at_nd_pe/AT_ND_PE"

class AT_ND_PE_FUNC < Minitest::Test
  # AT_ND_PE_FUNC_setup
  def setup
    # Ex 4.48, p. 391
    a1 = {
      ["q1", "a"] => "q1",
      ["q1", "x"] => "q2",
      ["q2", "b"] => "q2",
    }

    mq_nd_pe = Lftmi::MQ_ND_PE.new({
      :q0 => "q1",
      :fs => Set["q2"],
      :delta => a1,
      :pilha => [],
      :q_cor => "q1",
    })

    @at_nd_pe = Lftmi::AT_ND_PE.new
    @at_nd_pe.mq = mq_nd_pe
    @at_nd_pe.entrada = Lftmi::Fita_L.new
  end

  def test_mover_entrada_vazia
    # Sabendo que
    r = @at_nd_pe
    # Quando
    r.analisar_cadeia("")
    # Então
    assert_equal("q1", r.mq.q_cor)
    assert_equal("Z0", r.pilha.top)
    assert_equal("<>", r.entrada.cadeia)
    assert_equal(1, r.entrada.cursor)
  end

  def test_mover_entrada_a
    # Sabendo que
    r = @at_nd_pe
    # Quando
    r.analisar_cadeia("a")
    # Então
    assert_equal("q1", r.mq.q_cor)
    assert_equal("Z0", r.pilha.top)
    assert_equal("<a>", r.entrada.cadeia)
    assert_equal(2, r.entrada.cursor)
  end

  def test_mover_entrada_x
    # Sabendo que
    r = @at_nd_pe
    # Quando
    r.analisar_cadeia("x")
    # Então
    assert_equal("q2", r.mq.q_cor)
    assert_equal("Z0", r.pilha.top)
    assert_equal("<x>", r.entrada.cadeia)
    assert_equal(2, r.entrada.cursor)
  end

  def test_mover_entrada_aax
    # Sabendo que
    r = @at_nd_pe
    # Quando
    r.analisar_cadeia("aax")
    # Então
    assert_equal("q2", r.mq.q_cor)
    assert_equal("Z0", r.pilha.top)
    assert_equal("<aax>", r.entrada.cadeia)
    assert_equal(4, r.entrada.cursor)
  end
end
