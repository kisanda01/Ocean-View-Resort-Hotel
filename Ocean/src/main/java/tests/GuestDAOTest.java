package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import DAO.GuestDAO;
import Models.Guest;

public class GuestDAOTest {
    
    private GuestDAO guestDAO;

    @BeforeEach
    void setUp() {
        guestDAO = new GuestDAO();
    }

    @Test
    void testRegisterGuestSuccess() {
        Guest testGuest = new Guest();
        testGuest.setFullname("Nimal Siripala");
        testGuest.setIdPassport("951234567V");
        testGuest.setPhone("0711122334");
        testGuest.setEmail("nimal@example.com");
        testGuest.setAddress("Kandy Road, Colombo");

        boolean result = guestDAO.registerGuest(testGuest);

        assertTrue(result, "The guest should be successfully registered.");
    }

    @Test
    void testGetGuestByIDSuccess() {
        String idPassport = "951234567V";
        
        Guest guest = guestDAO.getGuestByID(idPassport);

        assertNotNull(guest, "The guest’s details should be available in the system.");
        assertEquals("Nimal Siripala", guest.getFullname(), "The guest’s name should be received correctly.");
    }

    @Test
    void testGetGuestByInvalidID() {
        Guest guest = guestDAO.getGuestByID("INVALID-ID-000");
        
        // 3. Verification
        assertNull(guest, "A null value should be returned for a non-existing guest.");
    }
}