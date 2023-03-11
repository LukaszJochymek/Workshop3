package pl.coderslab;

import org.mindrot.jbcrypt.BCrypt;

import pl.coderslab.utils.DbUtil;

import java.awt.print.Book;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class UserDao {

    private static final String SELECT_ALL_QUERY = "SELECT * FROM users";
    private static final String SELECT_BY_ID_QUERY = "SELECT * FROM users WHERE id=?";
    private static final String DELETE_BY_ID_QUERY = "DELETE FROM users WHERE id=?";
    private static final String CREATE_USER_QUERY = "INSERT INTO users(username,email,password) VALUES(?,?,?)";
    private static final String UPDATE_USER_QUERY = "UPDATE users SET username=?, email=?, password=? WHERE id=?";


    public User create(User user) {

        try (Connection conn = DbUtil.getConnection()) {

            PreparedStatement statement =

                    conn.prepareStatement(CREATE_USER_QUERY, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getEmail());
            statement.setString(3, hashPassword(user.getPassword()));
            statement.executeUpdate();
            //Pobieramy wstawiony do bazy identyfikator, a następnie ustawiamy id obiektu user.

            ResultSet resultSet = statement.getGeneratedKeys();

            if (resultSet.next()) {

                user.setId(resultSet.getInt(1));

            }

            return user;

        } catch (SQLException e) {

            e.printStackTrace();

            return null;

        }

    }

    public User findById(int userId){

        try (Connection conn = DbUtil.getConnection()){


            PreparedStatement statement = conn.prepareStatement(SELECT_BY_ID_QUERY);
            statement.setLong(1, userId);
            ResultSet userResult = statement.executeQuery();
            while (userResult.next()) {
                int idUser = userResult.getInt("id");
                String emailUser = userResult.getString("email");
                String userNameUser = userResult.getString("username");
                String passwordUser = userResult.getString("password");
                User user = new User(idUser,userNameUser,emailUser,passwordUser);
                return user;

            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public User update(User user){

        if(user==null) return null;
        try(Connection connection = DbUtil.getConnection()){

            PreparedStatement ps = connection.prepareStatement(UPDATE_USER_QUERY);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getEmail());
            ps.setString(3,user.getPassword());
            ps.setInt(4, user.getId());
            int affectedRows = ps.executeUpdate();
            if(affectedRows>0){
                return user;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public boolean delete(User user){
        if(user == null) return false;
        return delete(user.getId());
    }
    public boolean delete(int id){
        try(Connection connection = DbUtil.getConnection()){
            PreparedStatement statement = connection.prepareStatement(DELETE_BY_ID_QUERY);
            statement.setLong(1,id);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected==1;

        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

    public List<User> findAll(){
        List<User> list = new ArrayList<>();
        try(Connection connection = DbUtil.getConnection()){
            PreparedStatement stmt = connection.prepareStatement(SELECT_ALL_QUERY);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()){

                int id = rs.getInt("id");
                String username = rs.getString("username");
                String email = rs.getString("email");
                String password = rs.getString("password");

                User user = new User(id,username,email,password);
                list.add(user);
            }

        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return list;
    }








    public String hashPassword(String password) {

        return BCrypt.hashpw(password, BCrypt.gensalt());

    }

}


