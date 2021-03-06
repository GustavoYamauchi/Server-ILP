//
//  File.swift
//  
//
//  Created by Gustavo Yamauchi on 20/07/20.
//

import Fluent

struct CreateTarefa: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tarefas")
            .id()
            .field("titulo", .string, .required)
            .field("conteudo", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tarefas").delete()
    }
}

