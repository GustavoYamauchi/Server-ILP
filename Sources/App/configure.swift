import Fluent
import FluentSQLiteDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    let dirConfig = DirectoryConfiguration.detect()

    app.databases.use(.sqlite(.file("\(dirConfig.workingDirectory)tarefa.db")), as: .sqlite)
    

    app.migrations.add(CreateTarefa())
    try app.autoMigrate().wait()
    // register routes
    try routes(app)
}
