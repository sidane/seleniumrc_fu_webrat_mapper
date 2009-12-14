require File.dirname(__FILE__) + '/test_helper' 

class SeleniumMatchersTest < Test::Unit::TestCase

  include Webrat::Selenium::Matchers
  
  def test_assert_text_present
    stubs(:assert_contain).with('content').returns(true)
    assert assert_text_present('content')
  end
  
  def test_assert_text_not_present
    stubs(:assert_not_contain).with('content').returns(true)
    assert assert_text_not_present('content')
  end
  
  def test_assert_text
    stubs(:assert_have_selector).with('div#my_id').returns(true)
    stubs(:assert_contain).with('content').returns(true)
    assert assert_text('div#my_id', 'content')
  end
  
  def test_assert_text_with_xpath
    stubs(:assert_have_xpath).with('//div').returns(true)
    stubs(:assert_contain).with('content').returns(true)
    assert assert_text('//div', 'content')
  end
  
  def test_assert_element_present
    stubs(:assert_have_selector).with('div#my_id').returns(true)
    assert assert_element_present('div#my_id')
  end
  
  def test_assert_element_present_with_xpath
    stubs(:assert_have_xpath).with('//div').returns(true)
    assert assert_element_present('//div')
  end
  
  def test_assert_element_not_present
    stubs(:assert_have_no_selector).with('div#my_id').returns(true)
    assert assert_element_not_present('div#my_id')
  end
  
  def test_assert_element_not_present_with_xpath
    stubs(:assert_have_no_xpath).with('//div').returns(true)
    assert assert_element_not_present('//div')
  end
  
  def test_assert_visible
    stubs(:selenium).returns(OpenStruct.new(:is_visible => true))
    assert assert_visible("div#my_id")
  end
  
  def test_assert_visible
    stubs(:selenium).returns(OpenStruct.new(:is_visible => false))
    assert !assert_not_visible("div#my_id")
  end
  
end
