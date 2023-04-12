// Sources flattened with hardhat v2.7.0 https://hardhat.org

// File contracts/libraries/math/SafeMath.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

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
     *
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
     *
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
     *
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
     *
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
     *
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
     *
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
     *
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
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


// File contracts/libraries/token/IERC20.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

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


// File contracts/libraries/utils/Address.sol

// SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.3._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.3._
     */
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


// File contracts/libraries/token/SafeERC20.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;



/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


// File contracts/libraries/Events.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
library Events {
    /* BasePositionManager Events */
    event SetDepositFee(uint256 depositFee);
    event SetIncreasePositionBufferBps(uint256 increasePositionBufferBps);
    event SetReferralStorage(address referralStorage);
    event SetAdmin(address admin);
    event WithdrawFees(address token, address receiver, uint256 amount);
    event SetMaxGlobalSizes(address[] tokens, uint256[] longSizes, uint256[] shortSizes);
    event IncreasePositionReferral(address account, uint256 sizeDelta, uint256 marginFeeBasisPoints, bytes32 referralCode, address referrer);
    event DecreasePositionReferral(address account, uint256 sizeDelta, uint256 marginFeeBasisPoints, bytes32 referralCode, address referrer);
    /*Position Manager Events*/
    event SetOrderKeeper(address indexed account, bool isActive);
    event SetLiquidator(address indexed account, bool isActive);
    event SetPartner(address account, bool isActive);
    event SetOpened(bool opened);
    event SetShouldValidateIncreaseOrder(bool shouldValidateIncreaseOrder);
    /* Orderbook.sol events */
    event CreateIncreaseOrder(
        address indexed account, uint256 orderIndex,
        address purchaseToken, uint256 purchaseTokenAmount,
        address collateralToken, address indexToken,
        uint256 sizeDelta, bool isLong, uint256 triggerPrice,
        bool triggerAboveThreshold, uint256 executionFee);
    event CancelIncreaseOrder(
        address indexed account, uint256 orderIndex,
        address purchaseToken, uint256 purchaseTokenAmount,
        address collateralToken, address indexToken,
        uint256 sizeDelta, bool isLong, uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee);
    event ExecuteIncreaseOrder(
        address indexed account, uint256 orderIndex,
        address purchaseToken, uint256 purchaseTokenAmount,
        address collateralToken, address indexToken, uint256 sizeDelta,
        bool isLong, uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee, uint256 executionPrice);
    event UpdateIncreaseOrder(
        address indexed account, uint256 orderIndex,
        address collateralToken, address indexToken,
        bool isLong, uint256 sizeDelta, uint256 triggerPrice, bool triggerAboveThreshold);
    event CreateDecreaseOrder(address indexed account, uint256 orderIndex, address collateralToken, uint256 collateralDelta, address indexToken, uint256 sizeDelta, bool isLong, uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee);
    event CancelDecreaseOrder(
        address indexed account, uint256 orderIndex,
        address collateralToken, uint256 collateralDelta, address indexToken,
        uint256 sizeDelta, bool isLong, uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee);
    event ExecuteDecreaseOrder(
        address indexed account, uint256 orderIndex,
        address collateralToken, uint256 collateralDelta,
        address indexToken, uint256 sizeDelta, bool isLong,
        uint256 triggerPrice, bool triggerAboveThreshold, uint256 executionFee, uint256 executionPrice);
    event UpdateDecreaseOrder(
        address indexed account, uint256 orderIndex,
        address collateralToken, uint256 collateralDelta,
        address indexToken, uint256 sizeDelta, bool isLong, uint256 triggerPrice, bool triggerAboveThreshold);
    event CreateSwapOrder(
        address indexed account, uint256 orderIndex,
        address[] path, uint256 amountIn, uint256 minOut,
        uint256 triggerRatio, bool triggerAboveThreshold, bool shouldUnwrap, uint256 executionFee);
    event CancelSwapOrder(
        address indexed account, uint256 orderIndex,
        address[] path, uint256 amountIn, uint256 minOut,
        uint256 triggerRatio, bool triggerAboveThreshold, bool shouldUnwrap, uint256 executionFee);
    event UpdateSwapOrder(
        address indexed account, uint256 ordexIndex, address[] path, uint256 amountIn, uint256 minOut, uint256 triggerRatio, bool triggerAboveThreshold, bool shouldUnwrap, uint256 executionFee);
    event ExecuteSwapOrder(
        address indexed account, uint256 orderIndex,
        address[] path, uint256 amountIn, uint256 minOut,
        uint256 amountOut, uint256 triggerRatio,
        bool triggerAboveThreshold, bool shouldUnwrap, uint256 executionFee);
    event Initialize(
        address router, address vault, address weth,
        address zkusd, uint256 minExecutionFee, uint256 minPurchaseTokenAmountUsd);
    event UpdateMinExecutionFee(uint256 minExecutionFee);
    event UpdateMinPurchaseTokenAmountUsd(uint256 minPurchaseTokenAmountUsd);
    event UpdateGov(address gov);
    /* Router.sol events*/
    event Swap(address account, address tokenIn, address tokenOut, uint256 amountIn, uint256 amountOut);
    /* ShortsTracker.sol events*/
    event GlobalShortDataUpdated(address indexed token, uint256 globalShortSize, uint256 globalShortAveragePrice);
    /* Vault.sol events */
    event BuyZKUSD(
        address account, address token,
        uint256 tokenAmount, uint256 zkusdAmount, uint256 feeBasisPoints);
    event SellZKUSD(
        address account, address token,
        uint256 zkusdAmount, uint256 tokenAmount, uint256 feeBasisPoints);
    event Swap(
        address account, address tokenIn,
        address tokenOut, uint256 amountIn,
        uint256 amountOut, uint256 amountOutAfterFees,
        uint256 feeBasisPoints);
    event IncreasePosition(
        bytes32 key, address account,
        address collateralToken, address indexToken,
        uint256 collateralDelta, uint256 sizeDelta,
        bool isLong, uint256 price, uint256 fee);
    event DecreasePosition(
        bytes32 key, address account,
        address collateralToken, address indexToken,
        uint256 collateralDelta, uint256 sizeDelta,
        bool isLong, uint256 price, uint256 fee);
    event LiquidatePosition(
        bytes32 key, address account, address collateralToken,
        address indexToken, bool isLong, uint256 size,
        uint256 collateral, uint256 reserveAmount, int256 realisedPnl, uint256 markPrice);
    event UpdatePosition(
        bytes32 key, uint256 size, uint256 collateral,
        uint256 averagePrice, uint256 entryFundingRate,
        uint256 reserveAmount, int256 realisedPnl, uint256 markPrice);
    event ClosePosition(
        bytes32 key, uint256 size, uint256 collateral,
        uint256 averagePrice, uint256 entryFundingRate, uint256 reserveAmount, int256 realisedPnl);
    event UpdateFundingRate(address token, uint256 fundingRate);
    event UpdatePnl(bytes32 key, bool hasProfit, uint256 delta);
    event CollectSwapFees(address token, uint256 feeUsd, uint256 feeTokens);
    event CollectMarginFees(address token, uint256 feeUsd, uint256 feeTokens);
    event DirectPoolDeposit(address token, uint256 amount);
    event IncreasePoolAmount(address token, uint256 amount);
    event DecreasePoolAmount(address token, uint256 amount);
    event IncreaseZkusdAmount(address token, uint256 amount);
    event DecreaseZkusdAmount(address token, uint256 amount);
    event IncreaseReservedAmount(address token, uint256 amount);
    event DecreaseReservedAmount(address token, uint256 amount);
    event IncreaseGuaranteedUsd(address token, uint256 amount);
    event DecreaseGuaranteedUsd(address token, uint256 amount);
    /* Timelock.sol events */
    event SignalPendingAction(bytes32 action);
    event SignalApprove(address token, address spender, uint256 amount, bytes32 action);
    event SignalWithdrawToken(address target, address token, address receiver, uint256 amount, bytes32 action);
    event SignalMint(address token, address receiver, uint256 amount, bytes32 action);
    event SignalSetGov(address target, address gov, bytes32 action);
    event SignalSetHandler(address target, address handler, bool isActive, bytes32 action);
    event SignalSetPriceFeed(address vault, address priceFeed, bytes32 action);
    event SignalRedeemZkusd(address vault, address token, uint256 amount);
    event SignalVaultSetTokenConfig(
        address vault, address token, uint256 tokenDecimals,
        uint256 tokenWeight, uint256 minProfitBps, uint256 maxZkusdAmount,
        bool isStable, bool isShortable);
    event ClearAction(bytes32 action);
    /* ZkdlpManager.sol */
    event AddLiquidity(address account, address token, uint256 amount, uint256 aumInUsd, uint256 zkdlpSupply, uint256 zkusdAmount, uint256 mintAmount);
    event RemoveLiquidity(address account, address token, uint256 zkdlpAmount, uint256 aumInUsd, uint256 zkdlpSupply, uint256 zkusdAmount, uint256 amountOut);
    /* RewardRouterV2 */
    event StakeZkdx(address account, address token, uint256 amount);
    event UnstakeZkdx(address account, address token, uint256 amount);
    event StakeZkdlp(address account, uint256 amount);
    event UnstakeZkdlp(address account, uint256 amount);
}


// File contracts/libraries/Errors.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
library Errors {
    /* Timelock Error Message*/
    string public constant Timelock_Invalid_Target = "Timelock: invalid _target";
    string public constant Timelock_Invalid_Buffer = "Timelock: invalid _buffer";
    string public constant Timelock_Buffer_Cannot_Be_Decreased = "Timelock: buffer cannot be decreased";
    string public constant Timelock_invalid_maxLeverage = "Timelock: invalid _maxLeverage";
    string public constant Timelock_invalid_fundingRateFactor = "Timelock: invalid _fundingRateFactor";
    string public constant Timelock_invalid_stableFundingRateFactor = "Timelock: invalid _stableFundingRateFactor";
    string public constant Timelock_invalid_minProfitBps = "Timelock: invalid _minProfitBps";
    string public constant Timelock_token_not_yet_whitelisted = "Timelock: token not yet whitelisted";
    string public constant TIMELOCK_INVALID_MAXGASPRICE = "Invalid _maxGasPrice";
    string public constant TIMELOCK_INVALID_LENGTHS = "Timelock: invalid lengths";
    string public constant TIMELOCK_MAXTOKENSUPPLY_EXCEEDED = "Timelock: maxTokenSupply exceeded";
    string public constant TIMELOCK_ACTION_ALREADY_SIGNALLED = "Timelock: action already signalled";
    string public constant TIMELOCK_ACTION_NOT_SIGNALLED = "Timelock: action not signalled";
    string public constant TIMELOCK_ACTION_TIME_NOT_YET_PASSED = "Timelock: action time not yet passed";
    string public constant TIMELOCK_INVALID_ACTION = "Timelock: invalid _action";
    string public constant TIMELOCK_INVALID_BUFFER = "Timelock: invalid _buffer";
    /* PriceFeed Error Message*/
    string public constant PriceFeed_forbidden = "PriceFeed: forbidden";
    /* ZKUSD.sol*/
    string public constant ZKUSD_FORBIDDEN = "ZKUSD: forbidden";
    /* BasePositionManagers.sol */
    string public constant BASEPOSITIONMANAGER_MARK_PRICE_LOWER_THAN_LIMIT      = "BasePositionManager: mark price lower than limit";
    string public constant BASEPOSITIONMANAGER_MARK_PRICE_HIGHER_THAN_LIMIT     = "BasePositionManager: mark price higher than limit";
    string public constant BASEPOSITIONMANAGER_INVALID_PATH_LENGTH              = "BasePositionManager: invalid _path.length";
    string public constant BASEPOSITIONMANAGER_INSUFFICIENT_AMOUNTOUT           = "BasePositionManager: insufficient amountOut";
    string public constant BASEPOSITIONMANAGER_MAX_GLOBAL_LONGS_EXCEEDED        = "BasePositionManager: max global longs exceeded";
    string public constant BASEPOSITIONMANAGER_MAX_GLOBAL_SHORTS_EXCEEDED       = "BasePositionManager: max global shorts exceeded";
    string public constant BASEPOSITIONMANAGER_INVALID_SENDER                   = "BasePositionManager: invalid sender";
    /* PositionManager.sol */
    string public constant POSITIONMANAGER_INVALID_PATH_LENGTH                  = "PositionManager: invalid _path.length";
    string public constant POSITIONMANAGER_INVALID_PATH                         = "PositionManager: invalid _path";
    string public constant POSITIONMANAGER_LONG_DEPOSIT                         = "PositionManager: long deposit";
    string public constant POSITIONMANAGER_LONG_LEVERAGE_DECREASE               = "PositionManager: long leverage decrease";
    string public constant POSITIONMANAGER_FORBIDDEN                            = "PositionManager: forbidden";
    /* Router.sol*/
    string public constant ROUTER_FORBIDDEN                                     = "Router: forbidden";
    /* ZkdlpManager.sol */
    string public constant ZKDLPMANAGER_ACTION_NOT_ENABLED                      = "ZkdlpManager: action not enabled";
    string public constant ZKDLPMANAGER_INVALID_WEIGHT                          = "ZkdlpManager: invalid weight";
    string public constant ZKDLPMANAGER_INVALID_COOLDOWNDURATION                = "ZkdlpManager: invalid _cooldownDuration";
    string public constant ZKDLPMANAGER_INVALID_AMOUNT                          = "ZkdlpManager: invalid _amount";
    string public constant ZKDLPMANAGER_INSUFFICIENT_ZKUSD_OUTPUT               = "ZkdlpManager: insufficient ZKUSD output";
    string public constant ZKDLPMANAGER_INSUFFICIENT_ZKDLP_OUTPUT               = "ZkdlpManager: insufficient ZKDLP output";
    string public constant ZKDLPMANAGER_INVALID_ZKDLPAMOUNT                     = "ZkdlpManager: invalid _ZKDLPAmount";
    string public constant ZKDLPMANAGER_COOLDOWN_DURATION_NOT_YET_PASSED        = "ZkdlpManager: cooldown duration not yet passed";
    string public constant ZKDLPMANAGER_INSUFFICIENT_OUTPUT                     = "ZkdlpManager: insufficient output";
    string public constant ZKDLPMANAGER_FORBIDDEN                               = "ZkdlpManager: forbidden";
    /* ShortsTrack.sol*/
    string public constant SHORTSTRACKER_FORBIDDEN                              = "ShortsTracker: forbidden";
    string public constant SHORTSTRACKER_INVALID_HANDLER                        = "ShortsTracker: invalid _handler";
    string public constant SHORTSTRACKER_ALREADY_MIGRATED                       = "ShortsTracker: already migrated";
    string public constant SHORTSTRACKER_OVERFLOW                               = "ShortsTracker: overflow";
    /* VaultUtils.sol*/
    string public constant VAULT_LOSSES_EXCEED_COLLATERAL                       = "Vault: losses exceed collateral";
    string public constant VAULT_FEES_EXCEED_COLLATERAL                         = "Vault: fees exceed collateral";
    string public constant VAULT_LIQUIDATION_FEES_EXCEED_COLLATERAL             = "Vault: liquidation fees exceed collateral";
    string public constant VAULT_MAXLEVERAGE_EXCEEDED                           = "Vault: maxLeverage exceeded";
    /* VaultPriceFeed.sol*/
    string public constant VAULTPRICEFEED_FORBIDDEN                             = "VaultPriceFeed: forbidden";
    string public constant VAULTPRICEFEED_ADJUSTMENT_FREQUENCY_EXCEEDED         = "VaultPriceFeed: adjustment frequency exceeded";
    string public constant VAULTPRICEFEED_INVALID_ADJUSTMENTBPS                 = "Vaultpricefeed: invalid _adjustmentBps";
    string public constant VAULTPRICEFEED_INVALID_SPREADBASISPOINTS             = "VaultPriceFeed: invalid _spreadBasisPoints";
    string public constant VAULTPRICEFEED_INVALID_PRICESAMPLESPACE              = "VaultPriceFeed: invalid _priceSampleSpace";
    string internal constant VAULTPRICEFEED_INVALID_PRICE_FEED                  = "VaultPriceFeed: invalid price feed";
    string internal constant VAULTPRICEFEED_INVALID_PRICE                       = "VaultPriceFeed: invalid price";
    string internal constant CHAINLINK_FEEDS_ARE_NOT_BEING_UPDATED              = "Chainlink feeds are not being updated";
    string internal constant VAULTPRICEFEED_COULD_NOT_FETCH_PRICE               = "VaultPriceFeed: could not fetch price";
    /* VaultInternal.sol*/
    string internal constant VAULT_POOLAMOUNT_EXCEEDED                          = "Vault: poolAmount exceeded";
    string internal constant VAULT_INSUFFICIENT_RESERVE                         = "Vault: insufficient reserve";
    string internal constant VAULT_MAX_SHORTS_EXCEEDED                          = "Vault: max shorts exceeded";
    string internal constant VAULT_POOLAMOUNT_BUFFER                            = "Vault: poolAmount < buffer";
    string internal constant VAULT_INVALID_ERRORCONTROLLER                      = "Vault: invalid errorController";
    /* Router.sol */
    string internal constant ROUTER_INVALID_SENDER                              = "Router: invalid sender";
    string internal constant ROUTER_INVALID_PATH                                = "Router: invalid _path";
    string internal constant ROUTER_MARK_PRICE_HIGHER_THAN_LIMIT                = "Router: mark price higher than limit";
    string internal constant ROUTER_MARK_PRICE_LOWER_THAN_LIMIT                 = "Router: mark price lower than limit";
    string internal constant ROUTER_INVALID_PATH_LENGTH                         = "Router: invalid _path.length";
    string internal constant ROUTER_INSUFFICIENT_AMOUNTOUT                      = "Router: insufficient amountOut";
    string internal constant ROUTER_INVALID_PLUGIN                              = "Router: invalid plugin";
    string internal constant ROUTER_PLUGIN_NOT_APPROVED                         = "Router: plugin not approved";
    /* OrderBook.sol*/
    string internal constant ORDERBOOK_FORBIDDEN                                = "OrderBook: forbidden";
    string internal constant ORDERBOOK_ALREADY_INITIALIZED                      = "OrderBook: already initialized";
    string internal constant ORDERBOOK_INVALID_SENDER                           = "OrderBook: invalid sender";
    string internal constant ORDERBOOK_INVALID_PATH_LENGTH                      = "OrderBook: invalid _path.length";
    string internal constant ORDERBOOK_INVALID_PATH                             = "OrderBook: invalid _path";
    string internal constant ORDERBOOK_INVALID_AMOUNTIN                         = "OrderBook: invalid _amountIn";
    string internal constant ORDERBOOK_INSUFFICIENT_EXECUTION_FEE               = "OrderBook: insufficient execution fee";
    string internal constant ORDERBOOK_ONLY_WETH_COULD_BE_WRAPPED               = "OrderBook: only weth could be wrapped";
    string internal constant ORDERBOOK_INCORRECT_VALUE_TRANSFERRED              = "OrderBook: incorrect value transferred";
    string internal constant ORDERBOOK_INCORRECT_EXECUTION_FEE_TRANSFERRED      = "OrderBook: incorrect execution fee transferred";
    string internal constant ORDERBOOK_NON_EXISTENT_ORDER                       = "OrderBook: non-existent order";
    string internal constant ORDERBOOK_INVALID_PRICE_FOR_EXECUTION              = "OrderBook: invalid price for execution";
    string internal constant ORDERBOOK_INSUFFICIENT_COLLATERAL                  = "OrderBook: insufficient collateral";
    string internal constant ORDERBOOK_INSUFFICIENT_AMOUNTOUT                   = "OrderBook: insufficient amountOut";
    /* RewardRouterV2.sol */
    string internal constant REWARDROUTER_INVALID_AMOUNT                        = "RewardRouter: invalid _amount";
    string internal constant REWARDROUTER_INVALID_MSG_VALUE                     = "RewardRouter: invalid msg.value";
    string internal constant REWARDROUTER_ALREADY_INITIALIZED                   = "RewardRouter: already initialized";
    string internal constant REWARDROUTER_INVALID_ZKUSDAMOUNT                   = "RewardRouter: invalid _zkusdAmount";

    /* YieldToken.sol */
    string public constant YIELDTOKEN_ACCOUNT_ALREADY_MARKED                    = "YieldToken: _account already marked";
    string public constant YIELDTOKEN_ACCOUNT_NOT_MARKED                        = "YieldToken: _account not marked";
    string public constant YIELDTOKEN_TRANSFER_AMOUNT_EXCEEDS_ALLOWANCE         = "YieldToken: transfer amount exceeds allowance";
    string public constant YIELDTOKEN_MINT_TO_THE_ZERO_ADDRESS                  = "YieldToken: mint to the zero address";
    string public constant YIELDTOKEN_BURN_FROM_THE_ZERO_ADDRESS                = "YieldToken: burn from the zero address";
    string public constant YIELDTOKEN_BURN_AMOUNT_EXCEEDS_BALANCE               = "YieldToken: burn amount exceeds balance";
    string public constant YIELDTOKEN_TRANSFER_FROM_THE_ZERO_ADDRESS            = "YieldToken: transfer from the zero address";
    string public constant YIELDTOKEN_TRANSFER_TO_THE_ZERO_ADDRESS              = "YieldToken: transfer to the zero address";
    string public constant YIELDTOKEN_MSG_SENDER_NOT_WHITELISTED                = "YieldToken: msg.sender not whitelisted";
    string public constant YIELDTOKEN_TRANSFER_AMOUNT_EXCEEDS_BALANCE           = "YieldToken: transfer amount exceeds balance";
    string public constant YIELDTOKEN_APPROVE_FROM_THE_ZERO_ADDRESS             = "YieldToken: approve from the zero address";
    string public constant YIELDTOKEN_APPROVE_TO_THE_ZERO_ADDRESS               = "YieldToken: approve to the zero address";

    string public constant MINTABLEBASETOKEN_FORBIDDEN                          = "MintableBaseToken: forbidden";
    string public constant BASETOKEN_FORBIDDEN                                  = "BaseToken: forbidden";
    string public constant BASETOKEN_ACCOUNT_ALREADY_MARKED                     = "BaseToken: _account already marked";
    string public constant BASETOKEN_ACCOUNT_NOT_MARKED                         = "BaseToken: _account not marked";
    string public constant BASETOKEN_TRANSFER_AMOUNT_EXCEEDS_ALLOWANCE          = "BaseToken: transfer amount exceeds allowance";
    string public constant BASETOKEN_MINT_TO_THE_ZERO_ADDRESS                   = "BaseToken: mint to the zero address";
    string public constant BASETOKEN_BURN_FROM_THE_ZERO_ADDRESS                 = "BaseToken: burn from the zero address";
    string public constant BASETOKEN_BURN_AMOUNT_EXCEEDS_BALANCE                = "BaseToken: burn amount exceeds balance";
    string public constant BASETOKEN_TRANSFER_FROM_THE_ZERO_ADDRESS             = "BaseToken: transfer from the zero address";
    string public constant BASETOKEN_TRANSFER_TO_THE_ZERO_ADDRESS               = "BaseToken: transfer to the zero address";
    string public constant BASETOKEN_MSG_SENDER_NOT_WHITELISTED                 = "BaseToken: msg.sender not whitelisted";
    string public constant BASETOKEN_TRANSFER_AMOUNT_EXCEEDS_BALANCE            = "BaseToken: transfer amount exceeds balance";
    string public constant BASETOKEN_APPROVE_FROM_THE_ZERO_ADDRESS              = "BaseToken: approve from the zero address";
    string public constant BASETOKEN_APPROVE_TO_THE_ZERO_ADDRESS                = "BaseToken: approve to the zero address";
}


// File contracts/libraries/Constants.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
library Constants {
    /* BASE */
    string public constant ZKDX_ID = "ZKDX";
    string public constant ZKDX_TOKEN_NAME = "ZKDX";
    string public constant ZKDX_TOKEN_SYMBOL = "ZKDX";
    string public constant ZKDLP_ID = "ZKDLP";
    string public constant ZKDLP_TOKEN_NAME = "ZKDLP";
    string public constant ZKDLP_TOKEN_SYMBOL = "ZKDLP";

    string public constant ZKUSD_TOKEN_NAME = "ZKUSD";
    string public constant ZKUSD_TOKEN_SYMBOL = "ZKUSD";
    /* VaultPriceFeed.sol */
    uint256 public constant PRICE_PRECISION = 10 ** 30;
    uint256 public constant ONE_USD = PRICE_PRECISION;
    uint256 public constant BASIS_POINTS_DIVISOR = 10000;
    uint256 public constant MAX_SPREAD_BASIS_POINTS = 50;
    uint256 public constant MAX_ADJUSTMENT_INTERVAL = 2 hours;
    uint256 public constant MAX_ADJUSTMENT_BASIS_POINTS = 20;
    address constant internal FLAG_ARBITRUM_SEQ_OFFLINE = address(bytes20(bytes32(uint256(keccak256("chainlink.flags.arbitrum-seq-offline")) - 1)));
    /* VaultUtils.sol */
    uint256 public constant FUNDING_RATE_PRECISION = 1000000;

    /* Vault.sol*/
    uint256 public constant MIN_LEVERAGE = 10000; // 1x
    uint256 public constant ZKUSD_DECIMALS = 18;
    uint256 public constant MAX_FEE_BASIS_POINTS = 500; // 5%
    uint256 public constant MAX_LIQUIDATION_FEE_USD = 100 * PRICE_PRECISION; // 100 USD
    uint256 public constant MIN_FUNDING_RATE_INTERVAL = 1 hours;
    uint256 public constant MAX_FUNDING_RATE_FACTOR = 10000; // 1%

    /* OrderBook.sol */
    uint256 public constant ZKUSD_PRECISION = 1e18;

    /* ZKDLP.sol */
    uint256 public constant ZKDLP_PRECISION = 10 ** 18;
    uint256 public constant MAX_COOLDOWN_DURATION = 48 hours;

    /* ShortsTracker */
    uint256 public constant MAX_INT256 = uint256(type(int256).max);
}


// File contracts/libraries/utils/ReentrancyGuard.sol

// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor () internal {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and make it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        // On the first call to nonReentrant, _notEntered will be true
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;

        _;

        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}


// File contracts/core/interfaces/IVaultUtils.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IVaultUtils {
    function updateCumulativeFundingRate(
        address _collateralToken, address _indexToken) external returns (bool);
    function validateIncreasePosition(
        address _account, address _collateralToken,
        address _indexToken, uint256 _sizeDelta, bool _isLong) external view;
    function validateDecreasePosition(
        address _account, address _collateralToken,
        address _indexToken, uint256 _collateralDelta,
        uint256 _sizeDelta, bool _isLong, address _receiver) external view;
    function validateLiquidation(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong, bool _raise) external view returns (uint256, uint256);
    function getEntryFundingRate(
        address _collateralToken, address _indexToken, bool _isLong) external view returns (uint256);
    function getPositionFee(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong, uint256 _sizeDelta) external view returns (uint256);
    function getFundingFee(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong,
        uint256 _size, uint256 _entryFundingRate) external view returns (uint256);
    function getBuyZkusdFeeBasisPoints(
        address _token, uint256 _zkusdAmount) external view returns (uint256);
    function getSellZkusdFeeBasisPoints(
        address _token, uint256 _zkusdAmount) external view returns (uint256);
    function getSwapFeeBasisPoints(
        address _tokenIn, address _tokenOut, uint256 _zkusdAmount) external view returns (uint256);
    function getFeeBasisPoints(
        address _token, uint256 _zkusdDelta,
        uint256 _feeBasisPoints, uint256 _taxBasisPoints,
        bool _increment) external view returns (uint256);
}


// File contracts/core/interfaces/IVault.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IVault {
    function withdrawFees(address _token, address _receiver) external returns (uint256);
    function directPoolDeposit(address _token) external;
    function buyZKUSD(address _token, address _receiver) external returns (uint256);
    function sellZKUSD(address _token, address _receiver) external returns (uint256);
    function swap(address _tokenIn, address _tokenOut, address _receiver) external returns (uint256);
    function increasePosition(
        address _account, address _collateralToken,
        address _indexToken, uint256 _sizeDelta, bool _isLong) external;
    function decreasePosition(
        address _account, address _collateralToken,
        address _indexToken, uint256 _collateralDelta,
        uint256 _sizeDelta, bool _isLong, address _receiver) external returns (uint256);
    function validateLiquidation(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong, bool _raise) external view returns (uint256, uint256);
    function liquidatePosition(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong, address _feeReceiver) external;

    function tokenToUsdMin(address _token, uint256 _tokenAmount) external view returns (uint256);
    function priceFeed() external view returns (address);
    function fundingRateFactor() external view returns (uint256);
    function stableFundingRateFactor() external view returns (uint256);
    function cumulativeFundingRates(address _token) external view returns (uint256);
    function getNextFundingRate(address _token) external view returns (uint256);
    function getFeeBasisPoints(
        address _token, uint256 _zkusdDelta,
        uint256 _feeBasisPoints, uint256 _taxBasisPoints, bool _increment) external view returns (uint256);
    function liquidationFeeUsd() external view returns (uint256);
    function taxBasisPoints() external view returns (uint256);
    function stableTaxBasisPoints() external view returns (uint256);
    function mintBurnFeeBasisPoints() external view returns (uint256);
    function swapFeeBasisPoints() external view returns (uint256);
    function stableSwapFeeBasisPoints() external view returns (uint256);
    function marginFeeBasisPoints() external view returns (uint256);
    function allWhitelistedTokensLength() external view returns (uint256);
    function allWhitelistedTokens(uint256) external view returns (address);
    function whitelistedTokens(address _token) external view returns (bool);
    function stableTokens(address _token) external view returns (bool);
    function shortableTokens(address _token) external view returns (bool);
    function feeReserves(address _token) external view returns (uint256);
    function globalShortSizes(address _token) external view returns (uint256);
    function globalShortAveragePrices(address _token) external view returns (uint256);
    function maxGlobalShortSizes(address _token) external view returns (uint256);
    function tokenDecimals(address _token) external view returns (uint256);
    function tokenWeights(address _token) external view returns (uint256);
    function guaranteedUsd(address _token) external view returns (uint256);
    function poolAmounts(address _token) external view returns (uint256);
    function bufferAmounts(address _token) external view returns (uint256);
    function reservedAmounts(address _token) external view returns (uint256);
    function zkusdAmounts(address _token) external view returns (uint256);
    function maxZkusdAmounts(address _token) external view returns (uint256);
    function getRedemptionAmount(address _token, uint256 _zkusdAmount) external view returns (uint256);
    function getMaxPrice(address _token) external view returns (uint256);
    function getMinPrice(address _token) external view returns (uint256);
    function getDelta(
        address _indexToken, uint256 _size,
        uint256 _averagePrice, bool _isLong, uint256 _lastIncreasedTime) external view returns (bool, uint256);
    function getPosition(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong) external view returns (uint256, uint256, uint256, uint256, uint256, uint256, bool, uint256);
    function isInitialized() external view returns (bool);
    function isSwapEnabled() external view returns (bool);
    function isLeverageEnabled() external view returns (bool);
    function router() external view returns (address);
    function zkusd() external view returns (address);
    function gov() external view returns (address);
    function whitelistedTokenCount() external view returns (uint256);
    function maxLeverage() external view returns (uint256);
    function minProfitTime() external view returns (uint256);
    function hasDynamicFees() external view returns (bool);
    function fundingInterval() external view returns (uint256);
    function totalTokenWeights() external view returns (uint256);
    function getTargetZkusdAmount(address _token) external view returns (uint256);
    function inManagerMode() external view returns (bool);
    function inPrivateLiquidationMode() external view returns (bool);
    function maxGasPrice() external view returns (uint256);
    function approvedRouters(address _account, address _router) external view returns (bool);
    function isLiquidator(address _account) external view returns (bool);
    function isManager(address _account) external view returns (bool);
    function minProfitBasisPoints(address _token) external view returns (uint256);
    function tokenBalances(address _token) external view returns (uint256);
    function lastFundingTimes(address _token) external view returns (uint256);

    function setMaxLeverage(uint256 _maxLeverage) external;
    function setInManagerMode(bool _inManagerMode) external;
    function setManager(address _manager, bool _isManager) external;
    function setIsSwapEnabled(bool _isSwapEnabled) external;
    function setIsLeverageEnabled(bool _isLeverageEnabled) external;
    function setMaxGasPrice(uint256 _maxGasPrice) external;
    function setZkusdAmount(address _token, uint256 _amount) external;
    function setBufferAmount(address _token, uint256 _amount) external;
    function setMaxGlobalShortSize(address _token, uint256 _amount) external;
    function setInPrivateLiquidationMode(bool _inPrivateLiquidationMode) external;
    function setLiquidator(address _liquidator, bool _isActive) external;
    function setFundingRate(
        uint256 _fundingInterval, uint256 _fundingRateFactor,
        uint256 _stableFundingRateFactor) external;
    function setFees(
        uint256 _taxBasisPoints, uint256 _stableTaxBasisPoints,
        uint256 _mintBurnFeeBasisPoints, uint256 _swapFeeBasisPoints,
        uint256 _stableSwapFeeBasisPoints, uint256 _marginFeeBasisPoints,
        uint256 _liquidationFeeUsd, uint256 _minProfitTime, bool _hasDynamicFees) external;

    function setTokenConfig(
        address _token, uint256 _tokenDecimals,
        uint256 _redemptionBps, uint256 _minProfitBps,
        uint256 _maxZkusdAmount, bool _isStable, bool _isShortable) external;
    function setPriceFeed(address _priceFeed) external;
    function setVaultUtils(IVaultUtils _vaultUtils) external;
    function setError(uint256 _errorCode, string calldata _error) external;
}


// File contracts/core/interfaces/IShortsTracker.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IShortsTracker {
    function isGlobalShortDataReady() external view returns (bool);
    function globalShortAveragePrices(address _token) external view returns (uint256);
    function getNextGlobalShortData(
        address _account, address _collateralToken,
        address _indexToken, uint256 _nextPrice,
        uint256 _sizeDelta, bool _isIncrease) external view returns (uint256, uint256);
    function updateGlobalShortData(
        address _account, address _collateralToken,
        address _indexToken, bool _isLong,
        uint256 _sizeDelta, uint256 _markPrice, bool _isIncrease) external;
}


// File contracts/core/interfaces/IZkdlpManager.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IZkdlpManager {
    function zkUsd() external view returns (address);
    function cooldownDuration() external returns (uint256);
    function getAumInZkusd(bool maximise) external view returns (uint256);
    function lastAddedAt(address _account) external returns (uint256);
    function addLiquidity(
        address _token, uint256 _amount,
        uint256 _minZkusd, uint256 _minZkdlp) external returns (uint256);
    function addLiquidityForAccount(
        address _fundingAccount, address _account,
        address _token, uint256 _amount,
        uint256 _minZkusd, uint256 _minZkdlp) external returns (uint256);
    function removeLiquidity(
        address _tokenOut, uint256 _zkdlpAmount,
        uint256 _minOut, address _receiver) external returns (uint256);
    function removeLiquidityForAccount(
        address _account, address _tokenOut,
        uint256 _zkdlpAmount, uint256 _minOut, address _receiver) external returns (uint256);
}


// File contracts/tokens/interfaces/IZKUSD.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IZKUSD {
    function addVault(address _vault) external;
    function removeVault(address _vault) external;
    function mint(address _account, uint256 _amount) external;
    function burn(address _account, uint256 _amount) external;
}


// File contracts/tokens/interfaces/IMintable.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
interface IMintable {
    function isMinter(address _account) external returns (bool);
    function setMinter(address _minter, bool _isActive) external;
    function mint(address _account, uint256 _amount) external;
    function burn(address _account, uint256 _amount) external;
}


// File contracts/access/Governable.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract Governable {
    address public gov;
    constructor() public {
        gov = msg.sender;
    }
    modifier onlyGov() {
        require(msg.sender == gov, "Governable: forbidden");
        _;
    }
    function setGov(address _gov) external onlyGov {
        gov = _gov;
    }
}


// File contracts/core/storage/ZkdlpManagerAggregators.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;













abstract contract ZKdlpManagerAggregators is IZkdlpManager, ReentrancyGuard, Governable {
}


// File contracts/core/storage/ZkdlpManagerStorage.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

abstract contract ZkdlpManagerStorage is ZKdlpManagerAggregators {
    /* constructor */
    IVault public vault;
    address public override zkUsd;
    address public zkdlp;
    IShortsTracker public shortsTracker;
    /* settings */
    bool public inPrivateMode;
    uint256 public shortsTrackerAveragePriceWeight;
    mapping (address => bool) public isHandler;
    uint256 public override cooldownDuration;
    uint256 public aumAddition;
    uint256 public aumDeduction;
    /* misc */
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    mapping (address => uint256) public override lastAddedAt;
}


// File contracts/core/settings/ZkdlpManagerSettings.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

abstract contract ZkdlpManagerSettings is ZkdlpManagerStorage {
    function setInPrivateMode(bool _inPrivateMode) external onlyGov {
        inPrivateMode = _inPrivateMode;
    }
    function setShortsTrackerAveragePriceWeight(uint256 _shortsTrackerAveragePriceWeight) external onlyGov {
        require(shortsTrackerAveragePriceWeight <= Constants.BASIS_POINTS_DIVISOR, Errors.ZKDLPMANAGER_INVALID_WEIGHT);
        shortsTrackerAveragePriceWeight = _shortsTrackerAveragePriceWeight;
    }
    function setHandler(address _handler, bool _isActive) external onlyGov {
        isHandler[_handler] = _isActive;
    }
    function setCooldownDuration(uint256 _cooldownDuration) external onlyGov {
        require(_cooldownDuration <= Constants.MAX_COOLDOWN_DURATION, Errors.ZKDLPMANAGER_INVALID_COOLDOWNDURATION);
        cooldownDuration = _cooldownDuration;
    }
    function setAumAdjustment(uint256 _aumAddition, uint256 _aumDeduction) external onlyGov {
        aumAddition = _aumAddition;
        aumDeduction = _aumDeduction;
    }
}


// File contracts/core/ZkdlpManager.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ZkdlpManager is ZkdlpManagerSettings {
    constructor(
        address _vault, address _zkusd,
        address _zkdlp, address _shortsTracker, uint256 _cooldownDuration) public {
        gov = msg.sender;
        vault = IVault(_vault);
        zkUsd = _zkusd;
        zkdlp = _zkdlp;
        shortsTracker = IShortsTracker(_shortsTracker);
        cooldownDuration = _cooldownDuration;
    }
    function addLiquidity(address _token, uint256 _amount, uint256 _minZkusd, uint256 _minZkdlp) external override nonReentrant returns (uint256) {
        if (inPrivateMode) {revert(Errors.ZKDLPMANAGER_ACTION_NOT_ENABLED);}
        return _addLiquidity(msg.sender, msg.sender, _token, _amount, _minZkusd, _minZkdlp);
    }

    function addLiquidityForAccount(
        address _fundingAccount, address _account,
        address _token, uint256 _amount,
        uint256 _minZkusd, uint256 _minZkdlp)
    external override nonReentrant returns (uint256) {
        _validateHandler();
        return _addLiquidity(_fundingAccount, _account, _token, _amount, _minZkusd, _minZkdlp);
    }

    function removeLiquidity(
        address _tokenOut, uint256 _zkdlpAmount,
        uint256 _minOut, address _receiver)
    external override nonReentrant returns (uint256) {
        if (inPrivateMode) {revert(Errors.ZKDLPMANAGER_ACTION_NOT_ENABLED);}
        return _removeLiquidity(msg.sender, _tokenOut, _zkdlpAmount, _minOut, _receiver);
    }

    function removeLiquidityForAccount(
        address _account, address _tokenOut,
        uint256 _zkdlpAmount, uint256 _minOut, address _receiver)
    external override nonReentrant returns (uint256) {
        _validateHandler();
        return _removeLiquidity(_account, _tokenOut, _zkdlpAmount, _minOut, _receiver);
    }

    function _addLiquidity(
        address _fundingAccount, address _account,
        address _token, uint256 _amount,
        uint256 _minZkusd, uint256 _minZkdlp)
    internal returns (uint256) {
        require(_amount > 0, Errors.ZKDLPMANAGER_INVALID_AMOUNT);
        uint256 aumInZkusd = getAumInZkusd(true);
        uint256 zkdlpSupply = IERC20(zkdlp).totalSupply();
        IERC20(_token).safeTransferFrom(_fundingAccount, address(vault), _amount);
        uint256 zkusdAmount = vault.buyZKUSD(_token, address(this));
        require(zkusdAmount >= _minZkusd, Errors.ZKDLPMANAGER_INSUFFICIENT_ZKUSD_OUTPUT);
        uint256 mintAmount = aumInZkusd == 0 || zkdlpSupply == 0 ? zkusdAmount : zkusdAmount.mul(zkdlpSupply).div(aumInZkusd);
        require(mintAmount >= _minZkdlp, Errors.ZKDLPMANAGER_INSUFFICIENT_ZKDLP_OUTPUT);
        IMintable(zkdlp).mint(_account, mintAmount);
        lastAddedAt[_account] = block.timestamp;
        emit Events.AddLiquidity(_account, _token, _amount, aumInZkusd, zkdlpSupply, zkusdAmount, mintAmount);
        return mintAmount;
    }

    function _removeLiquidity(
        address _account, address _tokenOut,
        uint256 _zkdlpAmount, uint256 _minOut,
        address _receiver)
    internal returns (uint256) {
        require(_zkdlpAmount > 0, Errors.ZKDLPMANAGER_INVALID_ZKDLPAMOUNT);
        require(lastAddedAt[_account].add(cooldownDuration) <= block.timestamp, Errors.ZKDLPMANAGER_COOLDOWN_DURATION_NOT_YET_PASSED);
        uint256 aumInZkusd = getAumInZkusd(false);
        uint256 zkdlpSupply = IERC20(zkdlp).totalSupply();
        uint256 zkusdAmount = _zkdlpAmount.mul(aumInZkusd).div(zkdlpSupply);
        uint256 zkusdBalance = IERC20(zkUsd).balanceOf(address(this));
        if (zkusdAmount > zkusdBalance) {
            IZKUSD(zkUsd).mint(address(this), zkusdAmount.sub(zkusdBalance));
        }
        IMintable(zkdlp).burn(_account, _zkdlpAmount);
        IERC20(zkUsd).transfer(address(vault), zkusdAmount);
        uint256 amountOut = vault.sellZKUSD(_tokenOut, _receiver);
        require(amountOut >= _minOut, Errors.ZKDLPMANAGER_INSUFFICIENT_OUTPUT);
        emit Events.RemoveLiquidity(_account, _tokenOut, _zkdlpAmount, aumInZkusd, zkdlpSupply, zkusdAmount, amountOut);
        return amountOut;
    }

    function _validateHandler() internal view {
        require(isHandler[msg.sender], Errors.ZKDLPMANAGER_FORBIDDEN);
    }

    function getPrice(bool _maximise) external view returns (uint256) {
        uint256 aum = getAum(_maximise);
        uint256 supply = IERC20(zkdlp).totalSupply();
        return aum.mul(Constants.ZKDLP_PRECISION).div(supply);
    }

    function getAums() public view returns (uint256[] memory) {
        uint256[] memory amounts = new uint256[](2);
        amounts[0] = getAum(true);
        amounts[1] = getAum(false);
        return amounts;
    }

    function getAumInZkusd(bool maximise) public override view returns (uint256) {
        uint256 aum = getAum(maximise);
        return aum.mul(10 ** Constants.ZKUSD_DECIMALS).div(Constants.PRICE_PRECISION);
    }

    function getAum(bool maximise) public view returns (uint256) {
        uint256 length = vault.allWhitelistedTokensLength();
        uint256 aum = aumAddition;
        uint256 shortProfits = 0;
        IVault _vault = vault;
        for (uint256 i = 0; i < length; i++) {
            address token = vault.allWhitelistedTokens(i);
            bool isWhitelisted = vault.whitelistedTokens(token);
            if (!isWhitelisted) {
                continue;
            }
            uint256 price = maximise ? _vault.getMaxPrice(token) : _vault.getMinPrice(token);
            uint256 poolAmount = _vault.poolAmounts(token);
            uint256 decimals = _vault.tokenDecimals(token);
            if (_vault.stableTokens(token)) {
                aum = aum.add(poolAmount.mul(price).div(10 ** decimals));
            } else {
                uint256 size = _vault.globalShortSizes(token);
                if (size > 0) {
                    (uint256 delta, bool hasProfit) = getGlobalShortDelta(token, price, size);
                    if (!hasProfit) {
                        aum = aum.add(delta);
                    } else {
                        shortProfits = shortProfits.add(delta);
                    }
                }
                aum = aum.add(_vault.guaranteedUsd(token));
                uint256 reservedAmount = _vault.reservedAmounts(token);
                aum = aum.add(poolAmount.sub(reservedAmount).mul(price).div(10 ** decimals));
            }
        }
        aum = shortProfits > aum ? 0 : aum.sub(shortProfits);
        return aumDeduction > aum ? 0 : aum.sub(aumDeduction);
    }

    function getGlobalShortDelta(address _token, uint256 _price, uint256 _size) public view returns (uint256, bool) {
        uint256 averagePrice = getGlobalShortAveragePrice(_token);
        uint256 priceDelta = averagePrice > _price ? averagePrice.sub(_price) : _price.sub(averagePrice);
        uint256 delta = _size.mul(priceDelta).div(averagePrice);
        return (delta, averagePrice > _price);
    }

    function getGlobalShortAveragePrice(address _token) public view returns (uint256) {
        IShortsTracker _shortsTracker = shortsTracker;
        if (address(_shortsTracker) == address(0) || !_shortsTracker.isGlobalShortDataReady()) {
            return vault.globalShortAveragePrices(_token);
        }
        uint256 _shortsTrackerAveragePriceWeight = shortsTrackerAveragePriceWeight;
        if (_shortsTrackerAveragePriceWeight == 0) {
            return vault.globalShortAveragePrices(_token);
        } else if (_shortsTrackerAveragePriceWeight == Constants.BASIS_POINTS_DIVISOR) {
            return _shortsTracker.globalShortAveragePrices(_token);
        }
        uint256 vaultAveragePrice = vault.globalShortAveragePrices(_token);
        uint256 shortsTrackerAveragePrice = _shortsTracker.globalShortAveragePrices(_token);
        return vaultAveragePrice.mul(Constants.BASIS_POINTS_DIVISOR.sub(_shortsTrackerAveragePriceWeight)).add(shortsTrackerAveragePrice.mul(_shortsTrackerAveragePriceWeight)).div(Constants.BASIS_POINTS_DIVISOR);
    }
}
