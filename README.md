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

## 参考
- [Github](https://github.com/kishikawakatsumi/KeychainAccess)
- [AppleによるKeychain Servicesの公式ドキュメント](https://developer.apple.com/documentation/security/keychain_services)
- [岸川さんのリリース時の文章](http://blog.kishikawakatsumi.com/entry/2015/01/03/082916)
- [[iOS] アカウント情報をアプリ間で安全に共有する方法](https://blog.odoruinu.net/2014/07/10/ios-keychain-sharing-data-between-apps/)
<br>別ラッパ(LUKeychainAccess)を用いているけどキーチェーンサービス自体の説明がある

