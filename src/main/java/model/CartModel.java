package model;


public class CartModel {
    private int cartId;
    private int userId;
    private int cartQty;

    public int getCartId() {
        return cartId;
    }
    public void setCartId(int cartId) {
        this.cartId = cartId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getCartQty() {
        return cartQty;
    }
    public void setCartQty(int cartQty) {
        this.cartQty = cartQty;
    }
}