
//单条删除的警示框单机事件
function deleteOnly(id){
    if (confirm("确定删除吗?")){
        $.ajax({
            type: "get",
            url: "/commodity/deleteById",
            data: {
                id : id
            },
            success: function (data){
                $("#message").empty();
                $("#message").append(data['message']);
                $("#myModal").modal();
                location.href = "/commodity/detail";
            }
        })
    }
}

function editOnly(id){
    $("#commodityModal :input").not(":button, :submit, :reset, :hidden, :checkbox, :radio").val("");
    $.ajax({
        type: "get",
        url: "/commodity/findById",
        data: {
            id : id
        },
        success: function (data){
            $("#id1").val(data["id"])
            $("#name1").val(data["name"])
            $("#qrCode1").val(data["qrCode"])
            $("#num").val(data["num"])
            $("#description1").val(data["description"])
            $("#price").val(data["price"])
        }
    })
    $("#commodityModal").modal();
}

function addModal(){
    $("#commodityModal :input").not(":button, :submit, :reset, :hidden, :checkbox, :radio").val("");
    $("#commodityModal").modal();
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
                document.getElementById("selectForm").submit();
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

//前一页点击事件
function movePrevious(index){
    move(index-1)
}

//后一页点击事件
function moveAfter(index){
    move(index+1)
}

//指定页数点击事件
function moveTarget(index){
    move(index)
}

function move(index){
    window.location.href = "/commodity/move?index="+index;
}

$("#commodityForm").submit(function (){
    event.preventDefault();
    let fields = $("#commodityForm").serializeArray();
    let obj = {};
    $.each(fields, function(index, field) {
        obj[field.name] = field.value;
    })
    $.ajax({
        type: "post",
        url: "/commodity/edit",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(obj),
        datatype: "json",
        success:function (data){
            $("#commodityModal").modal("hide");
            $("#message").empty();
            $("#message").append(data['message']);
            $("#myModal").modal();
        }
    })
})

