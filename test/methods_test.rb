require File.dirname(__FILE__) + '/test_helper' 

class MethodsTest < Test::Unit::TestCase

  include Webrat::Methods
  
  def test_open
    Webrat::Session.any_instance.expects(:visit).with("/")
    open "/"
  end
  
  def test_click_and_wait
    Webrat::Session.any_instance.expects(:click_link).with("My Link", {})
    click_and_wait "link=My Link"
  end
  
  def test_click
    Webrat::Session.any_instance.expects(:click_link).with("My Link", {})
    click "id=My Link"
  end
  
  def test_refresh
    Webrat::Session.any_instance.expects(:reload)
    refresh
  end
  
  def test_type
    Webrat::Session.any_instance.expects(:fill_in).with("my_field", :with => "Monkeys")
    type "my_field", "Monkeys"
  end
  
  def test_select
    Webrat::Session.any_instance.expects(:select).with("Monkeys", :from => "my_select_menu")
    select "my_select_menu", "Monkeys"
  end
  
end
