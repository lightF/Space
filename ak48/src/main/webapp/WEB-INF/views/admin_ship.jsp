<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_css.css?v=202309037">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>ê´ë¦¬ì íì´ì§</title>
</head>
<body>
    <form id="" name="" method="" action="">
        <div class="membody">
           <div class="adtitle">ADMINISTRATOR MEMBERSHIP</div>
           <div class="memoutline" >
              <div class="memsel1">
                <ul class="memu">
                    <li class="memfont">ìì ë° ë¶ìì í</li>
                    <li class="memlisel1">
                        <select class="kosel">
                            <option value="">ììì í</option>
                            <option value="ë³¸ì¬">ë³¸ì¬</option>
                            <option value="ê²½ê¸°ë">ê²½ê¸°ë</option>
                            <option value="ì¸ì²">ì¸ì²</option>
                            <option value="ëì ">ëì </option>
                            <option value="ì¸ì¢">ì¸ì¢</option>
                            <option value="ê´ì£¼">ê´ì£¼</option>
                            <option value="ëêµ¬">ëêµ¬</option>
                            <option value="ì¸ì°">ì¸ì°</option>
                            <option value="ì ë¼ë¨ë">ì ë¼ë¨ë</option>
                            <option value="ì ë¼ë¶ë">ì ë¼ë¶ë</option>
                            <option value="ì¶©ì²­ë¨ë">ì¶©ì²­ë¨ë</option>
                            <option value="ì¶©ì²­ë¶ë">ì¶©ì²­ë¶ë</option>
                            <option value="ê²½ìë¨ë">ê²½ìë¨ë</option>
                            <option value="ê²½ìë¶ë">ê²½ìë¶ë</option>
                            <option value="ì ì£¼ë">ì ì£¼ë</option>                            
                        </select>
                    </li>
                </ul>
                <ul class="memu">
                    <li class="memlisel1">
                        <select class="kosel">
                            <option value="">ë¶ìì í</option>
                            <option value="ìì">ìì</option>
                            <option value="íê³í">íê³í</option>
                            <option value="ììí">ììí</option>
                            <option value="ì ì°í">ì ì°í</option>
                            <option value="ëìì¸í">ëìì¸í</option>
                            <option value="MDí">MDí</option>
                            <option value="ê³ ê°ê´ë¦¬í">ê³ ê°ê´ë¦¬í</option>
                        </select>
                    </li>
                  </ul>
              </div>
              <div class="memsel1">
                <ul class="memu">
                    <li class="memfont">ì´ë¦</li>
                    <li><input type="text" class="admamber1" id="" name="" value="" placeholder="ì´ë¦ì ìë ¥í´ ì£¼ì¸ì"></li>
                    <li class="memfont1">ì§ì±</li>
                    <li>
                        <select class="kosel">
                            <option value="">ìì</option>
                            <option value="ì¤ì¥">ì¤ì¥</option>
                            <option value="íì¥">íì¥</option>
                            <option value="ë¶ì¥">ë¶ì¥</option>
                            <option value="ì°¨ì¥">ì°¨ì¥</option>
                            <option value="ê³¼ì¥">ê³¼ì¥</option>
                            <option value="ëë¦¬">ëë¦¬</option>
                            <option value="ì£¼ì">ì£¼ì</option>
                            <option value="ì¬ì">ì¬ì</option>
                            <option value="ì ì²´ ê´ë¦¬ì">ì ì²´ ê´ë¦¬ì</option>
                        </select>
                    </li>
                </ul>
              </div>
             <div class="memsel2">
                <ul>
                    <li class="memfont">ìì´ë</li>
                    <li><input type="text" class="admamber2" id="" name="" value="" placeholder="ìì´ëë¥¼ ìë ¥í´ ì£¼ì¸ì"></li>
                    <li><button class="idcheck" id="" name="" value="" >ì¤ë³µì²´í¬</button></li>
                </ul>    
              </div>
              <div class="memsel2">
                <ul>
                    <li class="memfont">í¨ì¤ìë</li>
                    <li><input type="password" class="admamber1" id="" name="" value="" placeholder="í¨ì¤ìëë¥¼ ìë ¥í´ ì£¼ì¸ì"></li>
                    <li class="memfont">í¨ì¤ìëíì¸</li>
                    <li><input type="password" class="admamber4" id="" name="" value="" placeholder="ëì¼í í¨ì¤ìëë¥¼ ìë ¥í´ ì£¼ì¸ì"></li>
                </ul>    
              </div>
              <div class="memsel3">
                <ul>
                    <li class="memfont">ì´ë©ì¼</li>
                    <li><input type="text" class="admamber3" id="" name="" value="" placeholder="ì´ë©ì¼ì ìë ¥í´ ì£¼ì¸ì"></li>
                </ul>    
              </div>
              <div class="memsel4">
                <ul>
                    <li class="memfont">ì°ë½ì²</li>
                    <li>
                        <select class="adnumber" name="" id="">
                            <option value="010">010</option>
                            <option value="011">011</option>
                        </select>
                    </li>
                    <li class="ad_number">-</li>
                    <li><input type="text" class="adnumber" id="" name="" maxlength="4"></li>
                    <li class="ad_number">-</li>
                    <li><input type="text" class="adnumber" id="" name="" maxlength="4"></li>
                </ul>    
              </div> 
              
           </div>
        </div>
       <div class="admembt">
         <ul>
           <li><button type="button" class="admembt_ok" id="adm_ok">ì ì²­íê¸°</button></li>
           <li><button type="button" class="admembt_no" id="adm_cancel">ì·¨ìíê¸°</button></li>
        </ul>
       </div>
    </form> 
</body>
<script src="./js/adm_btn.js?v=20230903"></script>
</html>