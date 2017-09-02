import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JOptionPane;
import static javax.swing.JOptionPane.WARNING_MESSAGE;

void warningDialog(String message, String title) {
  if (jPanel == null) jPanel = new JPanel();
  JOptionPane.showMessageDialog(jPanel, message, title, WARNING_MESSAGE);
}