trigger CustomSettingTrigger on Account (before Update) {
if(trigger.isUpdate && trigger.isBefore){
        customSettingTriggerHandlerClass.customSettingTriggerHandlerClassMethod(trigger.new);
    }
}