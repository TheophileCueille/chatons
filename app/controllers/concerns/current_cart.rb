module CurrentCart
    def set_cart
        @cart = Cart.find_or_create_by( user_id: 1 )#user_id: current_user.id)
    end
    
end