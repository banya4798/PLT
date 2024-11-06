package PLT.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import PLT.vo.AssignmentVO;
import PLT.vo.FeedbackVO;
import PLT.vo.Submission_FileVO;
import PLT.vo.SubmissionsVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("assignmentDAO")
public class AssignmentDAO extends EgovAbstractDAO {

	public String assignmentRegistration(AssignmentVO avo) {
		return (String) insert("assignmentRegistration", avo);
	}

	public List<AssignmentVO> getAssignMentList(AssignmentVO avo) {
		return (List<AssignmentVO>) list("getAssignMentList", avo);
	}

	public List<Integer> getInstructor_id(String username) {
		return (List<Integer>) list("getInstructor_id", username);
	}

	public String insert_sub(SubmissionsVO smv) {
		return (String) insert("insert_sub", smv);
	}

	public SubmissionsVO getSubmissions(SubmissionsVO smv) {
		return (SubmissionsVO) select("getSubmissions", smv);
	}

	public String sub_file(Submission_FileVO fileVO) {
		return (String) insert("sub_file", fileVO);
	}

	public List<SubmissionsVO> getSubmissionsList(String username) {
		return (List<SubmissionsVO>) list("getSubmissionsList", username);
	}

	public String insert_sub_status_student(String username) {
		return (String) insert("insert_sub_status_student", username);
	}

	public String give_score(FeedbackVO fvo) {
		return (String) insert("give_score", fvo);
	}

	public int update_submissions_grade(FeedbackVO fvo) {
		return update("update_submissions_grade", fvo);
	}

	public void update_assignments_status(SubmissionsVO smv) {
		update("update_assignments_status", smv);
	}

	public List<FeedbackVO> getFeedBackRating(AssignmentVO avo) {
		return (List<FeedbackVO>) list("getFeedBackRating", avo);
	}

	public int student_submiision_delete_from_instructor(int submissions_id) {
		return delete("student_submiision_delete_from_instructor", submissions_id);
	}

}
