class @Router
  initRoutes:(router, routes)->
    for routeName, info of routes
      if routeName is "default"
        router.otherwise redirectTo: info
      else
        router.when routeName,
          template: info.template
          controller: info.controller

  setupXhr:(xhr)->
    xhr.defaults.headers.post['Content-Type'] = 'application/json'
    xhr.defaults.headers.put['Content-Type'] = 'application/json'

    token = $("meta[name='csrf-token']").attr("content")
    xhr.defaults.headers.post['X-CSRF-Token'] = token
    xhr.defaults.headers.put['X-CSRF-Token'] = token
    xhr.defaults.headers['delete']['X-CSRF-Token'] = token

  constructor:($route, $xhr)->
    @setupXhr($xhr)
    @initRoutes $route, @routes()

@resourceService = (serviceName, path, resourceTypes...)->
	if resourceTypes.length is 0
		resourceTypes.push 'index', 'create', 'update', 'destroy'
	commandHash = {}
	for type in resourceTypes
		commandHash[type] = switch type
			when 'index'
				{ method:'GET', isArray:true }
			when 'create'
				{ method: 'POST' }
			when 'update'
				{ method: 'PUT' }
			when 'destroy'
				{ method: 'DELETE' }

	angular.service serviceName, ($resource)->
		$resource path, {}, commandHash
