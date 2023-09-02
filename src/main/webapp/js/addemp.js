function validate(val) {
    v1 = document.getElementById("empid");
    v2 = document.getElementById("fullname");
    v3 = document.getElementById("email");
    v4 = document.getElementById("doj");
    v5 = document.getElementById("ptax");
    v6 = document.getElementById("pf");
    v7 = document.getElementById("aadhar");
    v8 = document.getElementById("designation");
    v9 = document.getElementById("department");
    v10 = document.getElementById("pan");
    v11 = document.getElementById("cLeave");
    v12 = document.getElementById("sLeave");
    v13 = document.getElementById("pLeave");
    v14 = document.getElementById("ctc");
    v15 = document.getElementById("password");

    flag1 = true;
    flag2 = true;
    flag3 = true;
    flag4 = true;
    flag5 = true;
    flag6 = true;
    flag7 = true;
    flag8 = true;
    flag9 = true;
    flag10 = true;
    flag11 = true;
    flag12 = true;
    flag13 = true;
    flag14 = true;
    flag15 = true;

    if(val>=1 || val==0) {
        if(v1.value == "") {
            v1.style.borderColor = "red";
            flag1 = false;
        }
        else {
            v1.style.borderColor = "green";
            flag1 = true;
        }
    }

    if(val>=2 || val==0) {
        if(v2.value == "") {
            v2.style.borderColor = "red";
            flag2 = false;
        }
        else {
            v2.style.borderColor = "green";
            flag2 = true;
        }
    }
    if(val>=3 || val==0) {
        if(v3.value == "") {
            v3.style.borderColor = "red";
            flag3 = false;
        }
        else {
            v3.style.borderColor = "green";
            flag3 = true;
        }
    }
    if(val>=4 || val==0) {
        if(v4.value == "") {
            v4.style.borderColor = "red";
            flag4 = false;
        }
        else {
            v4.style.borderColor = "green";
            flag4 = true;
        }
    }
    if(val>=5 || val==0) {
        if(v5.value == "") {
            v5.style.borderColor = "red";
            flag5 = false;
        }
        else {
            v5.style.borderColor = "green";
            flag5 = true;
        }
    }
    if(val>=6 || val==0) {
        if(v6.value == "") {
            v6.style.borderColor = "red";
            flag6 = false;
        }
        else {
            v6.style.borderColor = "green";
            flag6 = true;
        }
    }
    if(val>=7 || val==0) {
        if(v7.value == "") {
            v7.style.borderColor = "red";
            flag7 = false;
        }
        else {
            v7.style.borderColor = "green";
            flag7 = true;
        }
    }
    if(val>=8 || val==0) {
        if(v8.value == "") {
            v8.style.borderColor = "red";
            flag8 = false;
        }
        else {
            v8.style.borderColor = "green";
            flag8 = true;
        }
    }
    if(val>=9 || val==0) {
        if(v9.value == "") {
            v9.style.borderColor = "red";
            flag9 = false;
        }
        else {
            v9.style.borderColor = "green";
            flag9 = true;
        }
    }
    if(val>=10 || val==0) {
        if(v10.value == "") {
            v10.style.borderColor = "red";
            flag10 = false;
        }
        else {
            v10.style.borderColor = "green";
            flag10 = true;
        }
    }
    if(val>=11 || val==0) {
        if(v11.value == "") {
            v11.style.borderColor = "red";
            flag11 = false;
        }
        else {
            v11.style.borderColor = "green";
            flag11 = true;
        }
    }
    if(val>=12 || val==0) {
        if(v12.value == "") {
            v12.style.borderColor = "red";
            flag12 = false;
        }
        else {
            v12.style.borderColor = "green";
            flag12 = true;
        }
    }
    if(val>=13 || val==0) {
        if(v13.value == "") {
            v13.style.borderColor = "red";
            flag13 = false;
        }
        else {
            v12.style.borderColor = "green";
            flag13 = true;
        }
    }
    if(val>=14 || val==0) {
        if(v14.value == "") {
            v14.style.borderColor = "red";
            flag14 = false;
        }
        else {
            v14.style.borderColor = "green";
            flag14 = true;
        }
    }
    if(val>=15 || val==0) {
        if(v15.value == "") {
            v15.style.borderColor = "red";
            flag15 = false;
        }
        else {
            v15.style.borderColor = "green";
            flag15 = true;
        }
    }

    flag = flag1 && flag2 && flag3 && flag4 && flag5 && flag6 && flag7 && flag8 && flag9 && flag10 && flag11 && flag12 && flag13 && flag14 && flag15;

    return flag;
}