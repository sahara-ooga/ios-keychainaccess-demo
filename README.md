# KeychainAccess

SwiftでKeychainを簡単に使うライブラリ

## 1. PodFile

```
pod 'KeychainAccess'
```

## 2. import する

```
import KeychainAccess
```

## 3. 使い方(Usage)

```
/*
 Keychainのインスタンスを作成
 サービス名を指定しなかった場合は、自動的にアプリケーションのバンドルIDが設定される
 */
let keychain = Keychain()

// 保存

// メソッドで保存
try? keychain.set("hogehoge", key: "hoge")

// Subscriptingで保存
keychain["fuga"] = "fugafuga"

// 取得

// メソッド
let str1 = try? keychain.get("hoge")
// StringとDataが混在しているときはこちらのメソッド使うとわかりやすい
let str2 = try? keychain.getString("hoge")

// Subscripting
let str3 = keychain["fuga"]

// 削除

// メソッド
try? keychain.remove("hoge")

// nilを代入
keychain["fuga"] = nil

// その他

/*
フォアグラウンド動作時のみ読み出せるようにして保存
（この項目はバックグラウンド動作時は読み出せない）
 */
keychain.accessibility(.whenUnlocked)["unlocked"] = "unlockedTest"

// iCloudによる同期を有効にする
keychain.synchronizable(true)["iCloud"] = "iCloudTest"
```
