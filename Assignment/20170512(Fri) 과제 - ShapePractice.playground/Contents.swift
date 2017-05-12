//: Playground - noun: a place where people can play

import UIKit

//(정)사각형의 넓이 구하는 함수 만들기
//argument : width(가로), length(세로).
func make(square width:Int, length:Int) -> Int{
    let result:Int = width * length
    
    return result
}
print(make(square: 4, length: 8)) // = 32



//원의 넓이 구하는 함수 만들기
//argument : radius(반지름)
func make(circle radius:Int) -> Double{
    let result:Double = 3.14 * Double(radius) * Double(radius)
    
    return result
}
print(make(circle: 10)) // = 314.0



//삼각형의 넓이 구하는 함수 만들기
//argument : base(밑변), height(높이)
func make(triangle base:Int, height:Int) -> Double{
    let result:Double = 0.5 * Double(base) * Double(height)
    
    return result
}
print(make(triangle: 2, height: 4))



//사다리꼴의 넓이 구하는 함수 만들기
//argument : base(밑변), top(윗변), height(높이)
func make(trapezoid base:Double, top:Double, height:Double) -> Double{
    return ( (base + top) * height / 2 )
}
print(make(trapezoid: 5, top: 5, height: 2))



//(정)육면체의 부피 구하는 함수 만들기
//argument: width(가로), length(세로), height(높이)
func make(cube width:Double, length:Double, height:Double) -> Double{
    return (width*length*height)
}
print(make(cube: 2, length: 2, height: 2))



//원기둥의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
func make(cylinder radius:Double, height:Double) -> Double{
    return (radius*radius*3.14 * height)
}
print(make(cylinder: 2, height: 2))


//구체의 부피 구하는 함수 만들기
//argument : radius(반지름)
func make(sphere radius:Double) -> Double{
    return ( 4/3 * 3.14 * radius*radius )
}
print(make(sphere: 3))


//원뿔의 부피 구하는 함수 만들기
//argument: radius(반지름), height(높이)
func make(cone radius:Double, height:Double) -> Double{
    return (radius*radius*3.14 * height/3)
}
print(make(cone: 2, height: 3))


