<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_css.css?v=2023090212">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>ê´ë¦¬ì íì´ì§</title>
</head>
<body>
  <div class="adbody">
      <div class="adtitle">ADMINISTRATOR</div>
      <div class="admoom">
        <form id="member_log" name="member_log">
          <div class="intotal"> 
            <div class="adin1">
              <input type="text" name="login_id" id="login_id" class="loginid" value="" placeholder=" ìì´ë">
            </div>
            <div class="adin2">
              <input type="password" name="login_pass" id="login_pass" class="loginpass" value="" placeholder="í¨ì¤ìë">
            </div>
          </div>
          <div class="adbt">
            <button type="submit" class="loginbt1">ë¡ê·¸ì¸</button>
            <button type="button" class="loginbt2" id="member_add">íìê°ì</button>
          </div>
          <div class="adinfomain">
            <ul>
               <li class="adinfo">â» ì¬ìë²í¸ê° ììì ê´ë¦¬ììê² ì°ë½ ë°ëëë¤.</li>
               <li class="adinfo">â» ëª¨ë  ì ë³´ë ê¸°ë¡ëì´ ì§ëë¤.</li>
               <li class="adinfo">â» í´ì¬ì í´ë¹ ì ë³´ë ì ìì´ ë¶ê°ë¥ íê² ë©ëë¤.</li>
            </ul>
          </div>
         </form>
        </div>
      </div>
    </body>
    <script src="./js/page_result.js?v=<?php echo $daterecall?>"></script>
    </html>