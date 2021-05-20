// Sources flattened with hardhat v2.3.0 https://hardhat.org

// File @openzeppelin/contracts/math/SafeMath.sol@v3.0.0

pragma solidity ^0.6.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


// File @openzeppelin/contracts/token/ERC20/IERC20.sol@v3.0.0

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


// File contracts/Dice.sol

pragma solidity >=0.6.0;


contract Dice {
  using SafeMath for uint256;
  
  struct Bet {
    address degen;
    uint256 amount;
    uint256 number;
  }

  address public owner;
  
  address public _booty;

  address public _bettingAsset;

  address public _foundationAddress;

  uint256 public _startBlock;

  uint256 public _endBlock;

  address[] public _players;

  uint256 DAY_IN_SECONDS = 86400;

  uint256 BLOCK_PER_SECOND = 2;

  bytes32 _hash;

  // map guess to addresses
  mapping(uint256 => address[]) public _guesses;

  // map guess to total bets
  mapping(uint256 => uint256) public _totals;

  mapping(address => Bet) public _bets;
  
  bool public _complete;

  constructor(address BOOTY, address foundationAddress) public {
    owner = msg.sender;
    _complete = true;
    _booty = BOOTY;
    _foundationAddress = foundationAddress;
  }
  
  function startRound(address bettingAsset, uint256 startBlock, uint256 endBlock, bytes32 hash) external onlyOwner {
        _complete = false;
        _startBlock = startBlock;
        _endBlock = endBlock;
        _hash = hash;
        _bettingAsset = bettingAsset;
  }

  function placeBet(uint256 number, uint256 amount) external {
    require(_complete == false, "placeBet: lottery already complete");
    require(_players.length <= 250, "placeBet: max players reached");
    
    require(IERC20(_booty).balanceOf(msg.sender) > 0.1 ether, "placeBet: balance not enough");
    require(IERC20(_bettingAsset).balanceOf(msg.sender) >= amount, "placeBet: betting asset amount not enough");
    
    require(IERC20(_booty).transferFrom(msg.sender, _foundationAddress, 0.1 ether), "placeBet: transfer failed");
    require(IERC20(_bettingAsset).transferFrom(msg.sender, address(this), amount), "placeBet: transfer failed");

    // add msg sender to players
    _players.push(msg.sender);
    // add bet to bets
    _bets[msg.sender] = Bet(msg.sender, amount, number);
    // add address to guesses
    _guesses[number].push(msg.sender);
    // increment totals
    _totals[number] += amount;
  }

  function settle(bytes32 rand) external onlyOwner {
    require(block.number >= _endBlock, "settle: round not finished");
    require(_complete == false, "settle: round already complete");
    
    uint256 winningNumber = ((block.difficulty * _random(rand)) % 6) + 1;

    uint256 pot = IERC20(_bettingAsset).balanceOf(address(this));
    uint256 winnerPot = pot.mul(9000).div(10000);

    address[] memory winners = _guesses[winningNumber];
    uint256 totalBet = _totals[winningNumber];

    if(winners.length > 0) {
        for(uint256 i = 0; i < winners.length; i++) {
          Bet memory winner = _bets[winners[i]];
          uint256 share = winnerPot.mul(winner.amount).div(totalBet);
          require(IERC20(_bettingAsset).transfer(winner.degen, share), "settle: winner transfer failed - 2");
        }
    }

    // settle fee
    uint256 feePot = IERC20(_bettingAsset).balanceOf(address(this));
    IERC20(_bettingAsset).transfer(_foundationAddress, feePot);

    _players = new address[](0);
    _complete = true;
    for(uint256 i = 0; i < 6; i++) {
      delete _guesses[i+1];
      delete _totals[i+1];
    }
  }

  function _random(bytes32 rand) internal view returns (uint256) {
    require(keccak256(abi.encodePacked(rand)) == _hash, "bytesToUint: hash not valid");
    return uint256(rand);
  }

  function getPlayers() external view returns (address[] memory) {
    return _players;
  }

  function countPlayer() external view returns (uint256) {
    return _players.length;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}
