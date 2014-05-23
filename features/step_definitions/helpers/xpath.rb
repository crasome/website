module XpathCucumberHelper
  def xpath
    OpenStruct.new({
      :parent => ".//..",
    })
  end
end
