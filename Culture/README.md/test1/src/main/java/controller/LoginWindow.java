package controller;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginWindow extends JFrame implements ActionListener {
    // Components of the login window
    private Container container;
    private JLabel userLabel;
    private JTextField userTextField;
    private JLabel passwordLabel;
    private JPasswordField passwordField;
    private JButton loginButton;
    private JButton resetButton;
    private JLabel messageLabel;

    // JDBC variables for database connection
    private Connection connection;
    private PreparedStatement preparedStatement;

    // Constructor to setup GUI components and event handling
    public LoginWindow() {
        // Set up the JFrame
        setTitle("Login Form");
        setBounds(300, 90, 400, 200);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setResizable(false);

        // Get the content pane
        container = getContentPane();
        container.setLayout(null);

        // Create user label
        userLabel = new JLabel("Username:");
        userLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        userLabel.setBounds(50, 30, 100, 30);
        container.add(userLabel);

        // Create text field for username
        userTextField = new JTextField();
        userTextField.setFont(new Font("Arial", Font.PLAIN, 15));
        userTextField.setBounds(150, 30, 150, 30);
        container.add(userTextField);

        // Create password label
        passwordLabel = new JLabel("Password:");
        passwordLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        passwordLabel.setBounds(50, 70, 100, 30);
        container.add(passwordLabel);

        // Create password field
        passwordField = new JPasswordField();
        passwordField.setFont(new Font("Arial", Font.PLAIN, 15));
        passwordField.setBounds(150, 70, 150, 30);
        container.add(passwordField);

        // Create login button
        loginButton = new JButton("Login");
        loginButton.setFont(new Font("Arial", Font.PLAIN, 15));
        loginButton.setBounds(50, 110, 100, 30);
        loginButton.addActionListener(this);
        container.add(loginButton);

        // Create reset button
        resetButton = new JButton("Reset");
        resetButton.setFont(new Font("Arial", Font.PLAIN, 15));
        resetButton.setBounds(200, 110, 100, 30);
        resetButton.addActionListener(this);
        container.add(resetButton);

        // Create message label
        messageLabel = new JLabel("");
        messageLabel.setFont(new Font("Arial", Font.PLAIN, 15));
        messageLabel.setBounds(50, 150, 250, 30);
        container.add(messageLabel);

        // Initialize database connection
        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // Establish the connection to the database (replace with your database details)
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:xe", "your_username", "your_password");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        setVisible(true);
    }

    // Event handling for the buttons
    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == loginButton) {
            String userText = userTextField.getText();
            String passwordText = new String(passwordField.getPassword());

            // Check credentials against the database
            try {
                // Prepare SQL query to check the user's credentials
                String query = "SELECT * FROM userDB WHERE username = ? AND password = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, userText);
                preparedStatement.setString(2, passwordText);

                ResultSet resultSet = preparedStatement.executeQuery();

                // If a record is found, login is successful
                if (resultSet.next()) {
                    messageLabel.setText("Login successful!");
                } else {
                    messageLabel.setText("Invalid username or password.");
                }

                resultSet.close();
                preparedStatement.close();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        } else if (e.getSource() == resetButton) {
            // Reset fields
            userTextField.setText("");
            passwordField.setText("");
            messageLabel.setText("");
        }
    }

    public static void main(String[] args) {
        // Create the login window
        new LoginWindow();
    }
}
