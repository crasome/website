module WithinCucumberHelper
  def within_parent_of(*args, &block)
    scope = args.first.is_a?(Capybara::Node::Base) ? args.first
                                                   : find(*args)
    within scope.first(:xpath,".//.."), &block
  end
end
