module Webrat
  module Matchers
    
    include SharedMatchers

    alias :assert_text_present :assert_contain
    alias :assert_text_not_present :assert_not_contain
    
    def assert_text(selector, content, &block)
      if selector.xpath? # see core_extensions/string.rb
        assert_have_xpath(selector, :content => content.to_s, &block)
      else
        assert_have_selector(selector.clean_selector, :content => content.to_s, &block)
      end
    end
  
    def assert_element_present(selector, attributes = {}, &block)
      if selector.xpath?
        assert_have_xpath(selector, attributes, &block)
      else
        assert_have_selector(selector.clean_selector, attributes, &block)
      end
    end

    def assert_element_not_present(selector, attributes = {}, &block)
      if selector.xpath?
        assert_have_no_xpath(selector, attributes, &block)
      else
        assert_have_no_selector(selector.clean_selector, attributes, &block)
      end
    end
    
  end
end
