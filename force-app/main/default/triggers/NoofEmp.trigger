trigger NoofEmp on Account (After insert,After Update) {
    if(trigger.isInsert && trigger.isAfter  ){
        NoOfEmployees.CreateContacts(trigger.new);
    } if(trigger.isUpdate && trigger.isAfter){
        NoOfEmployees.UpdateContacts(trigger.new);
    }
    }