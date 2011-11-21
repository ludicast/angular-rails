class @BaseRouter
  constructor:($route, $xhr)->
    $xhr.defaults.headers.post['Content-Type'] = 'application/json'
    $xhr.defaults.headers.put['Content-Type'] = 'application/json'

    token = $("meta[name='csrf-token']").attr "content"
    $xhr.defaults.headers.post['X-CSRF-Token'] = token
    $xhr.defaults.headers.put['X-CSRF-Token'] = token
    $xhr.defaults.headers['delete']['X-CSRF-Token'] = token
    @router = $route

		console.log "loaded"

  initRoutes:(routes)->
    for routeName, info of routes
      if routeName is "default"
        @router.otherwise redirectTo: info
      else
        @router.when routeName,
          template: info.template
          controller: info.controller
    console.log @router

BaseRouter.$inject = ['$route', '$xhr']

@router =  (new angular.scope()).$new(BaseRouter)
