package com.fr.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.jsp.board.model.service.ReviewBoardService;
import com.fr.jsp.board.model.vo.ReviewBoard;
import com.fr.jsp.common.PageInfo;
import com.fr.jsp.common.model.dao.AccessLogDao;
import com.fr.jsp.common.model.service.AccessLogService;
import com.fr.jsp.product.model.service.ProductService;
import com.fr.jsp.product.model.vo.ProductDetail;
import com.fr.jsp.product.model.vo.ProductSimple;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/productDetail.do")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//변수 선언
		ArrayList<ReviewBoard> reviewList = null;
		ArrayList<ProductSimple> relatedCategoryProduct= null;
		ArrayList<ProductSimple> optionProduct = null;
		String memberNum = null;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("memberNum")!=null){
			
			memberNum=(String)session.getAttribute("memberNum");
		}
		
		ProductDetail p = null;
	
		ProductService ps = new ProductService();					//product 서비스
		ReviewBoardService rbs = new ReviewBoardService();			//리뷰 서비스
		
		String page = "";
		PageInfo pi =null;
		int currPage = 1; 											// 현재 페이지
		int limit = 5; 	
		
		//서블릿에서 건내 받기
		String productNum = request.getParameter("productNum"); //productList.jsp에서 받은 선택된 productNum
		
		if(productNum!=null)
			productNum=productNum.trim();
		else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 정보를 찾을 수 없습니다.");
		}
	
		if (request.getParameter("currPage") != null) {				
			currPage = Integer.parseInt(request.getParameter("currPage"));
		}
		
		/*//접속 로그 테이블에 추가
		AccessLogService as = new AccessLogService();
		
		if(as.insertLog(memberNum)<0)
			System.out.println("logInsert Error");*/
		
		int checkResult = ps.insertProductCheck(memberNum,productNum);
		
		if(checkResult<0)
			System.out.println("체크 로그에 인서트 실패");
		
	
		//표시할 옵션 프로덕트 정보 가져오기
		optionProduct = ps.getOptionProductList();
		
		
		// 페이지 관련 변수 전달용 VO 생성
		pi = new PageInfo(currPage, rbs.getListCount(productNum), limit);

		//리뷰 가져오기
		reviewList = rbs.selectList(productNum, pi);
		
		//상품번호를 이용해 상품 정보 가져오기
		p = ps.getOneProduct(productNum);
		
		
		if(p!= null){
		//연관 카테고리 상품 가져오기
			relatedCategoryProduct= 
					ps.getProductList("none", p.getProductCategoryName());
			relatedCategoryProduct= new ArrayList(relatedCategoryProduct.subList(0, 10>relatedCategoryProduct.size()?relatedCategoryProduct.size():10)) ;
			
			for(int i=0;i<relatedCategoryProduct.size();++i){
				if(relatedCategoryProduct.get(i).getProductName().equals(p.getProductName())){
					relatedCategoryProduct.remove(i);
					break;
				}
			}
			
			if (reviewList!=null&&optionProduct!=null) {

				request.setAttribute("reviewList", reviewList);
				request.setAttribute("pi", pi);
				request.setAttribute("product", p);
				request.setAttribute("optionProduct", optionProduct);
				request.setAttribute("relatedCategoryProduct", relatedCategoryProduct);
				page = "views/product/product.jsp";
			}else{
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "리뷰정보를 조회할 수 없습니다.");
				
			}
			
		} else {
			
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품 정보를 찾을 수 없습니다.");
			
			
		}
	

		request.getRequestDispatcher(page).forward(request, response);

	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
