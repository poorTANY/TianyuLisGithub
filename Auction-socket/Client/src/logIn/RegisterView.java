package logIn;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

import customComponents.CustomButton;
import customComponents.CustomLabel;
import customComponents.CustomPanel;
import customComponents.CustomPasswordField;
import customComponents.CustomTextField;

public class RegisterView extends CustomPanel implements Observer {
	private CustomTextField username = new CustomTextField("username", 30);
	private CustomLabel usernameLabel = new CustomLabel("Username");
	private CustomPasswordField password = new CustomPasswordField("password", 30);
	private CustomLabel passwordLabel = new CustomLabel("Password");
	private CustomPasswordField passwordCheck = new CustomPasswordField("password", 30);
	private CustomLabel passwordCheckLabel = new CustomLabel("Password Check");
	private CustomButton buttonBack = new CustomButton("Back", 12);
	private CustomButton buttonRegister = new CustomButton("Register", 12);

	private JFrame frame;
	private static final long serialVersionUID = 1L;

	/**
	 * constructor with model
	 * 
	 * @param model
	 */
	@SuppressWarnings("deprecation")
	public RegisterView(RegisterModel model) {

		username.addFocusListener(new UsernameFocusListener());
		password.addFocusListener(new PasswordFocusListener());
		passwordCheck.addFocusListener(new PasswordCheckFocusListener());

		this.setLayout(new GridBagLayout());
		GridBagConstraints c = new GridBagConstraints();
		c.insets = new Insets(10, 10, 10, 10);

		c.gridx = 0;
		c.gridy = 1;
		add(usernameLabel, c);

		c.gridx = 0;
		c.gridy = 2;
		add(username, c);

		c.gridx = 0;
		c.gridy = 3;
		add(passwordLabel, c);

		c.gridx = 0;
		c.gridy = 4;
		add(password, c);

		c.gridx = 0;
		c.gridy = 5;
		add(passwordCheckLabel, c);

		c.gridx = 0;
		c.gridy = 6;
		add(passwordCheck, c);

		c.gridx = 0;
		c.gridy = 7;
		// add(emailAddressLabel, c);

		c.gridx = 0;
		c.gridy = 8;
		// add(emailAddress, c);

		c.gridx = 1;
		c.gridy = 10;
		add(buttonBack, c);

		c.gridx = 2;
		c.gridy = 10;
		add(buttonRegister, c);

		model.addObserver(this);

		frame = new JFrame();
		JFrame.setDefaultLookAndFeelDecorated(true);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setContentPane(this);
		frame.pack();
		frame.setVisible(true);
		this.setSize(450, 300);
		frame.setMinimumSize(this.getPreferredSize());

		buttonRegister.addActionListener(ae -> {

			if (JOptionPane.showConfirmDialog(null, "Register?", "Alert",
					JOptionPane.YES_NO_OPTION) == JOptionPane.NO_OPTION)
				return;

			String name = username.getText();

			String pass1 = password.getText();
			String pass2 = passwordCheck.getText();

			if (name.equals("") || pass1.equals("") || pass2.equals("")) {
				JOptionPane.showMessageDialog(null, "Both username and password can not be null!", "alert",
						JOptionPane.ERROR_MESSAGE);
				return;
			}

			if (model.checkUsername(name) && model.checkPassword(pass1, pass2) && model.register(name, pass1)) {
				frame.dispose();
				System.out.println("Register succeed!");
				model.back();
			}

			else {
				JOptionPane.showMessageDialog(null, "Invalid username or password!", "Request rejected",
						JOptionPane.ERROR_MESSAGE);
				return;
			}
		});

		buttonBack.addActionListener(ae -> {
			frame.dispose();
			model.back();
		});

	}

	@Override
	public void update(Observable o, Object arg) {

	}

	// listener classes
	private class UsernameFocusListener implements FocusListener {
		public void focusGained(FocusEvent e) {
			if (username.getText().equals("username")) {
				username.setText("");
			}
		}

		@Override
		public void focusLost(FocusEvent e) {
			if (username.getText().equals("")) {
				username.setText("username");
			}
		}
	}

	private class PasswordFocusListener implements FocusListener {
		@SuppressWarnings("deprecation")
		public void focusGained(FocusEvent e) {
			if (password.getText().equals("password")) {
				password.setText("");
			}
		}

		@SuppressWarnings("deprecation")
		@Override
		public void focusLost(FocusEvent e) {
			if (password.getText().equals("")) {
				password.setText("password");
			}
		}
	}

	private class PasswordCheckFocusListener implements FocusListener {
		@SuppressWarnings("deprecation")
		public void focusGained(FocusEvent e) {
			if (passwordCheck.getText().equals("password")) {
				passwordCheck.setText("");
			}
		}

		@SuppressWarnings("deprecation")
		@Override
		public void focusLost(FocusEvent e) {
			if (passwordCheck.getText().equals("")) {
				passwordCheck.setText("password");
			}
		}
	}

}
