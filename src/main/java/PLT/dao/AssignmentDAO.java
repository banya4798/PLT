package PLT.dao;

import org.springframework.stereotype.Repository;

import PLT.vo.AssignmentVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("assignmentDAO")
public class AssignmentDAO extends EgovAbstractDAO {

	public String assignmentRegistration(AssignmentVO avo) {
		return (String) insert("assignmentRegistration", avo);
	}

}
