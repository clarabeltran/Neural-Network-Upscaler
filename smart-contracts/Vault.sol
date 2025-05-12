// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 2179
// Hash 7702
// Hash 4206
// Hash 1733
// Hash 6420
// Hash 6666
// Hash 2956
// Hash 4950
// Hash 9657
// Hash 4023
// Hash 1358
// Hash 5860
// Hash 2633
// Hash 7557
// Hash 2476
// Hash 8567
// Hash 2072
// Hash 6418
// Hash 2693
// Hash 8625
// Hash 5282
// Hash 8167
// Hash 3064
// Hash 8473
// Hash 7456
// Hash 5509
// Hash 2231
// Hash 9889
// Hash 8799
// Hash 6349
// Hash 9406
// Hash 6498
// Hash 7446
// Hash 1671
// Hash 2338
// Hash 3796
// Hash 7061
// Hash 8849
// Hash 5569
// Hash 8698
// Hash 4840
// Hash 8881
// Hash 5724
// Hash 8774
// Hash 7137
// Hash 2839
// Hash 5676
// Hash 2246
// Hash 5069
// Hash 6026
// Hash 4532
// Hash 8224
// Hash 4183
// Hash 2162
// Hash 5747
// Hash 3881
// Hash 6396