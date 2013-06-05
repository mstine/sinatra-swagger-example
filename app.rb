require 'sinatra'
require './models/foo'
require './models/bar'

get '/' do
  redirect '/index.html'
end

get "/api-docs" do
  res = File.read(File.join(settings.root, 'public/api', 'api-docs.json'))
  body res
  status 200
end

get "/api-docs/:api" do
  res = File.read(File.join(settings.root, 'public/api', "#{params[:api].to_s}.json"))
  body res
  status 200
end

##~ root = source2swagger.namespace("api-docs")
##~ root.basePath = "http://foo-swagger.cfapps.io"
##~ root.swaggerVersion = "1.1"
##~ root.apiVersion = "1.0"
##~ root.apis.add :path => "/api-docs/foo", :description => ""
##~ root.apis.add :path => "/api-docs/bar", :description => ""

##~ s = source2swagger.namespace("foo")
##~ s.basePath =  "http://foo-swagger.cfapps.io"
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

##~ s = source2swagger.namespace("bar")
##~ s.basePath =  "http://foo-swagger.cfapps.io"
##~ s.swaggerVersion = "1.1"
##~ s.apiVersion = "1.0"
##~ s.resourcePath = "/bar"
  
##~ a = s.apis.add
##~ a.set :path => "/bar/list", :format => "json", :description => "Access to all of the bars."
##
##~ a.operations.add :httpMethod => "GET", :summary => "Returns all of the bars.", :deprecated => false, :nickname => "list_bars"

get '/bar/list' do
  content_type :json
  Bar.list.to_json
end

##~ a = s.apis.add
##
##~ a.set :path => "/bar/{id}", :format => "json", :description => "Access to a single bar"
##
##~ op = a.operations.add
##~ op.set :httpMethod => "GET", :deprecated => false, :nickname => "get_bar"
##~ op.summary = "Returns a single bar by id"
##~ op.parameters.add :name => "id", :description => "The id of the bar to be returned", :dataType => "int", :allowMultiple => false, :required => true, :paramType => "path"
##

get '/bar/:id' do |id|
  content_type :json
  Bar.get(id).to_json
end
