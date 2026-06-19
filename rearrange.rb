# module Show
   
# end

module Rearrange

    
    def create_acc
        loop do

            puts "Enter Your Name"
            user_name = gets.chomp.upcase.strip
    
            puts "Enter the Account Number"
            acc_num = gets.chomp

            puts "Enter the pin"
            pin = gets.chomp

            puts "Enter the Amount"
            amt = gets.chomp.to_i

            puts "If you want to Exit , please Enter 'Exit' other wise Enter any key"
            ou = gets.chomp.downcase

            id = @users.length + 1

            us ={"Id" => id , "User_name" => user_name , "accnum" => acc_num, "pin" => pin , "amount" => amt}
            @users << us

            break if ou == "exit"
        end
    end

    def deposit_amount

        puts "Enter the Your Account Number"
        search_num = gets.chomp.strip

        user = @users.find {|user1 | user1["accnum"] == search_num}

        if user != nil
            puts "Enter your pin"
            pin_f_t =gets.chomp

            if user["pin"] == pin_f_t
                puts "Enter amount"
                new_amt = gets.chomp.to_i
                new_amt1 = user["amount"] + new_amt
                puts "Your balance #{new_amt1}"
                sleep(2)
            else
                puts "Pin incorrect"
                sleep(2)
                return
            end
        else
            puts "User not Found"
            sleep(2)
            return
        end
        user["amount"] = new_amt1
    end

    def withdraw_amount
        puts "Enter the Your Account Number"
        search_num = gets.chomp.strip

        user = @users.find {|user1 | user1["accnum"] == search_num}

        if user != nil
            puts "Enter your pin"
            pin_f_t =gets.chomp

            if user["pin"] == pin_f_t
                puts "Enter amount"
                new_amt = gets.chomp.to_i
                new_amt1 = user["amount"] - new_amt
                puts "Your balance"
                puts new_amt1
            else
                puts "Pin incorrect"
                sleep(2)
                return
            end
        else
            puts "User not Found"
            sleep(2)
            return
        end      
        user["amount"] = new_amt1
    end

    def delete_acc

        puts "Enter the Your Account Number"
        search_num = gets.chomp.strip

        user = @users.find {|user1 | user1["accnum"] == search_num}

        if user != nil
            puts "Enter your pin"
            pin_f_t =gets.chomp
            if user["pin"] == pin_f_t
                @users = @users.delete_if{|user1 | user1["accnum"] == search_num}
            else
                puts "Pin incorrect"
                sleep(2)
                return
            end
        else
            puts "User not Found"
            sleep(2)
            return
        end
        puts @users
    end

    def transaction

         loop do

            puts "Enter the Your Account Number"
            search_num = gets.chomp.strip

            user = @users.find {|user1 | user1["accnum"] == search_num}
            if user != nil
                puts "Enter Account number of you friend"
                search_num1 = gets.chomp.strip
                user2 = @users.find {|user1 | user1["accnum"] == search_num1}

                if user2 != nil
                    puts "Enter your pin"
                    pin_f_t =gets.chomp
                    if user["pin"] == pin_f_t
                        puts "Enter amount"
                        new_amt = gets.chomp.to_i
                        puts "Enter (S) for confirm"
                        inp = gets.chomp.upcase.strip
                        if inp == "S"
                            if new_amt > user["amount"]
                                puts "Insufficient Balance"
                                sleep(2)
                                return
                            else
                                new_amt1 = user["amount"] - new_amt
                                new_amt2 = user2["amount"] + new_amt
                                puts "Transaction Succesfull"
                            end
                        end
                    else
                        puts "Pin incorrect"
                        sleep(2)
                    return
                    end
                else
                    puts "Account not found \n Please Try again"
                    sleep(2)
                    return
                end
            else
                puts "Account not found \n Please Try again"
                sleep(2)
                return
            end

        puts "Remaining balance #{new_amt1}"

        user["amount"] = new_amt1
        user2["amount"] = new_amt2

        t_num= @history.length+1

        h ={"Transaction_num" => t_num,"from"=>search_num , "to" => search_num1 , "amount" =>new_amt}

        @history << h

        puts "If you want to Do more transaction Enter (1)"
        his = gets.chomp.to_i
        
        break if his !=1 
        end
        puts @history
    end

    def balance
        puts "Enter the Your Account Number"
        search_num = gets.chomp.strip

        user = @users.find {|user1 | user1["accnum"] == search_num}

        if user != nil
            puts "Enter your pin"
            pin_f_t =gets.chomp
            if user["pin"] == pin_f_t
                puts "Your Balance is #{user["amount"]}"
            else
                puts "Pin incorrect"
                sleep(2)
                return
            end
        else
            puts "User not Found"
            sleep(2)
            return
        end
    end
     
end


class Bank

    def initialize()
        @users = []
        @history =[]
    end
    
    def show 
        @users.each do |user|
            puts "ID: #{user["Id"]} , Name: #{user["User_name"]} , Acc No: #{user["accnum"]} , Balance: $#{user["amount"]}"
       end
    end
    
    include Rearrange
    
end

ob =Bank.new()

loop do
puts "Enter (1) for Creating Account"
puts "Enter (2) for Deposit Amount"
puts "Enter (3) for Withdraw Amount"
puts "Enter (4) for Deleting Account"
puts "Enter (5) for Transaction"
puts "Enter (6) for Checking Balance"
puts "Enter (7) for Exit"

check = gets.chomp.to_i

case check
when 1
    ob.create_acc
when 2
    ob.deposit_amount
when 3
    ob.withdraw_amount
when 4 
    ob.delete_acc
when 5
    ob.transaction
when 6
    ob.balance
when 7
    puts "Thank you"
    break 
else
    puts "Enter a Valid number"
    
end
end
ob.show
