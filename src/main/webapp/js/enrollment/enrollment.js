
$(document).ready(function() {
 /*수강신청 하기*/
function enrollment(){
    var data_title = document.getElementById('title'); // 강좌명
    var title = data_title.getAttribute('data-title');
    
    var data_department = document.getElementById('department'); // 학부(과)
    var department = data_department.getAttribute('data-department');
    
    var data_semester = document.getElementById('semester'); // 학기
    
    
    var data_credit = document.getElementById('credit'); // 학점
    
    
    var data_classification = document.getElementById('classification'); // 전공
    
    
    var data_professor = document.getElementById('professor');
    var professor = data_professor.getAttribute('data-professor');
    
    var data_registe = document.getElementById('registe').value;
    
    console.log(title);
    console.log(department);
    console.log(semester);
    console.log(credit);
    console.log(classification);
    console.log(professor);
    console.log(data_registe);
    // 신청된 
    var selectedCourses = [];
    $('#courseTable .form-check-input:checked').each(function(){
        selectedCourses.push($(this).val());
        
    });
    
    // 
    if (selectedCourses.length > 0) {
        console.log('선택된 과목:', selectedCourses);
    }
    
    
}
})
