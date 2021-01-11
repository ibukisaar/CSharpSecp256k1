# CSharpSecp256k1
一个迷你快速的C# Secp256k1椭圆曲线算法


### 示例
```csharp
var msg = ParseBytes("788bdab359b79ae82485eb4b3c1d1a4d699eb5eb812b7b09c131d01ba0828846");
var privKey = ParseBytes("e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855");
var pubKey = Secp256k1.CreatePublicKey(privKey); // 根据私钥创建公钥
var sig = Secp256k1.Sign(privKey, msg); // 使用私钥对消息进行签名
bool valid = Secp256k1.Verify(pubKey, msg, sig); // 对(公钥，消息，签名)进行验证
Console.WriteLine($"验证结果：{valid}");
PrintHex("私钥", privKey);
PrintHex("短公钥", pubKey.Serialize(true));
PrintHex("长公钥", pubKey.Serialize());
PrintHex("消息", msg);
PrintHex("签名", sig.Serialize()); // 注意：生成的签名不会与示例一致，而是每次都是随机的
```
#### =========== output ===========
```
验证结果：True
私钥: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
短公钥: 03a34b99f22c790c4e36b2b3c2c35a36db06226e41c692fc82b8b56ac1c540c5bd
长公钥: 04a34b99f22c790c4e36b2b3c2c35a36db06226e41c692fc82b8b56ac1c540c5bd5b8dec5235a0fa8722476c7709c02559e3aa73aa03918ba2d492eea75abea235
消息: 788bdab359b79ae82485eb4b3c1d1a4d699eb5eb812b7b09c131d01ba0828846
签名: afef9616e8d964c4a20c2ed453bfae748f9d22ec24d091afc4115c368670d50f3106e5cad5d110ac2e2d72e1cc1d22808686d3435d3b0ba968c434c5e82ca096
```
