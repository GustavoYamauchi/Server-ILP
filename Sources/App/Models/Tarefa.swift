//
//  File.swift
//  
//
//  Created by Gustavo Yamauchi on 20/07/20.
//

import Fluent
import Vapor

final class Tarefa: Model, Content {
    static let schema = "tarefas"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "titulo")
    var titulo: String
    
    @Field(key: "conteudo")
    var conteudo: String

    init() { }

    init(id: UUID? = nil, titulo: String, conteudo: String) {
        self.id = id
        self.titulo = titulo
        self.conteudo = conteudo
    }
}
