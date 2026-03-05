package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import DAO.StaffDAO;
import Models.Staff;

public class StaffDAOTest {
    
    private StaffDAO staffDAO;

    @BeforeEach
    void setUp() {
        staffDAO = new StaffDAO();
    }

    @Test
    void testRegisterStaffSuccess() {
        Staff testStaff = new Staff();
        testStaff.setFullname("Amara Perera");
        testStaff.setEmail("amara@ocean.com");
        testStaff.setPhone("0712345678");
        testStaff.setAddress("Colombo 07");
        testStaff.setUsername("amara123");
        testStaff.setPassword("pass123");

        boolean result = staffDAO.registerStaff(testStaff);

        assertTrue(result, "The staff member should be registered.");
    }

    @Test
    void testAuthenticateStaffSuccess() {
        boolean isValid = staffDAO.authenticateStaff("amara123", "pass123");
        
        assertTrue(isValid, "Login should be allowed with the correct username and password.");
    }

    @Test
    void testAuthenticateStaffFailure() {
        boolean isValid = staffDAO.authenticateStaff("amara123", "wrong_pass");
        
        assertFalse(isValid, "Login should be denied when an incorrect password is provided.");
    }
}