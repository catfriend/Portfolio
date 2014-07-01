require "test_helper"

describe CarrierwaveImage do
  before do
    @carrierwave_image = CarrierwaveImage.new
  end

  it "must be valid" do
    @carrierwave_image.valid?.must_equal true
  end
end
