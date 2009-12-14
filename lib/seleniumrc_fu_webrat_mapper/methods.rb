module Webrat
  module Methods
    
    alias :open :visit
    alias :refresh :reload
    
    def click_and_wait(text_or_title_or_id, options = {})
      click_link(text_or_title_or_id.clean_selector, options)
    end
    
    alias :click :click_and_wait
    
    def type(field_locator, value)
      fill_in(field_locator.clean_selector, :with => value)
    end
    
    alias :webrat_select :select
    
    def select(field, option_text)
      webrat_select(option_text, :from => field)
    end

  end
end
