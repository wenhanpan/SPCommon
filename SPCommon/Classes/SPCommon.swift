//
//  SPCommon
//
//  Created by sp on 2019/4/29.
//  Copyright © 2019年 Pan. All rights reserved.
//

public class SPCommon{
    //
    public static let spCommon = SPCommon()
    
}//end class

//MARK:- debug 输出
public func SPLog<T>(_ message: T,
                            file: String = #file,
                            method: String = #function,
                            line: Int = #line){
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

//MARK:- 存储本地变量
public func SPSetLocalObject(_ object:AnyObject, key:String) -> Void {
    //
    let defaults = UserDefaults.standard;
    defaults.set(object, forKey: key);
    defaults.synchronize();
}

public func SPGetLocalObject(_ key:String) -> AnyObject {
    
    let object = UserDefaults.standard.object(forKey: key);
    
    if (object == nil) {
        
        //
        return "0" as AnyObject;
    }
    else{
        
        return object as AnyObject;
    }
}

// MARK:- 颜色

/// RGBA的颜色设置
public func SPColor(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

/// 渐变色
///
/// - Parameters:
///   - view: 需要渐变色的view
///   - startcolor: 渐变的起始颜色
///   - endcolor: 渐变的结束颜色
public func SPGraduallyColor(_ view:UIView,startcolor:UIColor,endcolor:UIColor) {
    //再加一层view，否则会遮挡xib的控件
    let tView                   = UIView();
    tView.frame                 = CGRect(x: 0, y: 0, width: SPVIEW_W(view), height: SPVIEW_H(view));
    view.addSubview(tView);
    view.sendSubview(toBack: tView);
    
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    let gradientLayer           = CAGradientLayer();
    gradientLayer.frame         = tView.frame;
    tView.layer.addSublayer(gradientLayer);
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint    = CGPoint(x: 0, y: 0);
    gradientLayer.endPoint      = CGPoint(x: 0, y: 1);
    
    //设置颜色数组，设置颜色分割点（范围：0.3-1）
    gradientLayer.colors        = NSArray.init(objects: startcolor.cgColor,endcolor.cgColor) as [AnyObject];
    gradientLayer.locations     = NSArray.init(objects: NSNumber.init(value: 0.3 as Float),NSNumber.init(value: 1.0 as Float)) as? [NSNumber];
    
}

// MARK:- 屏幕

/// 屏幕的宽
public let SPSCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
public let SPSCREENH = UIScreen.main.bounds.size.height

///上
public func SPVIEW_TOP(_ view:UIView) -> CGFloat {
    return view.frame.origin.y;
}

///左
public func SPVIEW_LEFT(_ view:UIView) -> CGFloat {
    return view.frame.origin.x;
}

///下
public func SPVIEW_DOWN(_ view:UIView) -> CGFloat {
    return view.frame.origin.y+view.frame.size.height;
}

///右
public func SPVIEW_RIGHT(_ view:UIView) -> CGFloat {
    return view.frame.origin.x+view.frame.size.width;
}

///高
public func SPVIEW_H(_ view:UIView) -> CGFloat {
    return view.frame.size.height;
}

///宽
public func SPVIEW_W(_ view:UIView) -> CGFloat {
    return view.frame.size.width;
}
