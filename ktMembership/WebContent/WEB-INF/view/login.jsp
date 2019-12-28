<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="Keywords" content="kt, 케이티, kt.com, kt닷컴, 케이티닷컴, olleh, 올레, kt기업. kt 기업">
<meta name="Description" content="[kt] 메인 - 사랑 받는 국민기업 kt의 기업홍보를 위한 사이트입니다. kt소개/사업소개/사회책임경영/투자정보/홍보채널/인재채용 등 kt의 다양한 사업과 서비스, 사회공헌활동 등에 대한 많은 정보를 확인할 수 있습니다.">
<title>로그인 | 글로벌 No.1 KT</title>
<script type="text/javascript" async src="https://remote.captcha.com/include.js?i=ATABMwExATQBMAJiMxNJAj8_CT9uPz8EP04_YA0_Pz8YATMBMAEwATMBMAEwATABMQprby1IYW5nLUtSAzIwMAIzOAExATABMw"></script>
<script type="text/javascript" async src="https://remote.captcha.com/include.js?i=ATABMwExATQBMAJiMxNJAj8_CT9uPz8EP04_YA0_Pz8YATMBMAEwATMBMAEwATABMQprby1IYW5nLUtSAzIwMAIzOAExATABMw"></script>
<script type="text/javascript" async src="https://remote.captcha.com/include.js?i=ATABMwExATQBMAJiMxNJAj8_CT9uPz8EP04_YA0_Pz8YATMBMAEwATMBMAEwATABMQprby1IYW5nLUtSAzIwMAIzOAExATABMw"></script>
<script type="text/javascript" async src="https://remote.captcha.com/include.js?i=ATABMwExATQBMAJiMxNJAj8_CT9uPz8EP04_YA0_Pz8YATMBMAEwATMBMAEwATABMQprby1IYW5nLUtSAzIwMAIzOAExATABMw"></script>
<script type="text/javascript" async src="https://www.google-analytics.com/gtm/js?id=GTM-KZPKL2N&amp;cid=960524965.1577545464"></script>
<script async src="https://www.googletagmanager.com/gtm.js?id=GTM-PNVR37F"></script>
<script async src="https://www.google-analytics.com/analytics.js"></script>
<script>
var ktMenuCd = "MBA000";
</script>
<script type="text/javascript" src="https://login.kt.com/wamui/wamui/new_resources/p/cl/src/js/vendor/jquery-2.1.4.min.js"></script>
<script>

$(document).ready(function() {
    $("#imagePlayer").width($("#imagePlayer").parent().width());
    $("#imagePlayer").height($("#imagePlayer").parent().height());
    if($("#botCaptchaDiv").length == 0) {
        $("#captcha").parent().append("<div id='botCaptchaDiv' style='display:none;'></div>");
    }
	playImage();
    $("[id*='ClWrapper'] .refresh, .popup-contents .refresh").on("click", function() {
        $("#captcha").val("");
        $(this).focus();
    });
});

//캡차 이미지 요청 (캐쉬문제로 인해 이미지가 변경되지 않을수있으므로 요청시마다  다른값으로 요청처리)
/*
function playImage() {
    var d = new Date();
    var target = "/wamui/captchaImage.do?v=" + d.getTime();
    $('#imagePlayer').prop("src", target);
}

function winPlayer(objUrl) {
    if($("#soundPlayer").length == 0) {
        $("body").append('<div id="soundPlayer" style="display:none;"></div>');
    }

    var uAgent = navigator.userAgent;
    if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
        $('#soundPlayer').html('<embed src="'+ objUrl +'" type="audio/wav">');
    } else {
        $('#soundPlayer').html(' <bgsound src="' + objUrl + '">');
    }
}

function playSound() {
    var rand = Math.random();
    var kor ="lan=kor&";
    var uAgent = navigator.userAgent;

    if (uAgent.indexOf('Safari') > -1 && uAgent.indexOf('Chrome') == -1) {
        window.open('safariAudioCaptcha.do?rand='+rand, "_blank");
    } else {
        $.ajax({
            url: '/wamui/captchaAudio.do',
            type: 'POST',
            dataType: 'text',
            data: 'rand=' + rand + '&ans=y',
            async: false,
            success: function() {
                //var soundUrl = 'captchaAudio.do?' + kor + 'rand=' + rand + '&ans=' + resp;
                //[20170522]s.  오디오 캡챠 번호 삭제
                var soundUrl = '/wamui/captchaAudio.do?' + kor + 'rand=' + rand;
                //\e.
                //console.log(soundUrl);
                if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
                    winPlayer(soundUrl+'&agent=msie');
                } else if (!!document.createElement('audio').canPlayType) {
                    try { new Audio(soundUrl).play(); } catch(e) { winPlayer(soundUrl); }
                } else window.open(soundUrl, '', 'width=1,height=1');
            }
        });
    }
}
*/

var isLoaded = false;
// 신규 캡차 적용
var soundUrl = "";
var isGetSoundTag = false;
var uAgent = navigator.userAgent;
var domainUrl = window.location.hostname;
var protocol = location.protocol;
function playImage() {
	//이미지 사이즈
	var iWidth = '200';
	var iHeight = '38';
	isGetSoundTag = false;
//	$.ajax({
//        url: 'getCaptcha.do',
//        type: 'POST',
//        dataType: 'json',
//		data: 'iWidth=' + iWidth + '&iHeight='+ iHeight ,
////		async: false,
//		success: function(data) {
//            var domainUrl = window.location.hostname;
//			$("#botCaptchaDiv").html( data.captchaHtml);
//			//BDC_CaptchaSoundAudio_
//			$("#imagePlayer").attr("src" , $("#formCaptcha_CaptchaImage").attr("src") );
//			if ( uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
//				$("#soundPlayer").html("<object id='captchaplay' classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' height='0' width='0'  style='width:0; height:0;'><param name='AutoStart' value='0' /><param name='Volume' value='0' /><param name='PlayCount' value='1' /><param name='FileName' value='" + data.captchaSoundUrl + "' /></object>");
//			}else  {
//				var domainUrl = window.location.hostname;
//				$("#soundPlayer").html("<audio preload='auto' id='captchaplay' controls='controls' > <source src='http://" + domainUrl + data.captchaSoundUrl + "' type='audio/x-wav' ></audio>");
//			}
//		}
//
//        sendSyncAjaxPOST("getCaptcha.do", {'iWidth' : iWidth, 'iHeight' : iHeight}, callbackFunc);
	sendAjaxPOST("getCaptcha.do", {'iWidth' : iWidth, 'iHeight' : iHeight}, function(data) {
		$("#botCaptchaDiv").html(data.captchaHtml);
		//BDC_CaptchaSoundAudio_
		$("#imagePlayer").attr("src", $("#formCaptcha_CaptchaImage").attr("src"));
		// Sound 리소스 저장
		soundUrl = data.captchaSoundUrl;
//			if ( uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
//			    $("#soundPlayer").html("<object id='captchaplay' classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' height='0' width='0'  style='width:0; height:0;'><param name='AutoStart' value='0' /><param name='Volume' value='0' /><param name='PlayCount' value='1' /><param name='FileName' value='" + data.captchaSoundUrl + "' /></object>");
		
//			    if(!isLoaded)  {
//			        isLoaded = true;
//// 					sendSyncAjaxPOST("status.do", {}, function() {});
//			        sendAjaxPOST("status.do", {}, function() {});
//			    }
//			}else  {
//			    $("#soundPlayer").html("<audio preload='auto' id='captchaplay' controls='controls' > <source src='http://" + domainUrl + data.captchaSoundUrl + "' type='audio/x-wav' ></audio>");
//			}
	});
//	});
}

// 음성듣기 버튼 클릭
function playSound() {
	if (!isGetSoundTag) {
		if ( uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
			$("#soundPlayer").html("<object id='captchaplay' classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' height='0' width='0'  style='width:0; height:0;'><param name='AutoStart' value='true' /><param name='Volume' value='0' /><param name='PlayCount' value='1' /><param name='FileName' value='" + soundUrl + "' /></object>");
			
			if(!isLoaded)  {
			isLoaded = true;
			sendAjaxPOST("status.do", {}, function() {});
			}
		}else  {
			$("#soundPlayer").html("<audio preload='auto' id='captchaplay' controls='controls' > <source src='" + protocol + "//" + domainUrl + soundUrl + "' type='audio/x-wav' ></audio>");
		}
		isGetSoundTag = true;
	}
	captchaplay.play();
}


</script>
</head>
<body>
아이디   : <input type="text" name="id" id="id" /> <br /><br />
패스워드 : <input type="password" name="password" id="password" /><br /><br />
<input type="button" name="login" value="로그인" /><br /><br />
<div class="security-code" id="normalPwdArea" style="">
					<div class="security-num" style="width:170px;height: 38px;">
						<img id="imagePlayer" alt="보안문자" style="width: 168px; height: 36px;" src="https://login.kt.com/wamui/botdetectcaptcha.do?get=image&amp;c=formCaptcha&amp;t=0a82ea2c2b4440e6bd9002477e95e486">
					</div>
					<ul>
						<li><a href="javascript:playSound();" onclick="trackClicks('로그인팝업', '^로그인 팝업^020_Captcha010_음성듣기');" class="voice"><i></i>음성듣기</a></li>
						<li><a href="javascript:playImage();" onclick="trackClicks('로그인팝업', '^로그인 팝업^030_Captcha020_새로고침');" class="refresh"><i></i>새로고침</a></li>
					</ul>
					<input type="text" id="captcha" name="captcha" maxlength="6" class="" autocomplete="off" placeholder="보안문자를 입력해 주세요." title="보안문자 입력" style="ime-mode:disabled;width:100%;" onfocus="showHideFocusBg(2);" onblur="showHideFocusBg(2);" onkeydown="if(event.keyCode==13){validate();}else if (event.keyCode== 32) {return false;}">
		<div id="botCaptchaDiv" style="display:none;"><div class="BDC_CaptchaDiv " id="formCaptcha_CaptchaDiv" style="width: 248px !important; height: 38px !important; ">
			 <!--
			 -->
			 <div class="BDC_CaptchaImageDiv" id="formCaptcha_CaptchaImageDiv" style="width: 200px !important; height: 38px !important;">
			  <!--
			   -->
			  <a href="//captcha.org/captcha.html?java" title="BotDetect Java CAPTCHA Library" id="formCaptcha_HelpLink"><img class="BDC_CaptchaImage" id="formCaptcha_CaptchaImage" src="https://login.kt.com/wamui/botdetectcaptcha.do?get=image&amp;c=formCaptcha&amp;t=0a82ea2c2b4440e6bd9002477e95e486" alt=""></a>
			  <!--
			 -->
			 </div>
			 <!--
			 -->
			 <div class="BDC_CaptchaIconsDiv" id="formCaptcha_CaptchaIconsDiv" style="width: 42px !important;">
			  <!--
			   -->
			  <a class="BDC_ReloadLink" id="formCaptcha_ReloadLink" href="#" title="Change the CAPTCHA code" style="display: inline-block !important;"><img class="BDC_ReloadIcon" id="formCaptcha_ReloadIcon" src="https://login.kt.com/wamui/botdetectcaptcha.do?get=reload-small-icon" alt=""></a>
			  <!--
			   -->
			  <a rel="nofollow" class="BDC_SoundLink" id="formCaptcha_SoundLink" href="https://login.kt.com/wamui/botdetectcaptcha.do?get=sound&amp;c=formCaptcha&amp;t=0a82ea2c2b4440e6bd9002477e95e486" title="Speak the CAPTCHA code"><img class="BDC_SoundIcon" id="formCaptcha_SoundIcon" src="https://login.kt.com/wamui/botdetectcaptcha.do?get=sound-small-icon" alt=""></a>
			  <!--
			   -->
			  <div class="BDC_Placeholder" id="formCaptcha_AudioPlaceholder">
			   &nbsp;
			  </div>
			  <!-- -->
			 </div> 
			 <script src="https://login.kt.com/wamui/botdetectcaptcha.do?get=script-include" type="text/javascript">
			 </script> 
			 <script src="https://login.kt.com/wamui/botdetectcaptcha.do?get=init-script-include&amp;c=formCaptcha&amp;t=0a82ea2c2b4440e6bd9002477e95e486" type="text/javascript">
			 </script> 
			</div><input type="hidden" id="BDC_VCID_formCaptcha" name="BDC_VCID_formCaptcha" value="0a82ea2c2b4440e6bd9002477e95e486"> 
			<input type="hidden" id="BDC_BackWorkaround_formCaptcha" name="BDC_BackWorkaround_formCaptcha" value="0">
        </div>
 </div>
</body>
</html>