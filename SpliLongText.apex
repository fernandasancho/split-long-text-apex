public class SplitLongText {

    // Inner class to represent the input data
    public class CommentInput {
        @InvocableVariable(label='Comments')
        public String comments;

        @InvocableVariable(label='Search Text')
        public List<String> searchTextList;
    }
    
    // Inner class to represent the output data
    public class CommentOutput {
        @InvocableVariable(label='results')
        public List<SplitLongText_resultValues> resultValues = new List<SplitLongText_resultValues>();
        
    }

    // Invocable method to extract values based on search text
    @InvocableMethod(label='Extract Long Text Values' description='')
    public static List<CommentOutput> extract_text (List<CommentInput> inputList) {

        List<SplitLongText_resultValues> extractedValuesList = new List<SplitLongText_resultValues>();

        for (CommentInput input : inputList) {
            String comment = input.comments;
            List<String> commentLines = comment.split('\n');
            List<String> searchTextList = input.searchTextList;

            for (String searchText : searchTextList) {
                System.debug('=====================================');
                System.debug('Processing search text: ' + searchText);
                
                String extractedValue = extractValueFromComment(commentLines, searchText);
                if(extractedValue != null) {
                    
                    System.debug('Extracted value: ' + extractedValue);
                                                                                                                                                                                                                                                                                                                                                
                    extractedValuesList.add(new SplitLongText_resultValues(searchText, extractedValue));
                    //added else statement for the debug
                     } else {
                    System.debug('No value extracted for ' + searchText);
                }
            }
        }
        
        CommentOutput returnVal = new CommentOutput();
        returnVal.resultValues = extractedValuesList;
        
        List<CommentOutput> returnVals = new List<CommentOutput>();
        returnVals.add(returnVal);

        System.debug('Extracted Values List: ' + extractedValuesList);
        
        return returnVals;
        
    }

    // Helper method to extract value from comment based on search text
    private static String extractValueFromComment(List<String> commentLines, String searchText) {
        String extractedValue = null;
        
        for(String commentLine: commentLines){
            if(commentLine.indexOf(searchText) == 0){
                extractedValue = commentLine.substring(searchText.length()).trim();
                break;
            }
        }
        
          System.debug('Extracted Value for Test Apx cls ' + searchText + extractedValue);

        return extractedValue;
    }
}