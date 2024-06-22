@isTest
public class SplitLongTextTest {
    
    @isTest
    static void testExtractText() {
        // Test case 1: Single comment line with one search text
        SplitLongText.CommentInput input1 = new SplitLongText.CommentInput();
        input1.comments = 'This is a comment line.';
        input1.searchTextList = new List<String>{'This'};
        
        List<SplitLongText.CommentOutput> outputList1 = SplitLongText.extract_text(new List<SplitLongText.CommentInput>{input1});
        System.assertEquals(1, outputList1.size());
        System.assertEquals(1, outputList1[0].resultValues.size());
        System.assertEquals('This', outputList1[0].resultValues[0].searchText);
        System.assertEquals('is a comment line.', outputList1[0].resultValues[0].extractedValue);
        
        // Test case 2: Multiple comment lines with multiple search texts
        SplitLongText.CommentInput input2 = new SplitLongText.CommentInput();
        input2.comments = 'first comment line.\nsecond comment line.';
        input2.searchTextList = new List<String>{'first', 'second'};
        
        List<SplitLongText.CommentOutput> outputList2 = SplitLongText.extract_text(new List<SplitLongText.CommentInput>{input2});
        System.assertEquals(1, outputList2.size());
        System.assertEquals(2, outputList2[0].resultValues.size());
        System.assertEquals('first', outputList2[0].resultValues[0].searchText);
        System.assertEquals('comment line.', outputList2[0].resultValues[0].extractedValue);
        System.assertEquals('second', outputList2[0].resultValues[1].searchText);
        System.assertEquals('comment line.', outputList2[0].resultValues[1].extractedValue);
        
        // Test case 3: No match found in comment lines
        SplitLongText.CommentInput input3 = new SplitLongText.CommentInput();
        input3.comments = 'This is a comment line.';
        input3.searchTextList = new List<String>{'No match'};
        
        List<SplitLongText.CommentOutput> outputList3 = SplitLongText.extract_text(new List<SplitLongText.CommentInput>{input3});
        System.assertEquals(1, outputList3.size());
        System.assertEquals(0, outputList3[0].resultValues.size());
        
        // Test case 4: Empty comment lines and search text list
        SplitLongText.CommentInput input4 = new SplitLongText.CommentInput();
        input4.comments = '';
        input4.searchTextList = new List<String>{};
        
        List<SplitLongText.CommentOutput> outputList4 = SplitLongText.extract_text(new List<SplitLongText.CommentInput>{input4});
        System.assertEquals(1, outputList4.size());
        System.assertEquals(0, outputList4[0].resultValues.size());
    }
    
}
