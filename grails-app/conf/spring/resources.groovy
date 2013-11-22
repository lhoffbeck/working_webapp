// Place your Spring DSL code here
beans = {

	memcachedClient(net.rubyeye.xmemcached.utils.XMemcachedClientFactoryBean) {
    	servers="localhost:11211" 
  	}

}
