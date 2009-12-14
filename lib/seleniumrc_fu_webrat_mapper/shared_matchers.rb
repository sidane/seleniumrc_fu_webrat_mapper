module SharedMatchers
  
  def assert_location_ends_in(pattern)
    response.headers["Location"] =~ /pattern$/
  end
  
end