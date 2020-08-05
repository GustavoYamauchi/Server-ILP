import Fluent
import Vapor

func routes(_ app: Application) throws {
//    app.get { req in
//        return "It works!"
//    }

//    app.get("hello") { req -> String in
//        return "Hello, world!"
//    }

    app.get("tarefa") { req in
        return Tarefa.query(on: req.db).all()
    }
    
    app.post("add") { req -> EventLoopFuture<Tarefa> in
        let tarefa = try req.content.decode(Tarefa.self)
        return tarefa.create(on: req.db).map { tarefa }
    }
    
    app.post("delete") { req -> EventLoopFuture<Tarefa> in
        let tarefa = try req.content.decode(Tarefa.self)
        return tarefa.delete(on: req.db).map { tarefa }
    }
    //try app.register(collection: TodoController())
}
