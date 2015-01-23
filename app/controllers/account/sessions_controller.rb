class Account::SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication, :only => [ :new, :create]

end
