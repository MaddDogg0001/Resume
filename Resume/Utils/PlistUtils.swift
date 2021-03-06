//
//  PlistUtils.swift
//  Resume
//
//  Created by Odet Alexandre on 06/04/2017.
//  Copyright © 2017 Odet Alexandre. All rights reserved.
//

import Foundation

final class PlistUtils {
  public class func getGithubUrl() -> String? {
    let path = Bundle.main.path(forResource: "Network", ofType: "plist")
    guard let dict = NSDictionary(contentsOfFile: path!) else {
      return nil
    }
    return (dict.object(forKey: "github_url") as? String)
  }
  
  public class func getWebsiteUrl() -> String? {
    let path = Bundle.main.path(forResource: "Network", ofType: "plist")
    guard let dict = NSDictionary(contentsOfFile: path!) else {
      return nil
    }
    return (dict.object(forKey: "website_url") as? String)
  }
  
}
