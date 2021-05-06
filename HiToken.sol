pragma solidity ^0.4.18;

// import "../HiDollarsToken/SafeMath.sol";

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

contract Context {
    
    // constructor () internal { }
    
    function _msgSender() internal view returns (address) {
        return msg.sender;
    }

    function msgData() internal view  returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public  onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public  onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}


/**
 * @title 实现ERC20基本合约的接口 
 * @dev 基本的StandardToken，不包含allowances.
 */
contract BasicToken is IERC20 {
    using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;
  uint256 totalAllowedSupply_ = 11 * (10**11);

  /**
  * @dev 返回存在的token总数
  */
  function totalSupply() public view returns (uint256) {
    return totalSupply_;
  }

  /**
  * @dev 给特定的address转token
  * @param _to 要转账到的address
  * @param _value 要转账的金额
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    //做相关的合法验证
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    // msg.sender余额中减去额度，_to余额加上相应额度
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    //触发Transfer事件
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  /**
  * @dev 获取指定address的余额
  * @param _owner 查询余额的address.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public view returns (uint256) {
    return balances[_owner];
  }

}


/**
 * @title 标准 ERC20 token
 *
 * @dev 实现基础的标准token
 * @dev https://github.com/ethereum/EIPs/issues/20
 * @dev Based on code by FirstBlood: https://github.com/Firstbloodio/token/blob/master/smart_contract/FirstBloodToken.sol
 */
contract StandardToken is BasicToken {
  mapping (address => mapping (address => uint256)) internal allowed;

  /**
  * @dev 从一个地址向另外一个地址转token
  * @param _from 转账的from地址
  * @param _to address 转账的to地址
  * @param _value uint256 转账token数量
  */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
    // 做合法性检查
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    //_from余额减去相应的金额
    //_to余额加上相应的金额
    //msg.sender可以从账户_from中转出的数量减少_value
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    // 触发Transfer事件
    emit Transfer(_from, _to, _value);
    return true;
  }

  /**
  * @dev 批准传递的address以代表msg.sender花费指定数量的token
  *
  * Beware that changing an allowance with this method brings the risk that someone may use both the old
  * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
  * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
  * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
  * @param _spender 花费资金的地址
  * @param _value 可以被花费的token数量
  */
  function approve(address _spender, uint256 _value) public returns (bool) {
    //记录msg.sender允许_spender动用的token
    allowed[msg.sender][_spender] = _value;
    //触发Approval事件
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  /**
  * @dev 函数检查所有者允许的_spender花费的token数量
  * @param _owner address 资金所有者地址.
  * @param _spender address 花费资金的spender的地址.
  * @return A uint256 指定_spender仍可用token的数量。
  */
  function allowance(address _owner,address _spender) public view returns (uint256){
    //允许_spender从_owner中转出的token数
    return allowed[_owner][_spender];
  }

  /**
  * @dev 增加所有者允许_spender花费代币的数量。
  *
  * allowed[_spender] == 0时approve应该被调用. 增加allowed值最好使用此函数避免2此调用（等待知道第一笔交易被挖出）
  * From MonolithDAO Token.sol
  * @param _spender 花费资金的地址
  * @param _addedValue 用于增加允许动用的token牌数量
  */
  function increaseApproval(address _spender,uint _addedValue)  public returns (bool){
    //在之前允许的数量上增加_addedValue
    allowed[msg.sender][_spender] = (
      allowed[msg.sender][_spender].add(_addedValue));
    //触发Approval事件
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    
    return true;
  }

  /**
  * @dev 减少所有者允许_spender花费代币的数量
  *
  * allowed[_spender] == 0时approve应该被调用. 减少allowed值最好使用此函数避免2此调用（等待知道第一笔交易被挖出）
  * From MonolithDAO Token.sol
  * @param _spender  花费资金的地址
  * @param _subtractedValue 用于减少允许动用的token牌数量
  */
  function decreaseApproval(address _spender,uint _subtractedValue)  public  returns (bool){
    uint oldValue = allowed[msg.sender][_spender]; 
    if (_subtractedValue > oldValue) {
    //减少的数量少于之前允许的数量，则清零
      allowed[msg.sender][_spender] = 0;
    } else {
    //减少对应的_subtractedValue数量
      allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
    }
    //触发Approval事件
    emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
    
    return true;
  }

}


/**
*------------------可增发token----------------------------
*/
contract MintableToken is StandardToken, Ownable {
    
      event Mint(address indexed to, uint256 amount);
      event MintFinished();
      
      //初始化增发状态为false
      bool public mintingFinished = false;
    
      modifier canMint() {
        // 检查没有增发结束
        require(!mintingFinished);
        _;
      }
    
      modifier hasMintPermission() {
        //owner只能为msg.sender
        require(msg.sender == owner());
        _;
      }

      /**
      * @dev 增发token方法
      * @param _to 获取增发token的地址_to.
      * @param _amount 增发的token数量.
      * @return A boolean that indicates if the operation was successful.
      */
      function _mint(address _to,uint256 _amount) hasMintPermission canMint public returns (bool){
          
          if ( totalSupply_ < totalAllowedSupply_ ){
             // 总发行量增加_amount数量的token
            totalSupply_ = totalSupply_.add(_amount);
            // 获取增发的地址增加_amount数量的token
            balances[_to] = balances[_to].add(_amount);
            // 触发增发事件
            emit Mint(_to, _amount);
            // 触发Transfer事件
            emit Transfer(address(0), _to, _amount);
            return true;
            
          } else {
            // If the total circulation is greater than 1.1 trillion, the mint will not be allowed to continue. 
            return false;
          }
          
       
      }

      /**
      * @dev 停止增发新token.
      * @return True if the operation was successful.
      */
      function finishMinting() onlyOwner canMint public returns (bool) {
        // 改变增发状态为已完成
        mintingFinished = true;
        // 触发增发已完成事件
        emit MintFinished();
        return true;
      }
}


contract HiToken is MintableToken{
    
    using SafeMath for uint256;
    
    string public constant name = "HiDemoToken"; // solium-disable-line uppercase
    string public constant symbol = "HID"; // solium-disable-line uppercase
    uint8 public constant decimals = 18; // solium-disable-line uppercase
    
  
    uint256 private constant INITIAL_SUPPLY = 10 * (10**5) * (10 ** uint256(18));
  
     
    function HiToken() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        Transfer(0x0, msg.sender, INITIAL_SUPPLY);
     }
     
     
    
    function mint(address account, uint256 amount) public {
      _mint(account, amount);
    }
 
    
} 




