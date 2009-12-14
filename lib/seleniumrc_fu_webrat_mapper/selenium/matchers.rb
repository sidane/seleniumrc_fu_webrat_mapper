module Webrat
  module Selenium
    module Matchers
      
      include SharedMatchers

      def assert_text_present(content)
        assert_contain(content)
      end
      
      def assert_text_not_present(content)
        assert_not_contain(content)
      end

      def assert_text(selector, content)
        if selector.xpath? # see core_extensions/string.rb
          assert_have_xpath(selector) && assert_contain(content)
        else
          assert_have_selector(selector.clean_selector) && assert_contain(content)
        end
      end

      def assert_element_present(selector)
        if selector.xpath?
          assert_have_xpath(selector)
        else
          assert_have_selector(selector.clean_selector)
        end
      end

      def assert_element_not_present(selector)
        if selector.xpath?
          assert_have_no_xpath(selector)
        else
          assert_have_no_selector(selector.clean_selector)
        end
      end
      
      def assert_visible(selector)
        assert selenium.is_visible(selector)
      end
      
      def assert_not_visible(selector)
        assert !selenium.is_visible(selector)
      end
      
    end
  end
end