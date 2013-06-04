require 'sinatra'
require './models/foo'

get '/' do
  send_file 'public/index.html'
end

##~ s = source2swagger.namespace("api")
##~ s.basePath =  "http://localhost:9292"
##~ s.swaggerVersion = "1.1"
##~ s.apiVersion = "1.0"
##~ s.resourcePath = "/foo"
  
##~ a = s.apis.add
##~ a.set :path => "/foo/list", :format => "json", :description => "Access to all of the foos."
##
##~ a.operations.add :httpMethod => "GET", :summary => "Returns all of the foos.", :deprecated => false, :nickname => "list_foos"

get '/foo/list' do
  content_type :json
  Foo.list.to_json
end

##~ s = source2swagger.namespace("api")
##~ a = s.apis.add
##
##~ a.set :path => "/foo/{id}", :format => "json", :description => "Access to a single foo"
##
##~ op = a.operations.add
##~ op.set :httpMethod => "GET", :deprecated => false, :nickname => "get_foo"
##~ op.summary = "Returns a single foo by id"
##~ op.parameters.add :name => "id", :description => "The id of the foo to be returned", :dataType => "int", :allowMultiple => false, :required => true, :paramType => "path"
##

get '/foo/:id' do |id|
  content_type :json
  Foo.get(id).to_json
end

