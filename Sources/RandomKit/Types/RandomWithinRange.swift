//
//  RandomWithinRange.swift
//  RandomKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015-2017 Nikolai Vazquez
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

/// A type that can generate an optional random value from within a range.
public protocol RandomWithinRange: Comparable {

    /// Returns an optional random value of `Self` inside of the range using `randomGenerator`.
    static func random<R: RandomGenerator>(within range: Range<Self>, using randomGenerator: inout R) -> Self?

}

extension RandomWithinRange where Self: Strideable & Comparable, Self.Stride : SignedInteger {

    /// Returns an optional random value of `Self` inside of the range.
    public static func random<R: RandomGenerator>(within range: CountableRange<Self>,
                                                  using randomGenerator: inout R) -> Self? {
        return random(within: Range(range), using: &randomGenerator)
    }

}
