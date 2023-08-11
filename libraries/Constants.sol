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

    /* OrderBook.sol */
    uint256 public constant ZKUSD_PRECISION = 1e18;

    /* ZKDLP.sol */
    uint256 public constant ZKDLP_PRECISION = 10 ** 18;
    uint256 public constant MAX_COOLDOWN_DURATION = 48 hours;

    /* ShortsTracker */
    uint256 public constant MAX_INT256 = uint256(type(int256).max);
}
