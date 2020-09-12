/**
 * 
 */

$('#tabs-icons-text-2-tab').on('click', function() {
	const currentSelectedTab = $('.tab3-btn .active').attr('class');
	
	if (currentSelectedTab.indexOf('tab-tab1') != -1) {
		loadTabTab1();
	} else if (currentSelectedTab.indexOf('tab-tab2') != -1) {
		
	}
});

function loadTabTab1() {
	const project_no = $('input[name=project_no_hidden]').val();
	$.ajax({
		url: '/CONNECTOR/user/interviewee/loadTabTab1.do',
	    type: 'POST',
	    async: false,
	    data: {
	    	project_no: project_no,
	    },
	    success: function (data) {
	    	$('.tab-tab1 tbody').empty();
	    	$.each(data, function(index, item) {
	    		let rateHTML = '';
	    		if (4 <= item.AVG && item.AVG <= 7) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
	    		} else if (9 <= item.AVG && item.AVG <= 11) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
	    		} else if (12 <= item.AVG && item.AVG <= 14) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
	    		} else if (15 <= item.AVG && item.AVG <= 17) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="far fa-star" style="color: #ff4a1c;"></i>\n';
	    		} else if (18 <= item.AVG && item.AVG <= 20) {
		    		rateHTML = '' +
		    		'<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n' +
		            '<i class="fas fa-star" style="color: #ff4a1c;"></i>\n';
	    		}
	    		
	    	    const textHTML = '\t\t\t\t\t\t\t        <tr>\n' +
	            '\t\t\t\t\t\t\t          <td class="table-user">\n' +
	            '\t\t\t\t\t\t\t            <b>' + item.MEM_NAME + '</b>\n' +
	            '\t\t\t\t\t\t\t          </td>\n' +
	            '\t\t\t\t\t\t\t          <td>\n' +
	            '\t\t\t\t\t\t\t            <span class="text-muted">' + item.MEM_MAIL + '</span>\n' +
	            '\t\t\t\t\t\t\t          </td>\n' +
	            '\t\t\t\t\t\t\t          <td>\n' +
	            rateHTML +
	            '\t\t\t\t\t\t\t          </td>\n' +
	            '\t\t\t\t\t\t\t          <td>\n' +
	            '\t\t\t\t\t\t\t            <label class="custom-toggle">\n' +
	            '\t\t\t\t\t\t\t              <input type="checkbox" value="' + item.MEM_ID + '">\n' +
	            '\t\t\t\t\t\t\t              <span class="custom-toggle-slider rounded-circle" data-label-off="No" data-label-on="Yes"></span>\n' +
	            '\t\t\t\t\t\t\t            </label>\n' +
	            '\t\t\t\t\t\t\t          </td>\n' +
	            '\t\t\t\t\t\t\t        </tr>';
	    	    
	    	    $('.tab-tab1 tbody').append(textHTML);
	    	});
	    },
	    error: function (xhr, err) {
	        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
	        alert("responseText: " + xhr.responseText);
	    }
	});
}

function loadTabTab2() {
	$.ajax({
		url: '/CONNECTOR/user/',
	    type: 'POST',
	    async: false,
	    data: {
	    	s
	    },
	    success: function (data) {
	    	
	    },
	    error: function (xhr, err) {
	        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
	        alert("responseText: " + xhr.responseText);
	    }
	});
}

$('.tab-tab1 .btn-interview-success').on('click', function() {
	const tr_arr = $('.tab-tab1 tbody tr');
	
	let result_arr = [];
	$.each(tr_arr, function(idx, item) {
		const val = $(item).find('input[type=checkbox]:checked').val();
		
		if (val != undefined) {
			result_arr.push(val);
		}
	});
	
	let result_str = result_arr.join(',');
	
	if (result_arr.length == 0) {
		Swal.fire(
		  '경고',
		  '먼저 면접자를 선택해주세요.',
		  'warning'
		);
		
		return;
	}
	
	const project_no = $('input[name=project_no_hidden]').val();
	Swal.fire({
	  title: '합격',
	  text: "선택한 면접자를 힙격시키겠습니까?",
	  icon: 'success',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '확인',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
		  $.ajax({
			url: '/CONNECTOR/user/interviewee/confirmInterviewee.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: project_no,
		    	mem_id_all: result_str
		    },
		    success: function (data) {
		    	if (data) {
		    		Swal.fire(
    				  '성공',
    				  '선택한 면접자가 합격 처리 되었습니다.',
    				  'success'
    				);
		    		
		    		loadTabTab1();
		    	} else {
		    		Swal.fire(
    				  '에러',
    				  '면접자를 합격시키는 과정에서 에러 발생!',
    				  'danger'
    				);
		    	}
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
		  });
	  }
	});
});

$('.tab-tab1 .btn-interview-fail').on('click', function() {
	const tr_arr = $('.tab-tab1 tbody tr');
	
	let result_arr = [];
	$.each(tr_arr, function(idx, item) {
		const val = $(item).find('input[type=checkbox]:checked').val();
		
		if (val != undefined) {
			result_arr.push(val);
		}
	});
	
	let result_str = result_arr.join(',');
	
	if (result_arr.length == 0) {
		Swal.fire(
		  '경고',
		  '먼저 면접자를 선택해주세요.',
		  'warning'
		);
		
		return;
	}
	
	const project_no = $('input[name=project_no_hidden]').val();
	Swal.fire({
	  title: '탈락',
	  text: "선택한 면접자를 탈락시키겠습니까?",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: '확인',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
		  $.ajax({
			url: '/CONNECTOR/user/interviewee/failInterviewee.do',
		    type: 'POST',
		    async: false,
		    data: {
		    	project_no: project_no,
		    	mem_id_all: result_str
		    },
		    success: function (data) {
		    	if (data) {
		    		Swal.fire(
    				  '성공',
    				  '선택한 면접자가 탈락 처리 되었습니다.',
    				  'success'
    				);
		    		
		    		loadTabTab1();
		    	} else {
		    		Swal.fire(
    				  '에러',
    				  '면접자를 탈락시키는 과정에서 에러 발생!',
    				  'danger'
    				);
		    	}
		    },
		    error: function (xhr, err) {
		        alert("readyState: " + xhr.readyState + "\nstatus: " + xhr.status);
		        alert("responseText: " + xhr.responseText);
		    }
		  });
	  }
	});
});