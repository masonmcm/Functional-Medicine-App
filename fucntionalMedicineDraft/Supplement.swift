//
//  Supplement.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 11/27/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import Foundation
import SQLite3

public var dbToClose: OpaquePointer?

enum SQLiteError: Error {
    case OpenDatabase(message: String)
    case Prepare(message: String)
    case Step(message: String)
    case Bind(message: String)
}

struct SupplementTable {
    let name: NSString
    let value: Double
}

protocol SQLTable {
    static var createStatement: String { get }
    static var populateStatement: String { get }
}

extension SupplementTable: SQLTable {
    static var createStatement: String {
        return """
        CREATE TABLE IF NOT EXISTS SupplementTable(
        Name CHAR(255) PRIMARY KEY NOT NULL,
        Value REAL
        );
        """
    }
    
    static var populateStatement: String {
        return """
        INSERT INTO SupplementTable (Name, Value)
        VALUES ('DH', 50), ('DL', 25), ('AH', 200), ('AL', 50),
        ('CH', 0.6), ('CL', 0.3), ('KH', 3.2), ('KL', 0.2), ('MH', 2.2), ('ML', 1.7);
        """
    }
    
}

class HasTableBeenCreated {
    
    static var sqlDb: SQLiteDatabase?
    static let singleton = HasTableBeenCreated(db: sqlDb)
    
    init(db: SQLiteDatabase?) {
        do {
            try db!.createTable(table: SupplementTable.self)
            do {
                try db!.populateTable(table: SupplementTable.self)
            } catch {
                print(db!.errorMessage)
            }
        } catch {
            print(db!.errorMessage)
        }
        print("Table created and populated. Will not be created or populated again")
    }
    
}


class Supplement{
    
    var supplementName: String
    var supplementLevel: Double
    lazy var levelOfTextDisplayed = chooseTextFromDatabase()
    
    init(supplement name: String, input amount: Double){
        self.supplementName = name
        self.supplementLevel = amount
    }
    
    func getDbPointer() -> OpaquePointer? {
        return dbToClose
    }
    
    func chooseTextFromDatabase() -> String{
        var db: SQLiteDatabase? = nil
        do {
            let filePath: URL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("POMVitaminData.sqlite")
            db = try SQLiteDatabase.open(path: filePath.path)
            print("Successfully opened connection to database at \(filePath)")
            
            HasTableBeenCreated.sqlDb = db
            HasTableBeenCreated.singleton
            
        } catch SQLiteError.OpenDatabase(let message) {
            print("Unable to open database. Failing with message: \(message)")
        } catch {
            print("\(error)")
        }
        

        let textLevel: String
        let splitVitaminName = supplementName.components(separatedBy: " ")
        let tempVitaminNameInit = splitVitaminName[splitVitaminName.count - 1]
        let tempVitaminNameFinal = tempVitaminNameInit[tempVitaminNameInit.startIndex]
        var vitaminNameHigh = String(tempVitaminNameFinal)
        vitaminNameHigh = vitaminNameHigh + String("H")
        var vitaminNameLow = String(tempVitaminNameFinal)
        vitaminNameLow = vitaminNameLow + String("L")

        if(supplementLevel < db!.selectSupplementValue(name: vitaminNameLow as NSString)) {
            textLevel = "Low"
        }else if(supplementLevel > db!.selectSupplementValue(name: vitaminNameHigh as NSString)) {
            textLevel = "High"
        }else {
            textLevel = "Average"
        }
        return textLevel
    }
}

class SQLiteDatabase {
    
    fileprivate let dbPointer: OpaquePointer?
    
    fileprivate init(dbPointer: OpaquePointer?) {
        self.dbPointer = dbPointer
        dbToClose = self.dbPointer
    }
    
    fileprivate var errorMessage: String {
        if let errorPointer = sqlite3_errmsg(dbPointer) {
            let errorMessage = String(cString: errorPointer)
            return errorMessage
        } else {
            return "No error message provided from sqlite."
        }
    }
    
    static func open(path: String) throws -> SQLiteDatabase {
        var db: OpaquePointer? = nil
        if sqlite3_open(path, &db) == SQLITE_OK {
            return SQLiteDatabase(dbPointer: db)
        } else {
            defer {
                if db != nil {
                    sqlite3_close(db)
                }
            }
            if let errorPointer = sqlite3_errmsg(db) {
                let message = String.init(cString: errorPointer)
                throw SQLiteError.OpenDatabase(message: message)
            } else {
                throw SQLiteError.OpenDatabase(message: "No error message provided from sqlite.")
            }
        }
        
    }
    
    deinit {
        sqlite3_close(dbPointer)
        print("Successfully deinitialized db pointer")
    }
    
}

extension SQLiteDatabase {
    func prepareStatement(sql: String) throws -> OpaquePointer? {
        var statement: OpaquePointer? = nil
        guard sqlite3_prepare_v2(dbPointer, sql, -1, &statement, nil) == SQLITE_OK else {
            throw SQLiteError.Prepare(message: errorMessage)
        }
        
        return statement
    }
}

extension SQLiteDatabase {
    func createTable(table: SQLTable.Type) throws {
        let createTableStatement = try prepareStatement(sql: table.createStatement)
        
        defer {
            sqlite3_finalize(createTableStatement)
        }
        
        guard sqlite3_step(createTableStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("\(table) created")
    }
}

extension SQLiteDatabase {
    func populateTable(table: SQLTable.Type) throws {
        let populateTableStatement = try prepareStatement(sql: table.populateStatement)
        
        defer {
            sqlite3_finalize(populateTableStatement)
        }
        
        guard sqlite3_step(populateTableStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("\(table) populated")
    }
}

extension SQLiteDatabase {
    func selectSupplementValue(name: NSString) -> Double {
        let querySql = "SELECT Value FROM SupplementTable WHERE Name = ?;"
        guard let queryStatement = try? prepareStatement(sql: querySql) else {
            return Double.nan
        }
        
        defer {
            sqlite3_finalize(queryStatement)
        }
        
        guard sqlite3_bind_text(queryStatement, 1, name.utf8String, -1, nil) == SQLITE_OK else {
            return Double.nan
        }
        
        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            return Double.nan
        }
        
        let value = sqlite3_column_double(queryStatement, 0)
       
        return value
    }
}
