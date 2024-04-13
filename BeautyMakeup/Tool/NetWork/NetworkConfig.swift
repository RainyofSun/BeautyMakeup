//
//  NetworkConfig.swift
//  BeautyMakeup
//
//  Created by 刘冉 on 2024/4/12.
//

import UIKit

// MARK: URL
func BASE_URL() -> String {
#if DEBUG
    return "https://api.socialnb.work"
#else
    return "https://" + "app." + "yesok/" + "/.work/"
#endif
}
