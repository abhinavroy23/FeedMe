//
//  MyFileManager.swift
//  FeedMe
//
//  Created by Abhinav Roy on 18/01/18.
//  Copyright © 2018 Abhinav Roy. All rights reserved.
//
import UIKit

class MyFileManager: NSObject {
    
    private let fileCache : FileCache?
    
    override init() {
        self.fileCache = FileCache.init(cacheDir: "FeedMeCache")
        super.init()
    }
    
    func saveImageToFileCache(forKey key:String, andImage image:UIImage, withCompletionHandler completionHandler:()->(), andErrorHandler errorHandler :()->() ){
        if let imageData = UIImagePNGRepresentation(image){
           let success = fileCache?.save(key: key, value: imageData)
            if(success!){
               completionHandler()
            }else{
                errorHandler()
            }
        }else{
            errorHandler()
        }
    }
    
    func loadImageFromFilecache(forKey key : String) -> UIImage?{
        guard let imageData = fileCache?.load(key: key) else{
            return nil
        }
        guard let image = UIImage.init(data: imageData) else{
            return nil
        }
        return image
    }
    
    func clearImageCache(){
        fileCache?.deleteCacheDirectory()
    }
}

class FileCache{
    
    private let cacheDirectory: String
    
    init(cacheDir: String) {
        cacheDirectory = cacheDir
    }
    
    private func cachesDirectory() throws -> URL? {
        
        var cachesDir: URL? = nil
        do {
            cachesDir = try FileManager
                .default
                .url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(cacheDirectory, isDirectory: true)
        } catch {
            throw error
        }
        guard let dir = cachesDir else {
            return nil
        }
        
        do {
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true, attributes: nil)
        } catch {
            throw error
        }
        return dir
    }
    
    public func load(key: String) -> Data? {
        guard let path = fileURL(fileName: key) else {
            return nil
        }
        
        var data: Data?
        do {
            data = try Data(contentsOf: path)
        } catch {
            debugPrint(" Couldn't create data object: ", error)
        }
        return data
    }
    
    public func save(key: String, value: Data?) -> Bool {
        guard let path = fileURL(fileName: key) else {
            return false
        }
        if let new = value as Data? {
            do {
                try new.write(to: path, options: .atomic)
                return true
            } catch {
                debugPrint("Error writing data to the file: ", error)
                return false
            }
        } else {
            try? FileManager.default.removeItem(at: path)
            return false
        }
    }
    
    private func fileURL(fileName name: String) -> URL? {
        guard let escapedName = name.addingPercentEncoding(withAllowedCharacters: .alphanumerics) else {
            return nil
        }
        
        var cachesDir: URL?
        do {
            cachesDir = try cachesDirectory()
        } catch {
            debugPrint("Error getting caches directory: ", error)
            return nil
        }
        
        return cachesDir?.appendingPathComponent(escapedName)
        
    }
    
    public func deleteCacheDirectory() {
        
        var cachesDir: URL?
        do {
            cachesDir = try cachesDirectory()
        } catch {
            debugPrint(" Error getting caches directory: ", error)
            return
        }
        guard let dir = cachesDir else {
            return
        }
        do {
            try FileManager.default.removeItem(at: dir)
        } catch {
            debugPrint("Error deleting files from the caches directory: ", error)
        }
        
    }
    
}
