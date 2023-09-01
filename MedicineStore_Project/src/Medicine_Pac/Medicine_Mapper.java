package Medicine_Pac;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Medicine_Mapper implements RowMapper<Medicine> {

	public Medicine mapRow(ResultSet resultSet, int i) throws SQLException {
		int id = resultSet.getInt("id");
		int billNo = resultSet.getInt("bill_no");
		String medicineName = resultSet.getString("medicine_name");
		int quantity = resultSet.getInt("quantity");
		double price = resultSet.getDouble("price");

		// Create a new Medicine instance and set the values
		Medicine medicine = new Medicine(id, billNo, medicineName, quantity, price);
		return medicine;
	}

}
