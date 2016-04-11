import com.academy.app.domain.User



class BootStrap {

	def init = { servletContext ->
		println 'Default user'
	}
	def destroy = {
	}
}
