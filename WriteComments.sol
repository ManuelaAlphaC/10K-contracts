// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Comments{
    
  // il contatore che incrementa di uno ogni volta che viene scritto un commento
    uint256 comments;

  // le informazzioni richieste e memorizzate per ogni commento
    struct Comment {
        address from;
        string _comment;
        uint256 postId;
    }
  // memorizza il comenuto di tutti i messaggi scritti dai buyers
    Comment[] allComments;

  // memorizza il numero di commenti scritti da un buyer
    mapping(address => uint256) public commentPerBuyer;

    event NewComment(
        address indexed from,
        uint256 postId,
        string _comment,
        uint256 timestamp
    );

  // scrivi un commento che verrà memorizzato sulla blockchain
    function writeComment(string memory _myComment, uint256 postId) public {
        allComments.push(Comment(msg.sender, _myComment, postId));
        comments ++;
        commentPerBuyer[msg.sender] ++;

        emit NewComment(
            msg.sender,
            postId,
            _myComment,
            block.timestamp
        );
    }

  // ottieni il contenuto di tutti i commenti scritti
    function getAllComments() public view returns(Comment[]memory){
        return allComments;
    }

  // ottieni il totale dei commenti scritti 
    function getTotalComments() public view returns(uint256){
        return comments;
    }
}
