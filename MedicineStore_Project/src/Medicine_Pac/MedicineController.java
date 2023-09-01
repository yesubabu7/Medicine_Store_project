package Medicine_Pac;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MedicineController {

	private Medicine_DAO medicine_dao;
	List<Medicine> medicines = null;

	@Autowired
	public MedicineController(Medicine_DAO m) {
		medicine_dao = m;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String listMedicines(Model model) {

		medicines = medicine_dao.getAllMedicines();

		List<String> medicineNames = new ArrayList<>();
		for (Medicine medicine : medicines) {
			medicineNames.add(medicine.getMedicineName());
		}

		model.addAttribute("medicines", medicines);
		model.addAttribute("medicineNames", medicineNames);
		return "Medicine_Display"; // Return the view name for displaying the list
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateMedicine(@RequestParam("id") String id, @RequestParam("quantity") int quantity,
			@RequestParam("price") double price, Model model) {

		// Call the service to update the medicine record
		boolean a = medicine_dao.updated(Integer.parseInt(id), quantity, price);
		if (a) {
			// Retrieve the updated medicine data
			Medicine updatedMedicine = medicine_dao.getMedicineById(Integer.parseInt(id));
			// Add the updated medicine to the model
			model.addAttribute("updatedMedicine", updatedMedicine);

		}
		return "updated_data";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addMedicine(@RequestParam("medicineName") String medicineName, @RequestParam("q") String quantity,
			@RequestParam("p") String price, @RequestParam("b") String bill, Model model) {
		medicines = medicine_dao.getAllMedicines();
		int id = medicines.size() + 1;
		boolean check = medicine_dao.addMedicine(id, medicineName, quantity, price, bill);

		if (check) {
			// If the medicine was added successfully, set the added data in the model
			model.addAttribute("successMessage", "Medicine added successfully");
			model.addAttribute("medicineName", medicineName);
			model.addAttribute("quantity", quantity);
			model.addAttribute("price", price);
			model.addAttribute("bill", bill);
		} else {
			// Handle the case where the medicine addition failed
			model.addAttribute("errorMessage", "Failed to add medicine");
		}

		// Redirect to a success page or display a confirmation message
		return "added"; // Redirect to a success page
	}

}