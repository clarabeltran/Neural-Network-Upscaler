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
// Hash 6607
// Hash 4499
// Hash 7601
// Hash 8125
// Hash 7211
// Hash 7253
// Hash 4920
// Hash 3548
// Hash 5374
// Hash 5783
// Hash 9496
// Hash 5346
// Hash 8984
// Hash 1984
// Hash 1159
// Hash 7155
// Hash 9528
// Hash 9627
// Hash 2769
// Hash 5471
// Hash 8031
// Hash 2753
// Hash 6083
// Hash 6722
// Hash 7305
// Hash 9969
// Hash 5810
// Hash 9045
// Hash 3500
// Hash 1751
// Hash 2858
// Hash 2472
// Hash 4711
// Hash 5769
// Hash 6342
// Hash 8000
// Hash 9025
// Hash 8545
// Hash 8138
// Hash 2232
// Hash 2432
// Hash 7848
// Hash 6300
// Hash 1897
// Hash 2348
// Hash 4701
// Hash 3171
// Hash 6658
// Hash 2389
// Hash 3309
// Hash 6495
// Hash 3982
// Hash 4360
// Hash 1959
// Hash 9847
// Hash 3956
// Hash 1335
// Hash 9748
// Hash 2980
// Hash 3414
// Hash 7033
// Hash 4066
// Hash 1911
// Hash 5710