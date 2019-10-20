import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache

class JsonPojo: Codable {
    let name: String
    let age: Int
    var firstNam:String!

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct mustacheHelper:MustachePageHandler {
    var values:MustacheEvaluationContext.MapType
    
    func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
        contxt.extendValues(with: values)
        
        do {
            try contxt.requestCompleted(withCollector: collector)
        } catch{
            let response = contxt.webResponse
            response.appendBody(string: "Sorry Try Again..!").completed(status: .internalServerError)
        }
        
    }
}

func helloMustache(request:HTTPRequest,response:HTTPResponse){
    let values = MustacheEvaluationContext.MapType()
    mustacheRequest(request: request, response: response, handler: mustacheHelper(values: values), templatePath: request.documentRoot + "/hello.mustache")
}


let server = HTTPServer()
server.serverPort = 8080
server.documentRoot = "webroot"


var routes = Routes()
routes.add(method: .get, uri: "/hello", handler: helloMustache)

routes.add(method:.get,uri: "/", handler: {
    request,response in
        response.setBody(string: "cool").completed()
})

func returnJsonResponse(data : JsonPojo , response : HTTPResponse) {
    do{
        try
            response.setBody(json: data)
                .setHeader(.contentType, value: "application/json").completed()
    } catch PerfectError.networkError( _, _) {
        //try response.setBody(json: ["Message":"\(err)"]).completed(status: .internalServerError)
    } catch {
        
    }
}

routes.add(method: .get, uri: "/json", handler: {
    request,response in
    returnJsonResponse(data: JsonPojo(name: "Mirakle",age: 22), response: response)
})

server.addRoutes(routes)

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg){
    print("Error Occured \(err) \(msg)")
    
}
