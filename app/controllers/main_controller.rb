class MainController < ApplicationController
	skip_before_action :authorize, [:index]
end
