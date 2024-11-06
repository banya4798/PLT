package PLT.service;

import java.util.List;

import PLT.vo.AssignmentVO;
import PLT.vo.FeedbackVO;
import PLT.vo.Submission_FileVO;
import PLT.vo.SubmissionsVO;

public interface AssignmentService {

	/*과제 등록*/
	String assignmentRegistration(AssignmentVO avo) throws Exception;

	List<AssignmentVO> getAssignMentList(AssignmentVO avo) throws Exception;

	List<Integer> getInstructor_id(String username) throws Exception;

	String sub_file(Submission_FileVO fileVO) throws Exception;

	String insert_sub(SubmissionsVO smv) throws Exception;

	SubmissionsVO getSubmissions(SubmissionsVO smv) throws Exception;

	List<SubmissionsVO> getSubmissionsList(String username) throws Exception;

	String give_score(FeedbackVO fvo) throws Exception;

	int update_submissions_grade(FeedbackVO fvo) throws Exception;

	void update_assignments_status(SubmissionsVO smv) throws Exception;

	int student_submiision_delete_from_instructor(int submissions_id) throws Exception;

	/*List<FeedbackVO> getFeedBackRating(AssignmentVO avo) throws Exception;*/

}
