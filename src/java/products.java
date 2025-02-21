public class products {
    private int product_id;
    private String product_name;
    private String product_category;
    private double product_price;
    private int product_stock;
    private String product_description;

    // Constructor to initialize values
    public products(int product_id, String product_name, String product_category, double product_price, int product_stock, String product_description) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_category = product_category;
        this.product_price = product_price;
        this.product_stock = product_stock;
        this.product_description = product_description;
    }

    // Getters and Setters
    public int getProductId() {
        return product_id;
    }

    public void setProductId(int product_id) {
        this.product_id = product_id;
    }

    public String getProductName() {
        return product_name;
    }

    public void setProductName(String product_name) {
        this.product_name = product_name;
    }

    public String getProductCategory() {
        return product_category;
    }

    public void setProductCategory(String product_category) {
        this.product_category = product_category;
    }

    public double getProductPrice() {
        return product_price;
    }

    public void setProductPrice(double product_price) {
        this.product_price = product_price;
    }

    public int getProductStock() {
        return product_stock;
    }

    public void setProductStock(int product_stock) {
        this.product_stock = product_stock;
    }

    public String getProductDescription() {
        return product_description;
    }

    public void setProductDescription(String product_description) {
        this.product_description = product_description;
    }
}
