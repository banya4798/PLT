package PLT.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import PLT.dao.AssignmentDAO;
import PLT.service.AssignmentService;
import PLT.vo.AssignmentVO;

@Service("assignmentService")
public class AssignmentImpl implements AssignmentService {

	@Resource(name = "assignmentDAO")
	private AssignmentDAO assignmentDAO;

	/*과제 등록*/
	@Override
	public String assignmentRegistration(AssignmentVO avo) throws Exception {
		return assignmentDAO.assignmentRegistration(avo);
	}
}
