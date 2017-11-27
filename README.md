# YNCodable
YNCodable是基于swift4新特性Codable封装的一行代码实现json与model的映射，如果你还不了解Codable新特性，可以查阅[官方文档](https://developer.apple.com/documentation/swift/encoding_decoding_and_serialization)
# 使用
**1. 常规json串**
    
   	let response = """
					    {
					      "list": [
					          {
					            "title": "title1 ",
					            "series": "series"
					          },
					          {
					            "title": "title2"
					          }
					      ]
					    }
				    """
				    
该json串中list数组有两个字段，字段title均有值，字段series可能没有值。我们可以定义如下Model：

    struct ResponseList: Codable {
	  var list: [List] = [List]()
	}
	
	struct List: Codable {
	  var title: String = ""
	  var series: String?
	}
> 注意这里series是optional, 因为json串中有可能有，有可能没有的字段必须是optional，不然整个json串都会解析失败，也就是不确定会有的字段一定要用optional。但是这就带来了一个问题，我们的服务器往往是不确定哪天会改字段名字，或者本来确定不会变的哪天就变了，所以为了安全起见，项目中如果使用最好都是optional，如果全是optional，使用起来就很麻烦，各种判断，这个问题我还没有更好的解决方案，如果你有更好的方案，欢迎联系我共同讨论。

使用YNCodable解析

    let responseList = ResponseList.decode(from: response)
其实这里也可以这么解析

    let list = [List].decode(from: response)
**2. 带keyPath的json串**

很多时候服务器返回的json串往往不是直接解析，需要取一层，有时候可能还要取多层，YNCodable提供了带keyPath的解析方式。如下json：

    let responseRes = """
                      {
                        "test": {
                          "res": {
                              "list": [
                                  {
                                    "title": "title1 ",
                                    "series": "series"
                                  },
                                  {
                                    "title": "title2"
                                  }
                              ]
                            }
                          }
                        }
                   """
这里还是解析list

    let responseListFromKeypath = ResponseList.decode(from: responseRes, keyPath: "test.res")
或者直接返回数组
    
    listFromKeyPath = [List].decode(from: responseRes, keyPath: "test.res.list")
# 要求
* Xcode9
* swift

# 安装
YNCodable不包含任何依赖
# CocoaPods
   
    # Podfile
	use_frameworks!
	
	target 'YOUR_TARGET_NAME' do
		pod 'YNCodable'
	end
	
在Podfile文件中替换 YOUR_TARGET_NAME 进入到项目目录执行

    $ pod install
 




