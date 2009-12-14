require File.dirname(__FILE__) + '/test_helper'

class StringTest < Test::Unit::TestCase
  
  def test_valid_xpath?
    assert "//div[@id='my_id']".xpath?
  end                                 
  
  def test_invalid_xpath?
    assert !"#div[@id='my_id']".xpath?
  end
  
  def test_clean_selector
    assert_equal "homepage", "id=homepage".clean_selector
  end
  
  def test_clean_selector_with_no_matching_string
    assert_equal "not_cleaned=homepage", "not_cleaned=homepage".clean_selector
  end
  
end
