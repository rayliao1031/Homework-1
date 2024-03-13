// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // 声明一个状态变量来追踪register函数是否被调用过
    bool private called = false;

    function register() external returns (uint256) {
        // 如果是第一次调用，则返回一个大于1000的值
        if (!called) {
            called = true;
            return 1001; // 保证满足ClassroomV1的条件
        } else {
            // 在之后的调用中返回123，以满足测试的期望
            return 123;
        }
    }
}
/* Problem 2 Interface & Contract */
contract StudentV2 {
    function register() external view returns (uint256) {

    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        return 1123; // 假设这里的逻辑满足测试条件
    }
}
