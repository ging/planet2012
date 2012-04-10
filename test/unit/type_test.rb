require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # type creado sin atributos es invalido y genera errores

  test "Type attributes must not be empty" do

   type = Type.new

   assert type.invalid?      # Test pasa si validación no pasa 
   assert type.errors[:name].any?
   assert type.errors[:description].any?

  end
end
