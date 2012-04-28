require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # site creado sin atributos es invalido y genera errores
  test "Site attributes must not be empty" do
    site = Site.new
    assert site.invalid?      # Test pasa si validación no pasa 
    assert site.errors[:name].any?
    assert not(site.errors[:description].any?)
    assert site.errors[:type_id].any?

  end
end
