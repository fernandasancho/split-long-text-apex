public class SplitLongText_resultValues {
 	//@InvocableVariable(label='searchText')
    @AuraEnabled public String searchText;
    
    //@InvocableVariable(label='extractedValue')
    @AuraEnabled public String extractedValue;
    
    // Constructor
    public SplitLongText_resultValues (String searchText, String extractedValue) {
        this.searchText = searchText;
        this.extractedValue = extractedValue;
    }
}
