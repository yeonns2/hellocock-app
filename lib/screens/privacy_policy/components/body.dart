import 'package:flutter/material.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VerticalSpacing(
                of: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "   1. 수집하는 개인정보의 항목, 수집∙이용목적 및 수집방법",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 312,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          '''
1-1. 주문시
수집항목 : 성명, 휴대전화, 주소, 우편번호
수집∙이용목적 : 주문상품
수집방법:  헬로콕은 홈페이지에서 주문 시 배송을 위한 개인정보 수집 및
이용에 대해 「동의」 버튼을 클릭할 수 있는 절차를 마련하고, 고객이 
「동의」 버튼을 클릭 시 개인정보 수집 및 이용에 동의한 것으로 간주합니다.

1-2. 문의 시
수집항목: 성명, 휴대전화, 주문내역, 결제내역
수집∙이용목적: 고객의 불만사항 및 및 문의사항에 대한 답변
수집방법: **헬로콕**은 가입 시 고객 응대를 위해 개인정보 제공에 대해 
동의여부 절차를 마련하고, 고객이 「동의」 버튼 클릭 시 개인정보 수집 및 
이용에 동의한 것으로 간주합니다.

1-3. 회원가입 시
수집항목: 전화번호, 카카오 계정, 생일, 출생연도, 연령대, 성별
수집방법: 헬로콕은 앱에서 고객이 회원 가입하기 (SIGN UP) 버튼 클릭 시, 
휴대폰 본인 인증 또는 카카오 계정으로 로그인 기능을 통해 회원가입할 
수 있는 절차를 마련합니다.
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 20),
                  Text(
                    "   2. 개인정보의 제3자 제공",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 371,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          ''' 
헬로콕은 이용자의 개인정보를 “1. 수집하는 개인정보의 항목, 수집∙이용
목적 및 수집방법” 에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여
 이용자의 개인정보를 이용하거나 제3자에게 제공하지 않습니다. 
다만, 다음 각 호의 어느 하나에 해당하는 경우에는 이용자 또는 제3자의 이익을 
부당하게 침해할 우려가 있을 때를 제외하고는 개인정보를 목적 외의 용도로 
이용하거나 이를 제3자에게 제공할 수 있습니다.

2-1. 이용자가 개인정보의 제3자 제공에 동의한 경우
이 경우 헬로콕은 이용자의 개인정보를 제3자에게 제공하기 이전에 
① 개인정보를 제공받는 자, ② 개인정보를 제공받는 자의 개인정보 이용 목적, 
③ 제공하는 개인정보의 항목, ④ 개인정보를 제공받는 자의 개인정보 보유 및 
이용기간을 이용자에게 알리고 동의를 받습니다.

2-2. 다른 법률에 특별한 규정이 있는 경우

2-3. 이용자 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나
주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 이용자 또는 
제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우

2-4. 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 
알아볼 수 없는 형태로 개인정보를 제공하는 경우

2-5. 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 
있는 경우
                          
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 20),
                  Text(
                    "   3. 개인정보의 보유 및 이용기간",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 342,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          ''' 
3-1. 이용자의 개인정보는 원칙적으로 개인정보의 수집∙이용목적이 
달성되면 지체 없이 파기합니다. 다만 아래 3-2의 정보에 대해서는 아래의 
이유로 명시한 기간 동안 보존합니다.

3-2. 헬로콕은 전자상거래등에서의 소비자보호에 관한 법률 등 관련 법령에 
의하여 보존할 필요가 있는 경우 관련 법령에서 정한 일정한 기간 동안 
개인정보를 보관합니다. 이 경우 보관하는 개인정보를 그 보관의 목적으로만 
이용하며 보존기간은 다음과 같습니다.

가. 계약 또는 청약철회 등에 관한 기록: 5년
나. 대금결제 및 재화 등의 공급에 관한 기록: 5년
다. 소비자의 불만 또는 분쟁처리에 관한 기록: 3년
라. 휴면 회원의 경우 다음과 같이 처리합니다.

- 미이용 기준: 당사 서비스에 대한 로그인 일자 기준
- 유효기간: 1년
- 휴면 회원 처리에 대한 안내: 30일 이전에 이메일을 통한 안내
- 휴면 회원에 대한 개인정보 처리: 분리 보관조치
- 분리 보관 정보: 회원 정보 등
- 분리 보관 정보에 대한 보존 기간: 5년 후 식별정보만 남기고 비식별화 조치
(개인을 특정할 수 있는 정보는 삭제)
- 계정 활성화: 이용자의 요청에 의거 계정 활성화 조치 실시
                          
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 20),
                  Text(
                    "   4. 개인정보의 파기절차 및 파기방법",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 267,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          ''' 
헬로콕또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집∙이용
목적 또는제공받은 목적이 달성된 후 해당 정보를 지체 없이 파기합니다.
 파기절차 및 방법은 다음과 같습니다.

4-1. 파기절차
가. 계약, 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 
DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 
정보보호 사유에 따라(3. 개인정보의 보유 및 이용기간 참조) 일정 기간 
저장된 후 파기됩니다.
나. 법령에 따라 별도 DB로 옮겨져 보유되는 개인정보는 보유 이외의 다른 
목적으로 이용되지 않습니다.

4-2. 파기방법
가. 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 
방법을 사용하여 삭제합니다.
나. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 
파기합니다.
                          
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 20),
                  Text(
                    "   6. 이용자 및 법정대리인의 권리와 그 행사방법",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 974,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          ''' 
6-1. 이용자 또는 법정대리인은 언제든지 헬로콕이 보유한 자신 혹은 당해 
만 14세 미만 아동의 개인정보에 대해 열람, 오류 정정, 삭제, 처리정지 및 
동의 철회를 요구할 수 있으며, 헬로콕은 이에 대해 필요한 조치를 취할 
의무를 집니다.

6-2. 이용자 또는 법정대리인은 처리되고 있는 개인정보에 대한 열람을 
헬로콕에 요구할 수 있으며 **헬로콕**은 특별한 사유가 없는 한 청구일로부터 
10일 이내에 열람할 수 있도록 합니다. 단, 관련 법령이 정한 사항이 있는 경우 
그 열람을 제한하거나 거절할 수 있습니다.
이 경우 열람 요구를 받은 날로부터 5일 이내에 제한 또는 거절 사유, 이용자 
또는 법정대리인이 이의를 제기할 수 있는 방법을 이메일로 알려드립니다.

6-3. 이용자 또는 법정대리인은 처리되고 있는 개인정보의 정정 또는 삭제를
헬로콕에 요구할 수 있으며 헬로콕은 이용자 또는 법정대리인의 요구에 
따라 정정, 삭제 등 필요한 조치를 한 후 그 결과를 이용자 또는 법정대리인에게 
알려줍니다. 삭제된 개인정보는 복구 또는 재생되지 않으며, 다른 법령에서 
그 개인정보가 수집대상으로 명시되어 있는 경우에는 삭제되지 않으며, 
이러한 사실을 이용자 또는 법정대리인에게 통지합니다. 다니엘 웰링턴은 
이용자 또는 법정대리인에게 정정, 삭제 요구사항의 확인에 필요한 증거자료를 
제출하게 할 수 있습니다.

6-4. 이용자 또는 법정대리인은 이용자의 개인정보 처리의 정지를 요구할 
수 있으며 헬로콕**은 개인정보 처리의 전부 또는 일부를 정지합니다. 
다만 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 
경우, 다른 사람의 생명, 신체를 해할 우려가 있거나 다른 사람의 재산과 
그 밖의 이익을 부당하게 침해할 우려가 있는 경우, 개인정보를 처리하지 
아니하면 이용자와 약정한 서비스를 제공하지 못하는 등 계약의 이행이 
곤란한 경우로서 정보주체가 그 계약의 해지 의사를 명확하게 밝히지 
아니한 경우에는, 개인정보의 처리 정지 요구를 거절할 수 있으며 이용자 
또는 법정대리인에게 지체없이 그 사유를 알려드립니다. 이용자 또는 
법정대리인의 요구에 따라 헬로콕은 처리가 정지된 개인정보를 즉시 파기 등 
필요한 조치를 취합니다.

6-5. 헬로콕은 관련 법령에 따라 이용자 또는 법정대리인이 6-2, 6-3, 6-4의 
요구를 하는 때에는 주민등록증, 운전면허증, 여권 등의 신분증명서를 
확인하거나 전자서명법 제2조 제3호에 따라 공인전자서명 등을 확인하는 
방법, 기타 이와 유사한 방법을 통하여 해당 요구를 하는 자가 이용자 
본인임을 확인합니다.

6-6. 헬로콕이 개인정보의 수집을 위해 이용자의 동의를 받아야 하는 경우에는 
개인정보 관리 책임자의 신원 (소속, 성명 및 전화번호, 기타 연락처), 정보의 
수집∙이용목적, 제 3자에 대한 정보 제공 관련 사항 (제공 받은 자, 제공 목적 
및 제공할 정보의 내용)등 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 
관련 법령의 요구하는 사항을 명시하거나 고지해야 하며 이용자는 언제든지 
이 동의를 철회할 수 있습니다.

6-7. 이와 관련한 각종 문의 및 요청은 어플리케이션의 ‘고객 문의’ 메뉴나 
서비스 담당자 (pinacolada@hellocock.org) 에게 메일을 보내 변경 및 
열람을 신청 하셔야 합니다.

6-8. 회원 정보는 로그인 후 회원 정보 페이지 상에서 이용자 또는 법정
대리인이 직접 자신 혹은 당해 만 14세 미만 아동의 개인정보를 변경 또는 
열람할 수 있습니다.

6-9. 이용자의 법정대리인이 이용자의 개인정보의 열람 및 변경을 원할 경우 
서비스 담당자(pinacolada@hellocock.org) 에게 메일로 문의하시고 
서비스 담당자의 지시에 따라 법정대리인임을 증명할 자료 및 증표를 
제시하셔야 합니다.

6-10. 이용자는 자신의 개인정보를 최신의 상태로 정확하게 입력하여 불의의 
사고를 예방하기 위한 노력을 해야 합니다. 입력한 부정확한 정보로 인해 
발생하는 사고의 책임은 이용자에게 있습니다. 타인 정보의 도용 등 허위정보를 
입력할 경우 서비스 이용의 제한 및/또는 회원 자격이 상실될 수 있습니다.

이용자는 개인정보를 보호받을 권리와 함께 스스로 보호하고 타인의 정보를 
침해하지 않을 의무도 가지고 있으며, 자신의 개인정보가 유출되지 않도록 
조심해야 합니다.
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 20),
                  Text(
                    "   7. 개인정보 자동 수집 장치의 설치·운영 및 그 거부에 관한 사항",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 452,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          ''' 
헬로콕은 어플리케이션 기능향상, 통계 및 서비스 품질 향상, 마케팅을 주된 
목적으로 자체 쿠키와 제3자 쿠키, 위치 정보를 사용합니다.

7-1. 쿠키란?
쿠키는 이용자가 웹사이트를 방문할 때에 기기의 드라이브에 저장되는 
매우 작은 크기의 텍스트 파일입니다. 이용자가 웹사이트에 접속하면 
헬로콕의 컴퓨터는 이용자의 스마트폰 (혹은 브라우저) 있는 쿠키의 내용을 
읽고, 이용자의 추가 정보를 컴퓨터에서 찾아 접속에 따른 성명 등의 추가 
입력 없이 서비스를 제공할 수 있습니다.

7-2.쿠키의 사용 목적
헬로콕은 다음과 같은 목적을 위해 쿠키를 통하여 수집된 이용자의 개인정보를 
사용합니다.

가. 접속빈도나 방문시간 등을 분석하고 이용자의 취향과 관심분야를 
파악하여 타겟 마케팅 및 서비스 개편 등의 척도로 활용합니다.
나. 품목들에 대한 정보와 관심 있게 둘러본 품목들에 대한 자취를 추적하여 
다음 번 쇼핑 때 개인 맞춤 서비스를 제공하는 데 이용합니다.
다. 헬로콕이 진행하는 이벤트에서 이용자의 참여 정도 및 방문 횟수를 
파악하여 차별적인 응모 기회를 부여하고 개인의 관심 분야에 따라 차별화된 
정보를 제공하기 위한 자료로 이용합니다.

7-3.쿠키의 운영 및 거부
쿠키는 사용자의 스마트폰 디스크에 저장되며, 사용자의 컴퓨터는 식별하지만 
사용자를 개인적으로 식별하지는 않습니다. 또한 고객은 웹브라우저에 설정을 
통해 모든 쿠키를 허용/거부하거나, 쿠키를 저장될 때마다 확인을 거치도록 
할 수 있습니다.

단, 쿠키의 저장을 거부할 경우 일부 서비스가 원활하게 작동하지 않을 수 
있습니다.
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 20),
                  Text(
                    "   8. 개인정보보호 책임자",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 146,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          ''' 
- 담당자: 이장후
- 직위: Product Manager
- 전화번호: (+82) 1033226968
- Mail: pinacolada@hellocock.org

이용자가 헬로콕의 서비스를 이용하시며 발생하는 모든 개인정보보호 
관련 민원을 위 개인정보 보호책임자에게 신고하실 수 있습니다. 
헬로콕은 이용자의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 20),
                  Text(
                    "   9. 개인정보의 안전성 확보조치",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 424,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          ''' 
헬로콕은 이용자의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 
누출, 변조, 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 
대책을 강구하고 있습니다.

9-1. 내부관리계획의 수립∙시행

9-2. 개인정보에 대한 접근 통제 및 접근 권한의 제한 조치

9-3. 개인정보 침해사고 발생에 대응하기 위한 접속기록의 보관 및 
위조∙변조 방지를 위한 조치

개인정보취급자가 개인정보처리시스템에 접속하여 개인정보를 처리한 경우, 
접속일시와 처리내역 등을 저장하고 접속기록을 별도로 보관합니다.

9-4.개인정보를 안전하게 저장∙전송할 수 있는 암호화 기술의 적용 또는 이에 
상응하는 조치

9-5.개인정보에 대한 보안프로그램의 설치 및 갱신

헬로콕은 해킹이나 컴퓨터 바이러스 등에 의해 이용자의 개인정보가 
유출되거나 훼손되는것을 막기 위해 최선을 다하고 있습니다. 
개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신 
프로그램을 이용하여 이용자의 개인정보가 누출되거나 손상되지 않도록 
방지하고 있으며, 암호화 통신 등을 통하여 네트워크상에서 개인정보를 
안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템 등을 
이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 
보안성을 확보하기 위한 가능한 모든 기술적, 관리적 보호조치를 취하고 
있습니다.
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                  VerticalSpacing(of: 20),
                  Text(
                    "   10.개인정보처리방침 변경",
                    style: TextStyle(fontSize: 13),
                  ),
                  VerticalSpacing(),
                  Container(
                      width: 325,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FBFE),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          ''' 
현 개인정보 처리방침은 2019년 8월 1일부터 적용됩니다. 내용의 추가, 
삭제 및 수정이 있을 경우에는 개정 최소 7일전(중요한 사항이 변경되는 
경우는 최소 30일전)부터 웹사이트의 공지사항을 통하여 고지할 것입니다. 
만일, 개인정보의 수집 및 활용, 제3자 제공 등이 변경되어 동의가 필요한 
경우에는 별도 동의 절차를 마련하여 진행할 것입니다. 또한 개인정보 
처리방침에 버전번호 및 개정일자 등을 부여하여 개정여부를 쉽게 알 수 
있도록 하고 있습니다.

개인정보 처리방침 버전번호: v.1.0

개인정보 처리방침 변경공고일자: 2020. 11. 15.

변경 개인정보 처리방침 시행일자: 2020. 11. 15.
                          ''',
                          style: TextStyle(fontSize: 11, height: 1.4),
                        ),
                      )),
                ],
              ),
            ]),
      ),
    );
  }
}
