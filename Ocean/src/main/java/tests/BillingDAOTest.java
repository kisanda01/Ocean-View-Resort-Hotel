package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import DAO.BillingDAO;
import Models.Bill;

public class BillingDAOTest {
    
    private BillingDAO billingDAO;

    @BeforeEach
    void setUp() {
     
        billingDAO = new BillingDAO();
    }

    @Test
    void testSaveBillSuccess() {
        Bill testBill = new Bill();
        testBill.setResNo("RES-2026-005");
        testBill.setFullname("Aruna Perera");
        testBill.setRoomNo("RM-305");
        testBill.setTotalAmount(12500.50);
        testBill.setPaymentType("Credit Card");

        boolean result = billingDAO.saveBill(testBill);

        assertTrue(result, "The billing data should be successfully entered into the database.");
    }

    @Test
    void testSaveBillWithZeroAmount() {
        Bill zeroBill = new Bill();
        zeroBill.setResNo("RES-000");
        zeroBill.setTotalAmount(0.0);
        
        boolean result = billingDAO.saveBill(zeroBill);
        assertNotNull(result); 
    }
}