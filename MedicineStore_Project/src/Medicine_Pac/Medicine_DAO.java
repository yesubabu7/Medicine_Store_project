package Medicine_Pac;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public interface Medicine_DAO {

	List<Medicine> getAllMedicines();

	boolean updated(int parseInt, int quantity, double price);

	List<Medicine> get_data(String name);

	Medicine getMedicineById(int parseInt);

	boolean addMedicine(int id, String medicineName, String quantity, String price, String bill);

}

@Component
class Medicine_dao_imp implements Medicine_DAO {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public Medicine_dao_imp(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);

	}

	@Override
	public List<Medicine> getAllMedicines() {

		return jdbcTemplate.query("select * from BillMedicine", new Medicine_Mapper());

	}

	@Override
	public boolean updated(int id, int quantity, double price) {
		String sql = "UPDATE BillMedicine SET quantity = ?, price = ? WHERE id = ?";

		int updatedRows = jdbcTemplate.update(sql, quantity, price, id);

		return updatedRows > 0;
	}

	@Override
	public List<Medicine> get_data(String name) {
		String sql = "SELECT * FROM  BillMedicine  WHERE medicine_name = ?";

		List<Medicine> medicines = jdbcTemplate.query(sql, new Object[] { name }, new Medicine_Mapper());

		return medicines;

	}

	public Medicine getMedicineById(int id) {
		String sql = "SELECT * FROM BillMedicine WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { id }, new Medicine_Mapper());
	}

	public boolean addMedicine(int id, String medicineName, String quantity, String price, String bill) {
		String sql = "INSERT INTO BillMedicine (id, bill_no, medicine_name, quantity, price) VALUES (?, ?, ?, ?, ?)";

		// Use JdbcTemplate to execute the SQL query
		int rowsInserted = jdbcTemplate.update(sql, id, Integer.parseInt(bill), medicineName,
				Integer.parseInt(quantity), Double.parseDouble(price));

		return rowsInserted > 0;
	}

}
