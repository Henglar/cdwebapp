/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author User
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GenreDAO {
    private Connection connection;

    public GenreDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean createGenre(String name) {
        try {
            PreparedStatement stmt = connection.prepareStatement(
                "INSERT INTO genres (genre_name) VALUES (?)"
            );
            stmt.setString(1, name);
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Error creating genre: " + e.getMessage());
            return false;
        }
    }

    public List<Genre> listGenres() {
        List<Genre> genres = new ArrayList<>();
        try {
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM genres");
            while (rs.next()) {
                int id = rs.getInt("genre_id");
                String name = rs.getString("genre_name");
                Genre genre = new Genre(id, name);
                genres.add(genre);
            }
        } catch (SQLException e) {
            System.out.println("Error listing genres: " + e.getMessage());
        }
        return genres;
    }
}
