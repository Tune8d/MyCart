package board.db;

import java.sql.Timestamp;

public class BoardDTO {
	private int boardID;
	private String boardTitle;
	private int	boardPrice;
	private int boardEa;
	private String boardSeller;
	private String boardSellerLink;
	private Timestamp boardDate;
	private int boardAvailable;
	private String boardUserID;
	
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
	public String getBoardSeller() {
		return boardSeller;
	}
	public void setBoardSeller(String boardSeller) {
		this.boardSeller = boardSeller;
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
