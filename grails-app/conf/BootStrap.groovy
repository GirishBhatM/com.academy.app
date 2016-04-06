import com.academy.app.domain.User



class BootStrap {

	def init = { servletContext ->
		new User(loginId:'admin',password:'admin',userName:'Admin').save()
	}
	def destroy = {
	}
}
