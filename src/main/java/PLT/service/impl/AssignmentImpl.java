package PLT.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import PLT.dao.AssignmentDAO;
import PLT.service.AssignmentService;
import PLT.vo.AssignmentVO;
import PLT.vo.FeedbackVO;
import PLT.vo.Submission_FileVO;
import PLT.vo.SubmissionsVO;

@Service("assignmentService")
public class AssignmentImpl implements AssignmentService {

	@Resource(name = "assignmentDAO")
	private AssignmentDAO assignmentDAO;

	/*과제 등록*/
	@Override
	public String assignmentRegistration(AssignmentVO avo) throws Exception {
		return assignmentDAO.assignmentRegistration(avo);
	}

	@Override
	public List<AssignmentVO> getAssignMentList(AssignmentVO avo) throws Exception {
		return assignmentDAO.getAssignMentList(avo);
	}

	@Override
	public List<Integer> getInstructor_id(String username) throws Exception {
		return assignmentDAO.getInstructor_id(username);
	}

	@Override
	public String sub_file(Submission_FileVO fileVO) throws Exception {
		return assignmentDAO.sub_file(fileVO);
	}

	@Override
	public String insert_sub(SubmissionsVO smv) throws Exception {
		return assignmentDAO.insert_sub(smv);
	}

	@Override
	public SubmissionsVO getSubmissions(SubmissionsVO smv) throws Exception {
		return assignmentDAO.getSubmissions(smv);
	}

	@Override
	public List<SubmissionsVO> getSubmissionsList(String username) throws Exception {
		return assignmentDAO.getSubmissionsList(username);
	}

	@Override
	public String give_score(FeedbackVO fvo) throws Exception {
		return assignmentDAO.give_score(fvo);
	}

	@Override
	public int update_submissions_grade(FeedbackVO fvo) throws Exception {
		return assignmentDAO.update_submissions_grade(fvo);
	}

	@Override
	public void update_assignments_status(SubmissionsVO smv) throws Exception {
		assignmentDAO.update_assignments_status(smv);

	}

	@Override
	public int student_submiision_delete_from_instructor(int submissions_id) throws Exception {
		return assignmentDAO.student_submiision_delete_from_instructor(submissions_id);
	}

	/*@Override
	public List<FeedbackVO> getFeedBackRating(AssignmentVO avo) throws Exception {
		return assignmentDAO.getFeedBackRating(avo);
	}*/

}
