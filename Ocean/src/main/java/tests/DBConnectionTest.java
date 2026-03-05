package tests;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import java.sql.Connection;
import java.sql.SQLException;
import DAO.DBConnection;

public class DBConnectionTest {

    @Test
    void testGetConnectionSuccess() {
        Connection con = DBConnection.getConnection();
        
        assertNotNull(con, "The database connection should be successfully established.");
        
        try {
            assertFalse(con.isClosed(), "The connection should remain open.");
            con.close();
        } catch (SQLException e) {
            fail("An error occurred while connecting to the database. " + e.getMessage());
        }
    }
}