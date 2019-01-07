//
//  SkinType.swift
//  Will I Burn1
//
//  Created by natarajan k on 03/01/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import Foundation
struct SkinType {
  var  type1 = "type1 - pale/Light"
    var  type2 = "type2 - White/Fair"
    var  type3 = "type3 - Medium"
    var  type4 = "type4 - Olive Brown"
    var  type5 = "type5 - Dark Brown"
    var type6 = "type5 - very Dark/Black"
    
    func allSkinTypes () -> [String]{
        return [type1,type2,type3,type4,type5,type6]
    }
}
