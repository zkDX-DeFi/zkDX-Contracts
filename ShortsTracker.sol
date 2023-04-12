// Sources flattened with hardhat v2.7.0 https://hardhat.org

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


// File contracts/core/storage/ShortsTrackerAggregator.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;







abstract contract ShortsTrackerAggregator is IShortsTracker, Governable {
}


// File contracts/core/storage/ShortsTrackerStorage.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

abstract contract ShortsTrackerStorage is ShortsTrackerAggregator {
    /* constructor */
    IVault public vault;
    /* Settings */
    mapping (address => bool) public isHandler;
    mapping (address => uint256) public override globalShortAveragePrices;
    bool public override isGlobalShortDataReady;
    /* misc */
    mapping (bytes32 => bytes32) public data;
    using SafeMath for uint256;
    modifier onlyHandler() {
        require(isHandler[msg.sender], Errors.SHORTSTRACKER_FORBIDDEN);
        _;
    }
}


// File contracts/core/settings/ShortsTrackerSettings.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

abstract contract ShortsTrackerSettings is ShortsTrackerStorage {
    /* settings */
    function setHandler(address _handler, bool _isActive) external onlyGov {
        require(_handler != address(0), Errors.SHORTSTRACKER_INVALID_HANDLER);
        isHandler[_handler] = _isActive;
    }
    function setIsGlobalShortDataReady(bool value) external onlyGov {
        isGlobalShortDataReady = value;
    }
    function setInitData(address[] calldata _tokens, uint256[] calldata _averagePrices) external onlyGov {
        require(!isGlobalShortDataReady, Errors.SHORTSTRACKER_ALREADY_MIGRATED);
        for (uint256 i = 0; i < _tokens.length; i++) {
            globalShortAveragePrices[_tokens[i]] = _averagePrices[i];
        }
        isGlobalShortDataReady = true;
    }
}


// File contracts/core/ShortsTracker.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ShortsTracker is ShortsTrackerSettings {
    constructor(address _vault) public {
        vault = IVault(_vault);
    }
    function updateGlobalShortData(address _account, address _collateralToken, address _indexToken, bool _isLong, uint256 _sizeDelta, uint256 _markPrice, bool _isIncrease) override external onlyHandler {
        if (_isLong || _sizeDelta == 0) {
            return;
        }
        if (!isGlobalShortDataReady) {
            return;
        }
        (uint256 globalShortSize, uint256 globalShortAveragePrice) = getNextGlobalShortData(_account, _collateralToken, _indexToken, _markPrice, _sizeDelta, _isIncrease);
        _setGlobalShortAveragePrice(_indexToken, globalShortAveragePrice);
        emit Events.GlobalShortDataUpdated(_indexToken, globalShortSize, globalShortAveragePrice);
    }
    function _setGlobalShortAveragePrice(address _token, uint256 _averagePrice) internal {
        globalShortAveragePrices[_token] = _averagePrice;
    }
    /* views */
    function getNextGlobalShortData(address _account, address _collateralToken, address _indexToken, uint256 _nextPrice, uint256 _sizeDelta, bool _isIncrease) override public view returns (uint256, uint256) {
        int256 realisedPnl = getRealisedPnl(_account,_collateralToken, _indexToken, _sizeDelta, _isIncrease);
        uint256 averagePrice = globalShortAveragePrices[_indexToken];
        uint256 priceDelta = averagePrice > _nextPrice ? averagePrice.sub(_nextPrice) : _nextPrice.sub(averagePrice);
        uint256 nextSize;
        uint256 delta;
        {
            uint256 size = vault.globalShortSizes(_indexToken);
            nextSize = _isIncrease ? size.add(_sizeDelta) : size.sub(_sizeDelta);
            if (nextSize == 0) {
                return (0, 0);
            }
            if (averagePrice == 0) {
                return (nextSize, _nextPrice);
            }
            delta = size.mul(priceDelta).div(averagePrice);
        }
        uint256 nextAveragePrice = _getNextGlobalAveragePrice(averagePrice, _nextPrice, nextSize, delta, realisedPnl);
        return (nextSize, nextAveragePrice);
    }
    function getRealisedPnl(address _account, address _collateralToken, address _indexToken, uint256 _sizeDelta, bool _isIncrease) public view returns (int256) {
        if (_isIncrease) {
            return 0;
        }
        IVault _vault = vault;
        (uint256 size, , uint256 averagePrice, , , , , uint256 lastIncreasedTime) = _vault.getPosition(_account, _collateralToken, _indexToken, false);
        (bool hasProfit, uint256 delta) = _vault.getDelta(_indexToken, size, averagePrice, false, lastIncreasedTime);
        uint256 adjustedDelta = _sizeDelta.mul(delta).div(size);
        require(adjustedDelta < Constants.MAX_INT256, Errors.SHORTSTRACKER_OVERFLOW);
        return hasProfit ? int256(adjustedDelta) : -int256(adjustedDelta);
    }
    function _getNextGlobalAveragePrice(uint256 _averagePrice, uint256 _nextPrice, uint256 _nextSize, uint256 _delta, int256 _realisedPnl) public pure returns (uint256) {
        (bool hasProfit, uint256 nextDelta) = _getNextDelta(_delta, _averagePrice, _nextPrice, _realisedPnl);
        uint256 nextAveragePrice = _nextPrice
            .mul(_nextSize)
            .div(hasProfit ? _nextSize.sub(nextDelta) : _nextSize.add(nextDelta));
        return nextAveragePrice;
    }
    function _getNextDelta(uint256 _delta, uint256 _averagePrice, uint256 _nextPrice, int256 _realisedPnl) internal pure returns (bool, uint256) {
        bool hasProfit = _averagePrice > _nextPrice;
        if (hasProfit) {
            if (_realisedPnl > 0) {
                if (uint256(_realisedPnl) > _delta) {
                    _delta = uint256(_realisedPnl).sub(_delta);
                    hasProfit = false;
                } else {
                    _delta = _delta.sub(uint256(_realisedPnl));
                }
            } else {
                _delta = _delta.add(uint256(-_realisedPnl));
            }
            return (hasProfit, _delta);
        }
        if (_realisedPnl > 0) {
            _delta = _delta.add(uint256(_realisedPnl));
        } else {
            if (uint256(-_realisedPnl) > _delta) {
                _delta = uint256(-_realisedPnl).sub(_delta);
                hasProfit = true;
            } else {
                _delta = _delta.sub(uint256(-_realisedPnl));
            }
        }
        return (hasProfit, _delta);
    }
}
