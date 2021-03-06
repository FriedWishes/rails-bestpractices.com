Typus.setup do |config|

  # Authentication: none, http_basic, session
  config.authentication = :session

  # Define the default root.
  # config.master_role = "admin"

  # Define relationship table.
  # config.relationship = "typus_users"

  # Define user_class_name and user_fk.
  config.user_class_name = "AdminUser"

  # Define the user_fk
  config.user_fk = "admin_user_id"

end
