//
//  ViewController.swift
//  ios-keychainaccess-demo
//
//  Created by Kentaro on 2017/03/14.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit
import KeychainAccess

class ViewController: UIViewController {
    /*
     Keychainのインスタンスを作成
     サービス名を指定しなかった場合は、自動的にアプリケーションのバンドルIDが設定される
     */
    let keychain = Keychain()

    // MARK: - 値の保存、取得、削除

    // 保存
    private func save() {

        // メソッドで保存
        try? keychain.set("hogehoge", key: "hoge")

        // Subscriptingで保存
        keychain["fuga"] = "fugafuga"
    }

    // 取得
    private func getValue() {

        // メソッド
        let str1 = try? keychain.get("hoge")
        
        // StringとDataが混在しているときはこちらのメソッド使うとわかりやすい
        let str2 = try? keychain.getString("hoge")

        // Subscripting
        let str3 = keychain["fuga"]

        print("str1: \(str1), str2: \(str2), str3: \(str3)")
    }

    // 削除
    private func remove() {

        // メソッド
        try? keychain.remove("hoge")

        // nilを代入
        keychain["fuga"] = nil

        print("hoge: \(keychain["hoge"]), fuga: \(keychain["fuga"])")
    }

    // MARK: - 設定を変えて保存する

    private func changeAccessibilityWhenUnlocked() {
        /*
         フォアグラウンド動作時のみ読み出せるようにして保存
         （この項目はバックグラウンド動作時は読み出せない）
         */
        keychain.accessibility(.whenUnlocked)["unlocked"] = "unlockedTest"
        print("unlocked: \(keychain["unlocked"])")
    }

    private func enableiCloud() {
        // iCloudによる同期を有効にする
        keychain.synchronizable(true)["iCloud"] = "iCloudTest"
        print("iCloud: \(keychain["iCloud"])")
    }

    // MARK: - Action

    @IBAction func didTapSaveButton(_ sender: UIButton) {
        save()
    }

    @IBAction func didTapGetButton(_ sender: UIButton) {
        getValue()
    }

    @IBAction func didTapRemoveButton(_ sender: UIButton) {
        remove()
    }

    @IBAction func didTapUnlockedButton(_ sender: UIButton) {
        changeAccessibilityWhenUnlocked()
    }

    @IBAction func didTapiCloudButton(_ sender: UIButton) {
        enableiCloud()
    }
}

