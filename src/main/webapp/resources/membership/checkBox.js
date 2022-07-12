window.onload = function () {
const checkAll = document.getElementById('chkAll');
const chks = document.querySelectorAll('.chk');  
const chkBoxLength = chks.length;
var accept = document.querySelector(".fpmgBt2");
var agreeMsg = document.querySelector("#agreeMsg");


checkAll.addEventListener('click', function(event) {
    if(event.target.checked)  {
        chks.forEach(function(value){
        value.checked = true;
    })
    }
    else {
       chks.forEach(function(value){
       value.checked = false;
    })
    }
  });


    for (chk of chks){
    chk.addEventListener('click', function() {
        let count = 0;
        chks.forEach(function(value){
            if(value.checked == true){
                count++;
            }
        })
        if(count !== chkBoxLength){
            checkAll.checked = false;
        }else{
            checkAll.checked = true;
        }
      })
}

//필수선택사항 체크시 동의버튼 활성화 
accept.addEventListener('click',function(e){
    if(chks[0].checked == true && chks[1].checked == true){
    }
    else{agreeMsg.style.display = 'block';
    e.preventDefault();
    console.log(chks[1].checked);
    }
   });

 }
 





