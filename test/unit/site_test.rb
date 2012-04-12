require 'test_helper'


class TypeTest < ActiveSupport::TestCase


  # Test añadido: comprueba que campos obligatorios vacios dan error
  test "Site attributes must not be empty" do
    site = Site.new
    assert site.invalid? # Test pasa si validación no pasa
    assert site.errors[:name].any?
    assert not(site.errors[:description].any?)
    assert site.errors[:type_id].any?
    assert site.errors[:image_url].any?
   end
end

