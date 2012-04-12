require 'test_helper'


class TypeTest < ActiveSupport::TestCase

  # Test añadido: comprueba que campos obligatorios vacios dan error
  test "Type attributes must not be empty" do
    type = Type.new
    assert type.invalid?  # Test pasa si validación no pasa
    assert type.errors[:name].any?
    assert type.errors[:description].any?
   end
end

