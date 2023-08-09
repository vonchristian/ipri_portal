Ransack.configure do |c|
  c.non_searchable_attributes = [:encrypted_password, :password]
end
