package board.db;

import java.sql.Timestamp;

public class BoardDTO {
	private int boardID;
	private int boardNumber;
	private String boardTitle;
	private int	boardPrice;
	private int boardEa;
	private String boardMemo;
	private String boardSellerLink;
	private String boardTag;
	private Timestamp boardDate;
	private int boardAvailable;
	private String boardUserID;
	private int boardListSum;
	private String boardType;

	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public int getBoardListSum() {
		return boardListSum;
	}
	public void setBoardListSum(int boardListSum) {
		this.boardListSum = boardListSum;
	}
	public int getBoardNumber() {
		return boardNumber;
	}
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	public String getBoardTag() {
		return boardTag;
	}
	public void setBoardTag(String boardTag) {
		this.boardTag = boardTag;
	}

	
	
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getBoardPrice() {
		return boardPrice;
	}
	public void setBoardPrice(int boardPrice) {
		this.boardPrice = boardPrice;
	}
	public int getBoardEa() {
		return boardEa;
	}
	public void setBoardEa(int boardEa) {
		this.boardEa = boardEa;
	}
	public String getBoardMemo() {
		return boardMemo;
	}
	public void setBoardMemo(String boardMemo) {
		this.boardMemo = boardMemo;
	}
	public String getBoardSellerLink() {
		return boardSellerLink;
	}
	public void setBoardSellerLink(String boardSellerLink) {
		this.boardSellerLink = boardSellerLink;
	}
	public Timestamp getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardAvailable() {
		return boardAvailable;
	}
	public void setBoardAvailable(int boardAvailable) {
		this.boardAvailable = boardAvailable;
	}
	public String getBoardUserID() {
		return boardUserID;
	}
	public void setBoardUserID(String boardUserID) {
		this.boardUserID = boardUserID;
	}
	
	
	
	
}
