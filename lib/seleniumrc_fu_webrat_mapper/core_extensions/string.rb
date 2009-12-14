class String
  
  def xpath?
    self =~ /^(\/)+/
  end
  
  def clean_selector
    self.gsub(/(id=|link=|css=)*/, '')
  end
  
end
