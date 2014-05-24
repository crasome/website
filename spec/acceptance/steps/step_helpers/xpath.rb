module StepHelpers::Xpath
  def xpath
    OpenStruct.new({
      :parent => ".//..",
    })
  end
end
