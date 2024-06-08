class Login_page < SitePrism::Page
	set_url '/'
	element :advancer, '#details-button'
	element :matricula, 'input[id="user_username"]'
	element :password, 'input[id="user_password"]'

	def login
		matricula.set '9817'
		password.set '123456'
		click_button(class: 'btn btn-sm btn-success pull-right m-t-n-xs')
	end
end