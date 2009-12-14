require File.dirname(__FILE__) + '/test_helper' 

class MatchersTest < Test::Unit::TestCase

  include Webrat::Matchers
  
  def setup
    @body = <<-HTML
      <div id='main'>
        <div class='inner'>hello, world!</div>
      </div>
    HTML
    expects(:response_body).at_most_once.returns(@body)
  end
  
  def test_assert_text_present
    assert_text_present('hello, world!')
  end
  
  def test_assert_text_not_present
    assert_text_not_present('goodbye, world!')
  end
  
  def test_assert_text_with_css_selector
    assert_text('div.inner', 'hello, world!')
  end
  
  def test_assert_text_with_xpath_selector
    assert_text('//div[@class="inner"]', 'hello, world!')
  end
  
  def test_assert_element_present_with_css_selector
    assert_element_present('css=div.inner')
  end
  
  def test_assert_element_present_xpath_selector
    assert_element_present('//div[@class="inner"]')
  end
  
  def test_assert_element_present_with_invalid_selector
    assert_raise Test::Unit::AssertionFailedError do
      assert_element_present('//div[@class="outer"]')
    end
  end
  
  def test_assert_element_present_with_attributes
    assert_element_present('//div[@class="inner"]', :content => "hello, world!")
  end                                                                         
  
  def test_assert_element_present_with_invalid_attributes
    assert_raise Test::Unit::AssertionFailedError do
      assert_element_present('//div[@class="inner"]', :content => "goodbye, world!")
    end
  end
  
  def test_assert_element_not_present_with_css_selector
    assert_element_not_present('div.outer')
  end
  
  def test_assert_element_not_present_xpath_selector
    assert_element_not_present('//div[@class="outer"]')
  end
  
  def test_assert_element_not_present_with_valid_selector
    assert_raise Test::Unit::AssertionFailedError do
      assert_element_not_present('//div[@class="inner"]')
    end
  end
  
  def test_assert_location_ends_in
    expects(:response).returns(OpenStruct.new(:headers => {"Location" => "http://www.example.com/my/url/"}))
    assert_location_ends_in('my/url')
  end                             
  
  def test_assert_location_ends_in_failure
    expects(:response).returns(OpenStruct.new(:headers => {"Location" => "http://www.example.com/my/url/"}))
    assert_location_ends_in('different/url')
  end
  
end
