package webportal

class GTagLib {

	def redirectpage={ attrs->
	  def url=attrs.get('url')
	   response.sendRedirect("${request.contextPath}"+url)
	   println attrs
	}

}
