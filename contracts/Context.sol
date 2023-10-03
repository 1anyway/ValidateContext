// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    /**
     * @dev Modifier to ensure the caller is not a smart contract and not using any proxies.
     *
     * Requirements:
     *
     * - The call must be made directly by an externally owned account (EOA).
     * - The call must not be made through a proxy.
     *
     * @param thisAddr The expected address of the current contract instance. This is used to ensure
     *                 that the call is not being made through a proxy contract.
     */
    modifier onlyEOAWithoutProxies(address thisAddr) {
        bool cond1 = msg.sender == tx.origin;
        bool cond2 = address(this) == thisAddr;
        require(cond1 && cond2, "Context: call must be direct and without proxies");
        _;
    }

    /**
     * @dev Modifier to ensure the caller is not a smart contract.
     *
     * This is a common safety check to prevent certain functionalities from being
     * executed by automated contracts, ensuring that the call is made directly by an end-user.
     *
     * Requirements:
     *
     * - The call must be made directly by an externally owned account (EOA).
     */
    modifier onlyEOA() {
        require(msg.sender == tx.origin, "Context: caller must be EOA");
        _;
    }

    /**
     * @dev Modifier to ensure the call is not made through a proxy.
     *
     * This is a safety check to prevent certain functionalities from being
     * executed through intermediary contracts or proxies.
     *
     * Requirements:
     *
     * - The call must not be made through a proxy.
     *
     * @param thisAddr The expected address of the current contract instance. This is used to ensure
     *                 that the call is not being made through a proxy contract.
     */
    modifier noProxy(address thisAddr) {
        require(address(this) == thisAddr, "Context: call must not be through a proxy");
        _;
    }
}
