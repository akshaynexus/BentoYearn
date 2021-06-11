import "../interfaces/IStrategy.sol";
import "../interfaces/IYearnVault.sol";

contract YearnAllocator is IStrategy {

    IYearnVault vault;
    IERC20 want;

    //TODO add modifiers for caller like vault gov and strat gov
    function initialize(address _vault) external {
        require(address(vault) == address(0),"Already initialized");
        vault = IYearnVault(_vault);
        want = IERC20(vault.token());
        want.safeApprove(_vault,type(uint256).max);
    }

    function skim(uint256 amount) external override {

    }

    function harvest(uint256 balance, address sender) external override returns (int256 amountAdded) {

    }

    function withdraw(uint256 amount) external override returns (uint256 actualAmount) {

    }

    function exit(uint256 balance) external override returns (int256 amountAdded) {

    }

    //Only gov of the strat should be able to call this
    function migrateToNewVault(address _newVault) external {
        vault.withdraw();

        want.safeApprove(_newVault,type(uint256).max);
        vault = IYearnVault(_vault);

        vault.deposit();
    }
}