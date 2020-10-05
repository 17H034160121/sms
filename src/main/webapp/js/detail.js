
$(function() {

    //单条删除的警示框单机事件
    function deleteOnly(id){
        if (confirm("确定删除吗?")){
            location.href = "${pageContext.request.contextPath}/DelSelectedServlet?uid="+id+"&type=Culture";
        }
    }


    window.onload = function () {
        //删除选中的弹出警示框单击事件
        document.getElementById("delSelected").onclick = function () {
            let cbs = document.getElementsByName("uid");
            let key = false;
            for (let i = 0; i<cbs.length; i++){
                if (cbs[i].checked){
                    key = true;
                    break;
                }
            }
            if(key){
                if(confirm("确定删除选中数据吗?")) {
                    document.getElementById("form").submit();
                }
            }else {
                alert("选择为空,请选择");
            }
        }

        //全选复选框的单机事件
        document.getElementById("firstCb").onclick = function () {
            let cbs = document.getElementsByName("uid");
            for (let i = 0; i < cbs.length; i++) {
                cbs[i].checked = this.checked;
            }
        }

        //点击当行选中复选框
        $("tr").slice(1).on('click', function (event) { // slice(1) 去掉表头
            // 找到checkbox对象
            let chks = $("input[type='checkbox']",this);
            if ( chks.prop("checked") ) {
                chks.prop("checked",false);
            } else {
                chks.prop("checked",true);
            }
        });

        //阻止冒泡避免出现重复点击事件,导致失效
        let $input = $("input[type='checkbox']");
        for (let i = 0; i < $input.length; i++) {
            $($input[i]).click(function(event) {
                event.stopPropagation();
            });
        }

    }
});
