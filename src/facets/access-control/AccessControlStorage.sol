// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

library AccessControlStorage {
    bytes32 internal constant STORAGE_SLOT = keccak256("access-control.storage");

    struct Layout {
        mapping(address user => bytes32 roles) userRoles;
        mapping(bytes4 selector => bytes32 roles) functionRoles;
    }

    function layout() internal pure returns (Layout storage l) {
        bytes32 slot = STORAGE_SLOT;
        assembly {
            l.slot := slot
        }
    }
}
