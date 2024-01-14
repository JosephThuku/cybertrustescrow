import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import List "mo:base/List";
import Prim "mo:prim";
import Random "mo:base/Random";
import Nat8 "mo:base/Nat8";
import Principal "mo:base/Principal";
import Time "mo:base/Time";
import Blob "mo:base/Blob";


actor icpescrow {
  type Nat = Prim.Types.Nat;
  type Text = Prim.Types.Text;

  //wallet
  type Wallet = {
    wallet_id: Nat;
    wallet_address: Text;
    coin_symbol: Text;
    balance: Nat;
  };

  //wallet1
  type Wallet1 = {
    wallet_id: Nat;
    user1_address: Text;
    coin_symbol: Text;
    balance: Nat;
  };

  //escrow
  type Escrow = {
    escrow_id: Nat;
    escrow_address: Text;
    coin_symbol: Text;
    balance: Nat;
    wallet_address: Text;
  };

  //user
  type User = {
    user_id: Nat;
    user_address: Text;
    wallet: Wallet;

  };

  type Transaction = {
 transaction_id: Nat;
 from_wallet: Wallet;
 to_wallet: Wallet;
 amount: Nat;
 timestamp: Time.Time;
};



  // Function to generate wallet address
  public func generateWalletAddress(): async Text {
    return "Xhjbvewjbjdwkbjkwdbdw"; // Placeholder, replace with actual logic
    var wallet_address = "Xhjbvewjbjdwkbjkwdbdw";
    return wallet_address;
  };

  // Function to generate escrow address
  public func generateEscrowAddress(): async Text {
    return "Xhjbvewjbjawdkbjkwdww"; // Placeholder, replace with actual logic
    var escrow_address = "Xhhjbvewjbjawdkbjkbjkwdbdw";
    return escrow_address;
  };

  // Function to generate user address
  public func generateuser1Address(): async Text {
    return "Xbvewjbjawdkbjkwdww"; // Placeholder, replace with actual logic
    var user1_address = "Xbvewjbjawdkbjkwdww";
    return user1_address;
  };

  // Function to create wallet
  public func createWallet(wallet_address: Text, coin_symbol: Text, balance: Nat): async Wallet {
    var wallet_id = 1; // Placeholder, replace with actual logic
    var wallet_address = await generateWalletAddress();
    var wallet = {wallet_id; wallet_address; coin_symbol; balance};
    return wallet;
  };

  // Function to create escrow
  public func createEscrow(escrow_address: Text, coin_symbol: Text, balance: Nat, wallet_address: Text): async Escrow {
    var escrow_id = 1; // Placeholder, replace with actual logic
    var escrow_address = await generateWalletAddress();
    var escrow = {escrow_id; escrow_address; coin_symbol; balance; wallet_address};
    return escrow;
  };

  // Function to create user1 wallet
  public func createuser1Wallet(user1_address: Text, coin_symbol: Text, balance: Nat): async Wallet1 {
    var wallet_id = 1; // Placeholder, replace with actual logic
    var user1_address = await generateuser1Address();
    var Wallet1 = {wallet_id; user1_address; coin_symbol; balance};
    return Wallet1;
  };


  // Function to create user
  public func createUser(user_address: Text, wallet: Wallet): async User {
    var user_id = 1; // Placeholder, replace with actual logic
    var user_address = await generateWalletAddress();
    var wallet_address = user_address;
    var coin_symbol = "ICP";
    var balance = 60;
    var wallet = await createWallet(wallet_address, coin_symbol, balance);
    var user = {user_id; user_address; wallet};
    return user;
  };


  // Function to get wallet balance
  public func getWalletBalance(wallet: Wallet): async Nat {
    return wallet.balance;
  };

  // Function to get escrow balance
  public func getEscrowBalance(escrow: Escrow): async Nat {
    return escrow.balance;
  };

// Function to send money from wallet to escrow
public func sendMoneyFromWalletToEscrow(wallet: Wallet, escrow: Escrow, amount: Nat): async Escrow {
  let updatedWallet = { wallet with balance = wallet.balance - amount };
  let updatedEscrow = { escrow with balance = escrow.balance + amount };
  return { escrow with wallet = updatedEscrow };
};


// Function to send money from escrow to wallet
public func sendMoneyFromEscrowToWallet(wallet: Wallet, escrow: Escrow, amount: Nat): async Escrow {
  let updatedWallet = { wallet with balance = wallet.balance + amount };
  let updatedEscrow = { escrow with balance = escrow.balance - amount };
  return { escrow with wallet = updatedEscrow };
};

// Function to send money from escrow to user1 wallet
public func sendMoneyFromEscrowToUser1Wallet(wallet: Wallet1, escrow: Escrow, amount: Nat): async Escrow {
  let updatedWallet = { wallet with balance = wallet.balance + amount };
  let updatedEscrow = { escrow with balance = escrow.balance - amount };
  return { escrow with wallet = updatedEscrow };
};

// Function to send money from user1 wallet to escrow
public func sendMoneyFromUser1WalletToEscrow(wallet: Wallet1, escrow: Escrow, amount: Nat): async Escrow {
  let updatedWallet = { wallet with balance = wallet.balance - amount };
  let updatedEscrow = { escrow with balance = escrow.balance + amount };
  return { escrow with wallet = updatedEscrow };
};

// Function to confirm both parties have sent money to escrow
public func confirmMoneySentToEscrow(wallet: Wallet, escrow: Escrow, amount: Nat): async Escrow {
  let updatedWallet = { wallet with balance = wallet.balance - amount };
  let updatedEscrow = { escrow with balance = escrow.balance + amount };
  return { escrow with wallet = updatedEscrow };
};

// Function to release money from escrow to user1 wallet if both parties have sent money to escrow
public func releaseMoneyFromEscrowToUser1Wallet(wallet: Wallet1, escrow: Escrow, amount: Nat): async Escrow {
  let updatedWallet = { wallet with balance = wallet.balance + amount };
  let updatedEscrow = { escrow with balance = escrow.balance - amount };
  return { escrow with wallet = updatedEscrow };
};
};