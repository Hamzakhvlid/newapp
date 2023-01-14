import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

//Providers

final imageProvider = StateProvider<String>((ref) {
  return "assets/basement.png";
});

final desktopOffsetProvider = StateProvider<Map<String, Offset>>((ref) {
  return desktopOffset;
});
final offsetProvider = StateProvider<Offset>((ref) {
  return const Offset(206.6, 447.5);
});

final colorMap = StateProvider<Map<Color, String>>((ref) {
  return  savedLocale=='en'?imagesLabel['basement']!:arabicImageLabel['basement']!;
});

final currentImage = StateProvider<String>((ref) {
  return 'basement';
});

final isSearch = StateProvider<bool>((ref) {
  return false;
});

final savedLocale = StateProvider<String>(
  (ref) => 'en',
);

final searchList = StateProvider<List<String>>((ref) {
  return labels.keys.toList();
});

final textControlller = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

List<String> floors = [
  'basement',
  'ground',
  'first floor',
  'second floor',
  'third floor'
];

//All the labels to show for the images


Map<String, Map<Color, String>> arabicImageLabel = {
  'basement': {
    const Color(0xffffff5f): '''             غرفة الطوارئ                 ''',
    const Color(0xfff2d9c9): '''قسم الخدمات الادارية''',
    const Color(0xffdfdfff): '''إدارة التصميم والخدمات''',
    const Color(0xffc9ddee):
        '''صيانة تليفونات قسم الاتصالات''',
    const Color(0xff875fff): '''شعبة عمل إدارة شؤون الموظفين''',
    const Color(0xfff7b0b3):
        ''' إدارة شؤون الموظفين والمحفوظات والتقارير ''',
    const Color(0xffdae4df): '''          قسم النقل        ''',
    const Color(0xff7c83be):
        '''  أرشيف مشروع محطة تقطير المياه CE (DP) ص ''',
    const Color(0xfFff0000):
        ''' مخزن الإشراف المسبق للمكتب الإداري ''',
    const Color(0xff6fff6f):
        ''' قسم الأمن والسلامة مخزن المعدات الصحية   ''',
    const Color(0xff3fffff):
        ''' الإشراف المسبق للمكتب الإداري ''',
    const Color(0xffc1e5f9):
        ''' مخزن إدارة شبكات التوزيع  ''',
    const Color(0xffe7ffcf): '''            قاعة الاجتماعات              ''',
    const Color(0xffe0f2dd):
        ''' المستودعات الإدارية للعقود والمناقصات  ''',
    const Color(0xff946a8a): ''' قسم الكهرباء ومحطات الطاقة   ''',
    const Color(0xff00b88a): ''' قسم المخططات الهندسية  ''',
    const Color(0xffc7c7e3): ''' قسم التصميم والإشراف ''',
    const Color(0xff7e00ff):
        '''                 مكاتب عامة                ''',
    const Color(0xffad4547): '''                  إدارة الترقي الوظيفي               ''',
    const Color(0xfffbc072): '''         مكاتب عامة         ''',
    const Color(0xff7a66bc):
        '''     صيانة تليفونات قسم الاتصالات         ''',
    const Color(0xff6b596d): '''     مشروع محطة الكهرباء      ''',
    const Color(0xffff5fae):
        ''' مخزن التحكم المالي ، متجر المشتريات ، مخزن الحسابات ، مخزن الاستثمار والمشاريع''',
    const Color(0xffff622f): ''' مراقبة الجوازات والإشراف على الجوازات''',
    const Color(0xffe4d6d2): ''' المركز الآلي للشؤون الجارية''',
    const Color(0xffcaca3f): ''' مكتب القياسات الحيوية لتكنولوجيا المعلومات ''',
    const Color(0xff3fcfff):
        '''             المركز العام الآلي         ''',
    const Color(0xff9effb7): '''           غرفة الصلاة                   '''
  },
  'ground': {
    const Color(0xfff48d6a): '''            المكتب الإعلامي            ''',
    const Color(0xffdab2d2): ''' إدارات المشتريات والواردات ''',
    const Color(0xff35c3ff): '''   مراقبة المصاريف الحالية    ''',
    const Color(0xff8835ff): '''   قسم الحسابات       ''',
    const Color(0xffff7e9f): ''' قطاع الشئون المالية والإدارية''',
    const Color(0xff6583a4): ''' الدائرة المالية''',
    const Color(0xff64c7a5): ''' مراقب حساب الاستثمار''',
    const Color(0xff84c87b): '''       إيصال آخر     ''',
    const Color(0xff588565): ''' قسم تخطيط القوى البشرية  ''',
    const Color(0xffee3f41): '''   قسم نهاية الخدمة  ''',
    const Color(0xff9898cc): '''  أمين الشؤون الشخصية  ''',
    const Color(0xff35ff35): '''  قسم الزيادات والمخصصات''',
    const Color(0xfff8da4a): '''  قسم الاجازات والواجبات ''',
    const Color(0xff9393ff): ''' دائرة الشؤون الشخصية ''',
    const Color(0xffff64ff):
        '''سكرتير الوكيل المساعد للشؤون الإدارية ''',
    const Color(0xff27ffff):
        '''الوكيل المساعد للشؤون الادارية ''',
    const Color(0xffff3588): '''   قسم الشؤون الشخصية   ''',
    const Color(0xffff7664): '''   مراقبة الأمن والسلامة     ''',
  },
  'first floor': {
    const Color(0xffd07644): '''        فارغة     ''',
    const Color(0xff35ff35): '''   دائرة الميزانيات    ''',
    const Color(0xffffff60): '''    دائرة التدقيق المالي  ''',
    const Color(0xff64ffff): '''   قطاع الشئون المالية   ''',
    const Color(0xff3535ff):
        '''  لوكيل المساعد للشؤون المالية  ''',
    const Color(0xfFff35ff): '''     إدارة العقود والمناقصات     ''',
    const Color(0xffff88a6):
        ''' مكتب الوكيل المساعد للشؤون المالية   ''',
    const Color(0xff35c3ff): '''    إدارة العقود والمناقصات     ''',
    const Color(0xffff3535): '''  وزارة المالية      ''',
    const Color(0xff8835ff): '''         إدارة المركز الآلي     ''',
    const Color(0xff878dc0): '''    قسم البنوك والجدولة     ''',
    const Color(0xfff89a1e): '''     دارة شبكة التوزيع     ''',
    const Color(0xff2776bb):
        ''' الوكيل المساعد لشبكة التوزيع الكهربائي   ''',
    const Color(0xffff7664):
        ''' قسم شبكة التوزيع الكهربائي  ''',
    const Color(0xff7d4f72):
        ''' دائرة متابعة العقود والصيانة  ''',
    const Color(0xffffff35): '''      خدمة الزبائن     ''',
    const Color(0xffff35ff): '''   مراقب الدعم الفني      ''',
    const Color(0xfff7b1b4):
        ''' دائرة مؤسسات القطاع العام والمرافق الخاصة  ''',
    const Color(0xffff3535): ''' قسم متابعة التحصيل ''',
    const Color(0xff739383): '''        تخليص        ''',
    const Color(0xffff003f): '''          غرفة الخادم      ''',
    const Color(0xff5435ff): '''         سكرتير        ''',
    const Color(0xff9d6c5c):
        ''' الوكيل المساعد لشؤون المستهلك   ''',
  },
  'second floor': {
    const Color(0xfff9b069):
        '''  طاع مشاريع المياه قسم تصميم شبكات المياه ومشاريع المياه ''',
    const Color(0xffb85c5c):
        ''' قطاع مشاريع المياه ، إدارة مشاريع هيكل المياه  ''',
    const Color(0xff35bd93):
        ''' مكتب الوكيل المساعد لمشروعات المياه   ''',
    const Color(0xff706072): '''  المكتب الفني للوكيل   ''',
    const Color(0xfF9a1b1e):
        ''' قطاع مشاريع المياه ، إدارة مشروع شبكة الوقود    ''',
    const Color(0xff64ccff): '''     خدمات إدارية    ''',
    const Color(0xff88ffa6): '''       ديوان الخدمة المدنية      ''',
    const Color(0xff6d74b4):
        ''' قطاع مشاريع المياه - إدارة مشروع شبكة المياه  ''',
    const Color(0xffd07644):
        ''' قطاع مشاريع المياه - إدارة مشاريع هيكل المياه     ''',
    const Color(0xfff7b1b4):
        ''' الخدمات الفنية وقطاع الورش الرئيسية ، قسم التصميم والإشراف ''',
    const Color(0xff8835ff):
        ''' قطاع تشغيل وصيانة المياه أمانة تشغيل وصيانة المياه  ''',
    const Color(0xff4f7d66):
        ''' قطاع الخدمات الفنية والورش الرئيسية ، إدارة التصميم والإشراف ، قسم الإشراف  ''',
    const Color(0xff7664ff):
        ''' قطاع الخدمات الفنية والورش الرئيسية ، قسم التصميم والإشراف ، قسم الأعمال الكهربائية  ''',
    const Color(0xff4381c0): ''' قطاع الخدمات الفنية والورش الرئيسية , 
   رئيس المكتب الفني وحوادث الحريق للوكيل المساعد  ''',
    const Color(0xff93738b):
        ''' قطاع الخدمات الفنية والورشة الرئيسية والمكتب الفني وحوادث الحريق لوكيل الوزارة المساعد  ''',
    const Color(0xff68bf5b): ''' ديوان المحاسبة ''',
    const Color(0xff35bd93):
        ''' قطاع الشئون الإدارية إدارة السجل العام ''',
    const Color(0xffff3588): '''    وكالة المراقبين الماليين    ''',
    const Color(0xffff35ff):
        ''' قطاع التخطيط والتدريب ونظم المعلومات - قسم التطوير الإداري والتدريب ''',
    const Color(0xff6464ff):
        ''' قطاع الخدمات والورش الرئيسية - قسم التصميم والإشراف - قسم الأعمال الميكانيكية   ''',
    const Color(0xffff7664):
        ''' قطاع الشئون الإدارية ، مكتب المدير ، دائرة المتابعة والتطوير  ''',
    const Color(0xff93ffff): '''    دائرة الرقابة الفنية  ''',
    const Color(0xff64ff64):
        ''' قطاع التخطيط والتدريب ونظم المعلومات - مدير مكتب إدارة الإشراف الفني  ''',
    const Color(0xff9d6c5c):
        ''' قطاع التخطيط والتدريب ونظم المعلومات. قسم الاحصاء ''',
    const Color(0xffdd3700):
        ''' قطاع التخطيط والتدريب ونظم المعلومات قسم الدراسات والبحوث  ''',
    const Color(0xffbdbd35): ''' الأمن والأمان   ''',
    const Color(0xff9486c7):
        ''' قطاع المحطات وادارة امن وسلامة المحطات   ''',
    const Color(0xffffff00): '''     الشؤون القانونية       ''',
    const Color(0xffff3535):
        ''' قطاع الخدمات الفنية والورشة الرئيسية - نائب أمين الخدمات الفنية وقطاع شؤون الورشة الرئيسية  ''',
    const Color(0xffe47264):
        ''' قطاع الخدمات الفنية والورشة الرئيسية ، والوكيل المساعد لقطاع الخدمات الفنية وشؤون الورشة الرئيسية    ''',
    const Color(0xff979797): ''' أمين الوكيل لمشروعات المياه  ''',
    const Color(0xff353535):
        ''' قطاع تشغيل وصيانة المياه الوكيل المساعد لتشغيل وصيانة المياه ''',
  },
  'third floor': {
    const Color(0xffff649c): ''' حسين العلاقات العامة والمواطن ''',
    const Color(0xffff5435):
        ''' ائب أمين قطاع محطات الكهرباء ومحطات التقطير   ''',
    const Color(0xffdf4e35):
        ''' قسم البرامج الهندسية والبيئة  ''',
    const Color(0xff9d6c5c):
        ''' نائب أمين قطاع التخطيط والتدريب والتدريب   ''',
    const Color(0xffc7c764):
        '''  الوكيل المساعد لشبكة النقل الكهربائي    ''',
    const Color(0xfF7e6bbd):
        ''' الوكيل المساعد لقطاع التخطيط والتدريب وتكنولوجيا المعلومات   ''',
    const Color(0xffff35ff): ''' قسم الأعمال الكهربائية ''',
    const Color(0xff353535): ''' الرقابة / التنسيق والمتابعة ''',
    const Color(0xff58ba48):
        ''' وكيل محطات الكهرباء وتقطير المياه  ''',
    const Color(0xff35bd93):
        ''' قسم العلاقات العامة وخدمة المواطن  ''',
    const Color(0xff649cff):
        ''' مشاريع محطات القوى الكهربائية / قسم الرسم والأرشيف ''',
    const Color(0xff818181): ''' لمنطقة الوزارية / مكتب الوكيل   ''',
    const Color(0xfff8a13e):
        ''' مشاريع وحدات توزيع المياه / قسم التصميم ''',
    const Color(0xff7d4f72): '''     قسم الكابلات الأرضية    ''',
    const Color(0xff5435ff):
        ''' مهندس شيف لمشاريع تقطير المياه  ''',
    const Color(0xffbd6b6b):
        '''مشروع إنشاءات تقسيم محطات تقطير المياه''',
    const Color(0xff4381c0):
        ''' مشاريع محطات القوى الكهربائية / قسم الرسم والأرشيف ''',
    const Color(0xff4f7d66):
        ''' مشروع دائرة العمل المدني بمحطة الطاقة الكهربائية ''',
    const Color(0xfffcd5a3):
        ''' مشروع إنشاءات تقسيم محطات تقطير المياه ''',
    const Color(0xffabdf7a): '''     قسم الأعمال الميكانيكية    ''',
    const Color(0xff9cffb4): '''   تخطيط البرنامج ومتابعته  ''',
    const Color(0xff64ccff): '''    إدارة مشاريع القطاع الخاص ''',
    const Color(0xfff7b1b4): ''' قسم الأعمال الكهربائية  ''',
    const Color(0xff6d74b4):
        ''' دارة مشروعات قطاع محطات الكهرباء ومحطات التقطير  ''',
    const Color(0xffd07644):
        ''' قسم الأدوات والتحكم في قسم الأعمال الكهربائية  ''',
    const Color(0xffff3535):
        ''' مشروع إدارة الأجهزة والتحكم بمحطة الطاقة الكهربائية ''',
    const Color(0xffffff60): ''' دائرة تخطيط ومتابعة البرامج  ''',
    const Color(0xff35ff35): ''' كبير مهندسي مشاريع محطات الطاقة   ''',
    const Color(0xff35ffff):
        ''' وكيل مركز الرقابة والرقابة   ''',
    const Color(0xff6464ff):
        ''' مهندس تشغيل وصيانة محطات توليد الكهرباء ومحطات التقطير    ''',
    const Color(0xffff35ff):
        ''' الوكيل المساعد للتشغيل والصيانة ''',
  },
};



Map<String, Map<Color, String>> imagesLabel = {
  'basement': {
    const Color(0xffffff5f): '''             Emergency room                 ''',
    const Color(0xfff2d9c9): '''Administrative services department''',
    const Color(0xffdfdfff): '''Design and Services Departmnent''',
    const Color(0xffc9ddee):
        '''Communication Department Telephone Maintenance''',
    const Color(0xff875fff): '''Personnel Administration Work Division ''',
    const Color(0xfff7b0b3):
        ''' Personnel Administration , Archives & Report Division ''',
    const Color(0xffdae4df): '''          Transportation Department         ''',
    const Color(0xff7c83be):
        '''  Archive Water Distillation Plant Project CE(DP)P ''',
    const Color(0xfFff0000):
        ''' Administrative Office Prepration Supervision Store  ''',
    const Color(0xff6fff6f):
        ''' Safety and Security Division Health Equipment Store   ''',
    const Color(0xff3fffff):
        ''' Adminsitrative Office Prepration Supervision ''',
    const Color(0xffc1e5f9):
        ''' Distribution Networks Administration Store  ''',
    const Color(0xffe7ffcf): '''             Meeting Room               ''',
    const Color(0xffe0f2dd):
        ''' Contracts and Tenders Administrative Store   ''',
    const Color(0xff946a8a): ''' Electrical and Power Station Department    ''',
    const Color(0xff00b88a): ''' Engineering Drawings Department  ''',
    const Color(0xffc7c7e3): ''' Design and supervision department ''',
    const Color(0xff7e00ff):
        '''                  General Offices                 ''',
    const Color(0xffad4547): '''                   CMS                ''',
    const Color(0xfffbc072): '''         General Offices         ''',
    const Color(0xff7a66bc):
        '''     Communication Department Telephone Maintenance         ''',
    const Color(0xff6b596d): '''     Power Station Project      ''',
    const Color(0xffff5fae):
        ''' Financial Control Store , Purchases Store ,Accounts Store ,Investment & Projects Store''',
    const Color(0xffff622f): ''' Passport Control & Passport Supervision ''',
    const Color(0xffe4d6d2): ''' Automated Center for Current Affairs ''',
    const Color(0xffcaca3f): ''' information technology biometric office ''',
    const Color(0xff3fcfff):
        '''             Automated Public Center         ''',
    const Color(0xff9effb7): '''               Prayer Room                   '''
  },
  'ground': {
    const Color(0xfff48d6a): '''            Information Office             ''',
    const Color(0xffdab2d2): ''' Purchases and Imports Departments  ''',
    const Color(0xff35c3ff): '''    Monitor Current Expenses     ''',
    const Color(0xff8835ff): '''   Accounts Department       ''',
    const Color(0xffff7e9f): ''' Financial and Administrative Affair Sector ''',
    const Color(0xff6583a4): ''' Financial Department ''',
    const Color(0xff64c7a5): ''' Controller for Investment account''',
    const Color(0xff84c87b): '''       Post Receipt     ''',
    const Color(0xff588565): ''' ManPower Planing Department  ''',
    const Color(0xffee3f41): '''   department of end of services  ''',
    const Color(0xff9898cc): '''  Secretary of personal affairs  ''',
    const Color(0xff35ff35): '''  Increments And Allownces Section ''',
    const Color(0xfff8da4a): '''  Leave and Duties Section ''',
    const Color(0xff9393ff): '''  Personal Affairs Department ''',
    const Color(0xffff64ff):
        '''Secretary of the Assistant Undersecretary for Administrative Affairs ''',
    const Color(0xff27ffff):
        ''' Assistant Undersecretary for Administrative Affairs ''',
    const Color(0xffff3588): '''    Personal Affairs department    ''',
    const Color(0xffff7664): '''   Safety and Security Control     ''',
  },
  'first floor': {
    const Color(0xffd07644): '''        Empty      ''',
    const Color(0xff35ff35): '''    Budgets Department     ''',
    const Color(0xffffff60): '''    Financial Audit Checking Department    ''',
    const Color(0xff64ffff): '''   Financial Affairs Sector    ''',
    const Color(0xff3535ff):
        '''  Assistant Under Secretary for Financial Affairs  ''',
    const Color(0xfFff35ff): '''     Contracts & Tenders Department     ''',
    const Color(0xffff88a6):
        ''' Assistant Under Secretary for Financial Affairs office    ''',
    const Color(0xff35c3ff): '''     Contracts and Tenders Department     ''',
    const Color(0xffff3535): '''     Ministary of Finance       ''',
    const Color(0xff8835ff): '''         Automated Center Management     ''',
    const Color(0xff878dc0): '''    Banking and Scheduling Department     ''',
    const Color(0xfff89a1e): '''     Distribution Network Managemnet     ''',
    const Color(0xff2776bb):
        ''' Assistant Under Secretary for Electrical Distribution Network   ''',
    const Color(0xffff7664):
        ''' Department of Electrical Distribution Network Department  ''',
    const Color(0xff7d4f72):
        ''' Contract follow up and Maintenance Department  ''',
    const Color(0xffffff35): '''      Customer Service      ''',
    const Color(0xffff35ff): '''    Technical Support Monitor      ''',
    const Color(0xfff7b1b4):
        ''' Department of Public Sector Institution & Private Utitlities  ''',
    const Color(0xffff3535): ''' Collection Follow up Section ''',
    const Color(0xff739383): '''          Clearence         ''',
    const Color(0xffff003f): '''          Server room       ''',
    const Color(0xff5435ff): '''          Secretary         ''',
    const Color(0xff9d6c5c):
        ''' Assistant Under Secretary for Consumer Affairs   ''',
  },
  'second floor': {
    const Color(0xfff9b069):
        '''  Water projects sector , Design department water networks and water projects ''',
    const Color(0xffb85c5c):
        ''' Water projects Sector , Water Structure Projects Department  ''',
    const Color(0xff35bd93):
        ''' Office of the Assistant Undersecretary for water projects   ''',
    const Color(0xff706072): '''  Technical Ofiice of an Agent   ''',
    const Color(0xfF9a1b1e):
        ''' Water Projects Sector , fuel Network Project Management    ''',
    const Color(0xff64ccff): '''      Administrative Services     ''',
    const Color(0xff88ffa6): '''       Civil Service Bureau       ''',
    const Color(0xff6d74b4):
        ''' Water Projects Sector - Water Network Project Management   ''',
    const Color(0xffd07644):
        ''' Water Projects Sector - Water Structure Projects Department     ''',
    const Color(0xfff7b1b4):
        ''' Techinical Services and Main Workshop Sector , Design and Supervision Department ''',
    const Color(0xff8835ff):
        ''' Water Operation and Maintainence Sector , Water opertaion and Maintenance Secretariat  ''',
    const Color(0xff4f7d66):
        ''' Technical Services and Main Workshop Sector , Design and Supervision Department , Supervision Division   ''',
    const Color(0xff7664ff):
        ''' Technical Services and Main workshop Sector , Design and Supervision Department , Electrical Work Division   ''',
    const Color(0xff4381c0): ''' Technical Services and Main Workshop Sector , 
    Head of Technical Office and Fire Accidents to the assistant Undersecretary   ''',
    const Color(0xff93738b):
        ''' Technical Services and Main WrokShop Sector , Technical office and Fire Accidents to the Assistant UnderSecretary  ''',
    const Color(0xff68bf5b): ''' State Audit Bureau ''',
    const Color(0xff35bd93):
        ''' Administrative affairs sector , General Registry Department ''',
    const Color(0xffff3588): '''    Financial Controllers Agency    ''',
    const Color(0xffff35ff):
        ''' Planning Training & Information System Sector  - Administrative Devleopment and training Department  ''',
    const Color(0xff6464ff):
        ''' Services and Main Workshop Sector - Design and Supervision Department - Mechanical Work Divison   ''',
    const Color(0xffff7664):
        ''' Administrative Affair Sector , Director Office , Follow-up and Development Department   ''',
    const Color(0xff93ffff): '''    Technical Control Department  ''',
    const Color(0xff64ff64):
        ''' Planning , training and Information Systems Sector-Director Office Techinical Supervision Department  ''',
    const Color(0xff9d6c5c):
        ''' Planing , Training and Information System Sector . Statistics department ''',
    const Color(0xffdd3700):
        ''' Planing , Training and Information system Sector , Study and Research Department  ''',
    const Color(0xffbdbd35): ''' Saftey and Security   ''',
    const Color(0xff9486c7):
        ''' Stations sector , secuirty and safety managemnent of stations   ''',
    const Color(0xffffff00): '''     Legal Affairs       ''',
    const Color(0xffff3535):
        ''' Techinical Services and Main Workshop Sector-Vice Secretary of Technical Services and main workshop Affair Sector    ''',
    const Color(0xffe47264):
        ''' Technical Service and main workshop Sector , Assistant Undersecretary for Technical Services and main workshop Affairs Sector    ''',
    const Color(0xff979797): ''' Secretary of the agent for water projects  ''',
    const Color(0xff353535):
        ''' Water Operation and Maintainenace Sector, Assistant Undersecretary for Water Operation and Maintainenance  ''',
  },
  'third floor': {
    const Color(0xffff649c): '''  Public Relation and Citizen Optimized  ''',
    const Color(0xffff5435):
        ''' Vice Secretary of Power Station and Distillation plants Sector   ''',
    const Color(0xffdf4e35):
        ''' Engineering Programs and Environment Department   ''',
    const Color(0xff9d6c5c):
        ''' Vice Secretary of Planning , Trainging & Training Sector   ''',
    const Color(0xffc7c764):
        '''  Assistant Undersecretary for Electrical Transmission Network    ''',
    const Color(0xfF7e6bbd):
        '''  Assistant Undersecretary for Planning , Training and It sector    ''',
    const Color(0xffff35ff): ''' Electrical work Department  ''',
    const Color(0xff353535): ''' Control / Coordintaion and Follow-up  ''',
    const Color(0xff58ba48):
        ''' Undersecretary of Power Stations & Water Distillation  ''',
    const Color(0xff35bd93):
        ''' Department of Public Relation and Citizen Service  ''',
    const Color(0xff649cff):
        ''' Electrical Power Station Projects / Drawing and Archive Section ''',
    const Color(0xff818181): ''' Ministerial Zone / Undersecretary Office   ''',
    const Color(0xfff8a13e):
        ''' Water Distribution Units Projects / Design Department ''',
    const Color(0xff7d4f72): '''     Underground Cable Section     ''',
    const Color(0xff5435ff):
        ''' Cheif Engineer for Water Distillation Projects  ''',
    const Color(0xffbd6b6b):
        '''Construction Division Water Distillation Plants Project ''',
    const Color(0xff4381c0):
        ''' Electrical Power Station Projects / Drawing and Archive Section  ''',
    const Color(0xff4f7d66):
        ''' Civil work Department of Electrical Power Station Project ''',
    const Color(0xfffcd5a3):
        ''' Construction Division Water Distillation Plants Project ''',
    const Color(0xffabdf7a): '''     Mechanical Works Department     ''',
    const Color(0xff9cffb4): '''    Program Planning and follow-up   ''',
    const Color(0xff64ccff): '''    Private Sector Projects Department  ''',
    const Color(0xfff7b1b4): ''' Electrical works department  ''',
    const Color(0xff6d74b4):
        ''' Project Management of Power Station & Distillation Plants Sector  ''',
    const Color(0xffd07644):
        ''' Electrical Work department Instrument and & Control Department  ''',
    const Color(0xffff3535):
        ''' Instrument & Control Department of Electrical Power Station Project ''',
    const Color(0xffffff60): ''' Program Planning and Follow up Department  ''',
    const Color(0xff35ff35): ''' Chief Engineer of Power Station Projects   ''',
    const Color(0xff35ffff):
        ''' Undersecretary of Supervision and Control Center   ''',
    const Color(0xff6464ff):
        ''' Cheif Engineer Operation and   Maintenance power Station and Distillation Plants    ''',
    const Color(0xffff35ff):
        ''' Assistant Undersecretary for Operation and Maintenance ''',
  },
};

Map<String, Color> labels = {
  '''basement-Emergency room''': const Color(0xffffff5f),

  '''basement-Administrative services department''': const Color(0xfff2d9c9),

  '''basement-Design and Supervision Departmnent''': const Color(0xffdfdfff),
  '''basemnet-General Offices ''': const Color(0xff7e00ff),
  '''basement-Communication Department Telephone Maintenance''':
      const Color(0xffc9ddee),
  '''basement-Personnel Administration Work Division ''':
      const Color(0xff875fff),
  '''basement-Personnel Administration , Archives & Report Division ''':
      const Color(0xfff7b0b3),
  '''basement-Transportation Department ''': const Color(0xffdae4df),
  '''basement-Archive Water Distillation Plant Project CE(DP)P ''':
      const Color(0xff7c83be),
  '''basement-Administrative Office Prepration Supervision Store  ''':
      const Color(0xfFff0000),
  '''basement-Safety and Security Division Health Equipment Store   ''':
      const Color(0xff6fff6f),
  '''basement-Adminsitrative Office Prepration Supervision ''':
      const Color(0xff3fffff),
  '''basement-Distribution Networks Administration Store  ''':
      const Color(0xffc1e5f9),
  '''basement-Meeting Room    ''': const Color(0xffe7ffcf),
  '''basement-Contracts and Tenders Administrative Stre    ''':
      const Color(0xffe0f2dd),
  '''basement-Electrical and Power Station Department    ''':
      const Color(0xff946a8a),
  '''basement-Engineering Drawings Department  ''': const Color(0xff00b88a),
  '''basement-Design and supervision department ''': const Color(0xffc7c7e3),
  '''basement-General Offices ''': const Color(0xff7800f3),
  '''basement-CMS ''': const Color(0xffad4547),
  '''basement-General Offices ''': const Color(0xfffbc072),
  '''basement-Communication Department Telephone Maintenance ''':
      const Color(0xff7a66bc),
  '''basement-Power Station Project ''': const Color(0xff6b596d),
  '''basement-Financial Control Store , Purchases Store ,Accounts Store ,Investment & Projects Store''':
      const Color(0xffff5fae),
  '''basement-Passport Control & Passport Supervision ''':
      const Color(0xffff622f),
  '''basement-Automated Center for Current Affairs ''': const Color(0xffe4d6d2),
  '''basement-information technology biometric office ''':
      const Color(0xffcaca3f),
  '''basement-Automated Public Center ''': const Color(0xff3fcfff),
  '''basement-Prayer Room ''': const Color(0xff9effb7),

  //ground
  '''ground-ground-Information Office ''': const Color(0xfff48d6a),
  '''ground-Purchases and Imports Departments  ''': const Color(0xffdab2d2),
  '''ground-Monitor Current Expenses ''': const Color(0xff35c3ff),
  '''ground-Accounts Department ''': const Color(0xff8835ff),
  '''ground-Financial and Administrative Affair Sector ''':
      const Color(0xffff7e9f),
  '''ground-Financial Department ''': const Color(0xff6583a4),
  '''ground-Controller for Investment account''': const Color(0xff64c7a5),
  '''ground-Post Receipt ''': const Color(0xff84c87b),
  '''ground-ManPower Planing Department  ''': const Color(0xff588565),
  '''ground-department of end of services''': const Color(0xffee3f41),
  '''ground-Department of End of Services  ''': const Color(0xff9898cc),
  '''ground-Increments And Allownces Section ''': const Color(0xff35ff35),
  '''ground-Leave and Duties Section ''': const Color(0xfff8da4a),
  '''ground-Personal Affairs Department ''': const Color(0xff9393ff),
  '''ground-Secretary of the Assistant Undersecretary for Administrative Affairs ''':
      const Color(0xffff64ff),
  '''ground-Assistant Undersecretary for Administrative Affairs ''':
      const Color(0xff27ffff),
  '''ground-Personal Affairs department ''': const Color(0xffff3588),
  '''ground-Safety and Security Control  ''': const Color(0xffff7664),

  //first floor
  '''first floor-Empty ''': const Color(0xffd07644),
  '''first floor-Budgets Department  ''': const Color(0xff35ff35),
  '''first floor-Financial Audit Checking Department  ''':
      const Color(0xffffff60),
  '''first floor-Financial Affairs Sector  ''': const Color(0xff64ffff),
  '''first floor-Assistant Under Secretary for Financial Affairs  ''':
      const Color(0xff3535ff),
  '''first floor-Contracts & Tenders Department   ''': const Color(0xfFff35ff),
  '''first floor-Assistant Under Secretary for Financial Affairs office ''':
      const Color(0xffff88a6),
  '''first floor-Contracts and Tenders Department  ''': const Color(0xff35c3ff),
  '''first floor-Ministary of Finance   ''': const Color(0xffff3535),
  '''first floor-Automated Center Management ''': const Color(0xff8835ff),
  '''first floor-Banking and Scheduling Department''': const Color(0xff878dc0),
  '''first floor-Distribution Network Managemnet''': const Color(0xfff89a1e),
  '''first floor-Assistant Under Secretary for Electrical Distribution Network''':
      const Color(0xff2776bb),
  '''first floor-Department of Electrical Distribution Network Department  ''':
      const Color(0xffff7664),
  '''first floor-Contract follow up and Maintenance Department  ''':
      const Color(0xff7d4f72),
  '''first floor-Customer Service ''': const Color(0xffffff35),
  '''first floor-Technical Support Monitor''': const Color(0xffff35ff),
  '''first floor-Department of Public Sector Institution & Private Utitlities ''':
      const Color(0xfff7b1b4),
  '''first floor-Collection Follow up Section ''': const Color(0xffff3535),
  '''first floor-Clearence ''': const Color(0xff739383),
  '''first floor-Server room  ''': const Color(0xffff003f),
  '''first floor-Secretary  ''': const Color(0xff5435ff),
  '''first floor-Assistant Under Secretary for Consumer Affairs''':
      const Color(0xff9d6c5c),

  //second floor
  '''second floor-Water projects sector , Design department water networks and water projects''':
      const Color(0xfff9b069),
  '''second floor-Water projects Sector , Water Structure Projects Department ''':
      const Color(0xffb85c5c),

  '''second floor-Office of the Assistant Undersecretary for water projects''':
      const Color(0xff35bd93),
  '''second floor-Technical Ofiice of an Agent''': const Color(0xff706072),
  '''second floor-Water Projects Sector , fuel Network Project Management ''':
      const Color(0xfF9a1b1e),
  '''second floor-Administrative Services  ''': const Color(0xff64ccff),
  '''second floor-Civil Service Bureau ''': const Color(0xff88ffa6),
  '''second floor-Water Projects Sector - Water Network Project Management ''':
      const Color(0xff6d74b4),
  '''second floor-Water Projects Sector - Water Structure Projects Department ''':
      const Color(0xffd07644),
  '''second floor-Techinical Services and Main Workshop Sector , Design and Supervision Department ''':
      const Color(0xfff7b1b4),
  '''second floor-Water Operation and Maintainence Sector , Water opertaion and Maintenance Secretariat ''':
      const Color(0xff8835ff),

  '''second floor-Technical Services and Main Workshop Sector , Design and Supervision Department , Supervision Division   ''':
      const Color(0xff4f7d66),

  '''second floor-Technical Services and Main workshop Sector , Design and Supervision Department , Electrical Work Division ''':
      const Color(0xff7664ff),
  '''second floor-Technical Services and Main Workshop Sector , 
    Head of Technical Office and Fire Accidents to the assistant Undersecretary   ''':
      const Color(0xff4381c0),

  '''second floor-Technical Services and Main WrokShop Sector , Technical office and Fire Accidents to the Assistant UnderSecretary  ''':
      const Color(0xff93738b),
  '''second floor-State Audit Bureau ''': const Color(0xff68bf5b),

  '''second floor-Administrative affairs sector , General Registry Department ''':
      const Color(0xff35bd93),
  '''second floor-Financial Controllers Agency  ''': const Color(0xffff3588),

  '''second floor-Planning Training & Information System Sector  - Administrative Devleopment and training Department  ''':
      const Color(0xffff35ff),

  '''second floor-Services and Main Workshop Sector - Design and Supervision Department - Mechanical Work Divison   ''':
      const Color(0xff6464ff),

  '''second floor-Administrative Affair Sector , Director Office , Follow-up and Development Department ''':
      const Color(0xffff7664),
  '''second floor-Technical Control Department ''': const Color(0xff93ffff),

  '''second floor-Planning , training and Information Systems Sector-Director Office Techinical Supervision Department ''':
      const Color(0xff64ff64),

  '''second floor-Planing , Training and Information System Sector . Statistics department ''':
      const Color(0xff9d6c5c),

  '''second floor-Planing , Training and Information system Sector , Study and Research Department  ''':
      const Color(0xffdd3700),
  '''second floor-Saftey and Security   ''': const Color(0xffbdbd35),

  '''second floor-Stations sector , secuirty and safety managemnent of stations  ''':
      const Color(0xff9486c7),
  '''second floor-Legal Affairs ''': const Color(0xffffff00),

  '''second floor-Techinical Services and Main Workshop Sector-Vice Secretary of Technical Services and main workshop Affair Sector  ''':
      const Color(0xffff3535),

  '''second floor-Technical Service and main workshop Sector , Assistant Undersecretary for Technical Services and main workshop Affairs Sector  ''':
      const Color(0xffe47264),
  '''second floor-Secretary of the agent for water projects  ''':
      const Color(0xff979797),

  '''second floor-Water Operation and Maintainenace Sector, Assistant Undersecretary for Water Operation and Maintainenance  ''':
      const Color(0xff353535),

  //third floor
  '''third floor-Technical Services and Main Workshop Sector , Design and Supervision Department , Supervision Division ''':
      const Color(0xff4f7d66),
  '''third floor-Technical Services and Main workshop Sector , Design and Supervision Department , Electrical Work Division ''':
      const Color(0xff7664ff),
  '''third floor-Technical Services and Main Workshop Sector , 
    Head of Technical Office and Fire Accidents to the assistant Undersecretary  ''':
      const Color(0xff4381c0),
  '''third floor-Technical Services and Main WrokShop Sector , Technical office and Fire Accidents to the Assistant UnderSecretary  ''':
      const Color(0xff93738b),
  '''third floor-State Audit Bureau ''': const Color(0xff68bf5b),
  '''third floor-Administrative affairs sector , General Registry Department ''':
      const Color(0xff35bd93),
  '''third floor-Financial Controllers Agency  ''': const Color(0xffff3588),
  '''third floor-Planning Training & Information System Sector  - Administrative Devleopment and training Department ''':
      const Color(0xffff35ff),
  '''third floor-Services and Main Workshop Sector - Design and Supervision Department - Mechanical Work Divison ''':
      const Color(0xff6464ff),
  '''third floor-Administrative Affair Sector , Director Office , Follow-up and Development Department ''':
      const Color(0xffff7664),
  '''third floor-Technical Control Department  ''': const Color(0xff93ffff),
  '''third floor-Planning , training and Information Systems Sector-Director Office Techinical Supervision Department''':
      const Color(0xff64ff64),
  '''third floor-Planing , Training and Information System Sector . Statistics department''':
      const Color(0xff9d6c5c),
  '''third floor-Planing , Training and Information system Sector , Study and Research Department''':
      const Color(0xffdd3700),
  '''third floor-Saftey and Security''': const Color(0xffbdbd35),
  '''third floor-Stations sector , secuirty and safety managemnent of stations''':
      const Color(0xff9486c7),
  '''third floor-Legal Affairs  ''': const Color(0xffffff00),
  '''third floor-Techinical Services and Main Workshop Sector-Vice Secretary of Technical Services and main workshop Affair Sector ''':
      const Color(0xffff3535),
  '''third floor-Technical Service and main workshop Sector , Assistant Undersecretary for Technical Services and main workshop Affairs Sector ''':
      const Color(0xffe47264),
  '''third floor-Secretary of the agent for water projects  ''':
      const Color(0xff979797),
  '''third floor-Water Operation and Maintainenace Sector, Assistant Undersecretary for Water Operation and Maintainenance  ''':
      const Color(0xff353535),
  '''third floor-Public Relation and Citizen Optimized  ''':
      const Color(0xffff649c),
  '''third floor-Vice Secretary of Power Station and Distillation plants Sector   ''':
      const Color(0xffff5435),
  '''third floor-Engineering Programs and Environment Department   ''':
      const Color(0xffdf4e35),
  '''third floor-Vice Secretary of Planning , Trainging & Training Sector   ''':
      const Color(0xff9d6c5c),
  '''third floor-Assistant Undersecretary for Electrical Transmission Network    ''':
      const Color(0xffc7c764),
  '''third floor-Assistant Undersecretary for Planning , Training and It sector    ''':
      const Color(0xfF7e6bbd),
  '''third floor-Electrical work Department  ''': const Color(0xffff35ff),
  '''third floor-Control / Coordintaion and Follow-up  ''':
      const Color(0xff353535),
  '''third floor-Undersecretary of Power Stations & Water Distillation  ''':
      const Color(0xff58ba48),
  '''third floor-Department of Public Relation and Citizen Service  ''':
      const Color(0xff35bd93),
  '''third floor-Electrical Power Station Projects / Drawing and Archive Section ''':
      const Color(0xff649cff),
  '''third floor-Ministerial Zone / Undersecretary Office ''':
      const Color(0xff818181),
  '''third floor-Water Distribution Units Projects / Design Department ''':
      const Color(0xfff8a13e),
  '''third floor-Underground Cable Section  ''': const Color(0xff7d4f72),

  '''third floor-Construction Division Water Distillation Plants Project ''':
      const Color(0xffbd6b6b),
  '''third floor-Cheif Engineer for Water Distillation Projects ''':
      const Color(0xff5435ff),
  '''third floor-Electrical Power Station Projects / Drawing and Archive Section  ''':
      const Color(0xff4381c0),
  '''third floor-Civil work Department of Electrical Power Station Project ''':
      const Color(0xff4f7d66),
  '''third floor-Construction Division Water Distillation Plants Project ''':
      const Color(0xfffcd5a3),
  '''third floor-Mechanical Works Department ''': const Color(0xffabdf7a),
  '''third floor-Program Planning and follow-up   ''': const Color(0xff9cffb4),
  '''third floor-Private Sector Projects Department  ''':
      const Color(0xff64ccff),
  '''third floor-Electrical works department  ''': const Color(0xfff7b1b4),
  '''third floor-Project Management of Power Station & Distillation Plants Sector  ''':
      const Color(0xff6d74b4),
  '''third floor-Electrical Work department Instrument and & Control Department  ''':
      const Color(0xffd07644),
  '''third floor-Instrument & Control Department of Electrical Power Station Project ''':
      const Color(0xffff3535),
  '''third floor-Program Planning and Follow up Department  ''':
      const Color(0xffffff60),
  '''third floor-Chief Engineer of Power Station Projects   ''':
      const Color(0xff35ff35),
  '''third floor-Undersecretary of Supervision and Control Center   ''':
      const Color(0xff35ffff),
  '''third floor-Cheif Engineer Operation and   Maintenance power Station and Distillation Plants  ''':
      const Color(0xff6464ff),
  '''third floor-Assistant Undersecretary for Operation and Maintenance ''':
      const Color(0xffff35ff),
};

Map<String, Offset> desktopOffset = {
  '''basement-Emergency room''': const Offset(735.1, 498.0),

  '''basement-Administrative services department''': const Offset(690.1, 452.0),

  '''basement-Design and Supervision Departmnent''': const Offset(825.1, 329.0),

  '''basement-Communication Department Telephone Maintenance''':
      const Offset(368.1, 349.0),
  '''basement-Personnel Administration Work Division ''':
      const Offset(445.1, 391.0),
  '''basement-Personnel Administration , Archives & Report Division ''':
      const Offset(494.1, 353.0),
  '''basement-Transportation Department ''': const Offset(570.1, 432.0),
  '''basement-Archive Water Distillation Plant Project CE(DP)P ''':
      const Offset(656.1, 515.0),
  '''basement-Administrative Office Prepration Supervision Store  ''':
      const Offset(815.1, 565.0),
  '''basement-Safety and Security Division Health Equipment Store   ''':
      const Offset(887.1, 461.0),
  //second layer
  '''basement-Adminsitrative Office Prepration Supervision ''':
      const Offset(947.1, 375.0),
  '''basement-Distribution Networks Administration Store  ''':
      const Offset(1047.1, 299.0),
  '''basement-Meeting Room    ''': const Offset(600.1, 289.0),
  '''basement-Contracts and Tenders Administrative Store ''':
      const Offset(634.1, 315.0),
  '''basement-Electrical and Power Station Department    ''':
      const Offset(681.1, 345.0),
  '''basement-Engineering Drawings Department  ''': const Offset(888.1, 287.0),
  '''basement-Design and supervision department ''': const Offset(888.1, 287.0),
  '''basement-General Offices ''': const Offset(666.1, 247.0),
  '''basement-CMS ''': const Offset(970, 232.0),
  '''basement-Communication Department Telephone Maintenance ''':
      const Offset(783.1, 198.0),
  '''basement-Power Station Project ''': const Offset(666.1, 247.0),
  '''basement-Financial Control Store , Purchases Store ,Accounts Store ,Investment & Projects Store''':
      const Offset(701.1, 182.0),
  '''basement-Passport Control & Passport Supervision ''':
      const Offset(586.1, 204.0),
  '''basement-Automated Center for Current Affairs ''':
      const Offset(583.1, 161.0),
  '''basement-information technology biometric office ''':
      const Offset(613.1, 124.0),
  '''basement-Automated Public Center ''': const Offset(774.1, 98.0),
  '''basement-Prayer Room ''': const Offset(841.1, 161.0),

  //ground
  '''ground-Information Office ''': const Offset(444.3, 339.1),
  '''ground-Purchases and Imports Departments  ''': const Offset(436.1, 331.0),
  '''ground-Monitor Current Expenses ''': const Offset(495.1, 233.0),
  '''ground-Accounts Department ''': const Offset(495.1, 233.0),
  '''ground-Financial and Administrative Affair Sector ''':
      const Offset(599.1, 153.0),
  '''ground-Financial Department ''': const Offset(686.1, 80.0),
  '''ground-Controller for Investment account''': const Offset(600.5, 228.0),
  '''ground-Post Receipt ''': const Offset(600.5, 228.0),
  '''ground-ManPower Planing Department  ''': const Offset(739.8, 558.4),
  '''ground-department of end of services''': const Offset(810.5, 510.6),
  '''ground-Department of End of Services  ''': const Offset(856.2, 478.7),
  '''ground-Increments And Allownces Section ''': const Offset(912.0, 446.9),
  '''ground-Leave and Duties Section ''': const Offset(912.0, 446.9),
  '''ground-Personal Affairs Department ''': const Offset(912.0, 446.9),
  '''ground-Secretary of the Assistant Undersecretary for Administrative Affairs ''':
      const Offset(912.0, 446.9),
  '''ground-Assistant Undersecretary for Administrative Affairs ''':
      const Offset(994.6, 241.9),
  '''ground-Personal Affairs department ''': const Offset(870.2, 365.3),
  '''ground-Safety and Security Control  ''': const Offset(829.4, 388.2),

  //first floor
  '''first floor-Empty ''': const Offset(450.8, 308.1),
  '''first floor-Budgets Department  ''': const Offset(496.7, 238.8),
  '''first floor-Financial Audit Checking Department  ''':
      const Offset(539.1, 208.0),
  '''first floor-Financial Affairs Sector  ''': const Offset(582.1, 161.0),
  '''first floor-Assistant Under Secretary for Financial Affairs  ''':
      const Offset(616.1, 133.0),
  '''first floor-Contracts and Tenders Department ''':
      const Offset(737.2, 64.9),
  '''first floor-Assistant Under Secretary for Financial Affairs office ''':
      const Offset(645.8, 183.0),
  '''first floor-Contracts and Tenders Department  ''':
      const Offset(640.1, 204.0),
  '''first floor-Ministary of Finance   ''': const Offset(596.1, 231.8),
  '''first floor-Automated Center Management ''': const Offset(629.5, 382.6),
  '''first floor-Banking and Scheduling Department''':
      const Offset(555.9, 395.6),
  '''first floor-Distribution Network Managemnet''': const Offset(611.9, 444.9),
  '''first floor-Assistant Under Secretary for Electrical Distribution Network''':
      const Offset(674.4, 516.9),
  '''first floor-Department of Electrical Distribution Network Department  ''':
      const Offset(772.1, 561.5),
  '''first floor-Contract follow up and Maintenance Department  ''':
      const Offset(806.2, 523.6),
  '''first floor-Customer Service ''': const Offset(837.5, 478.1),
  '''first floor-Technical Support Monitor''': const Offset(890.6, 443.0),
  '''first floor-Department of Public Sector Institution & Private Utitlities ''':
      const Offset(830.6, 376.6),
  '''first floor-Collection Follow up Section ''': const Offset(932.3, 405.1),
  '''first floor-Clearence ''': const Offset(970, 372.8),
  '''first floor-Server room  ''': const Offset(896.1, 352.9),
  '''first floor-Secretary  ''': const Offset(992.6, 346.6),
  '''first floor-Assistant Under Secretary for Consumer Affairs''':
      const Offset(1020.9, 274.6),

  '''second floor-Water projects sector , Design department water networks and water projects''':
      const Offset(461.3, 303.0),
  '''second floor-Water projects Sector , Water Structure Projects Department ''':
      const Offset(545.3, 220.1),

  '''second floor-Office of the Assistant Undersecretary for water projects''':
      const Offset(591.1, 170.6),
  '''second floor-Technical Ofice of an Agent''': const Offset(628.5, 148.7),
  '''second floor-Water Projects Sector , fuel Network Project Management ''':
      const Offset(643.9, 117.7),
  '''second floor-Administrative Services  ''': const Offset(668.6, 85.8),
  '''second floor-Civil Service Bureau ''': const Offset(706.8, 68.5),
  '''second floor-Water Projects Sector - Water Network Project Management ''':
      const Offset(620.3, 247.1),
  '''second floor-Water Projects Sector - Water Structure Projects Department ''':
      const Offset(663.1, 203.4),
  '''second floor-Techinical Services and Main Workshop Sector , Design and Supervision Department ''':
      const Offset(492.7, 371.0),
  '''second floor-Water Operation and Maintainence Sector , Water opertaion and Maintenance Secretariat ''':
      const Offset(765.1, 96.8),
  '''Technical Services and Main Workshop Sector ,
    Design and Supervision Department , Supervision Division   ''':
      const Offset(529.0, 392.7),

  '''Technical Services and Main workshop Sector , 
        Design and Supervision Department , Electrical Work Division ''':
      const Offset(562.9, 418.6),
  '''Technical Services and Main Workshop Sector , 
    Head of Technical Office and Fire Accidents to the assistant Undersecretary   ''':
      const Offset(590.9, 430.6),

  '''Technical Services and Main WrokShop Sector , Technical 
        office and Fire Accidents to the Assistant UnderSecretary  ''':
      const Offset(617.8, 456.5),
  '''State Audit Bureau ''': const Offset(646.7, 491.4),

  '''Administrative affairs sector , General Registry Department ''':
      const Offset(741.5, 553.3),
  '''Financial Controllers Agency  ''': const Offset(861.2, 499.4),

  '''Planning Training & Information System Sector  - Administrative Devleopment and training Department  ''':
      const Offset(924.0, 426.6),

  '''Services and Main Workshop Sector - Design and Supervision Department - Mechanical Work Divison   ''':
      const Offset(708.6, 411.6),

  '''Administrative Affair Sector , Director Office , Follow-up and Development Department ''':
      const Offset(924.0, 428.6),
  '''Technical Control Department ''': const Offset(862.2, 373.7),

  '''Planning , training and Information Systems Sector-Director Office Techinical Supervision Department ''':
      const Offset(882.1, 339.8),

  '''Planing , Training and Information System Sector . Statistics department ''':
      const Offset(988.9, 335.8),

  '''Planing , Training and Information system Sector , Study and Research Department  ''':
      const Offset(1039.7, 256.0),
  '''Saftey and Security   ''': const Offset(988.9, 215.1),

  '''Stations sector , secuirty and safety managemnent of stations  ''':
      const Offset(966.9, 191.2),
  '''Legal Affairs ''': const Offset(882.1, 214.1),

  '''Techinical Services and Main Workshop Sector-Vice Secretary 
        of Technical Services and main workshop Affair Sector  ''':
      const Offset(837.3, 212.1),

  '''Technical Service and main workshop Sector , Assistant 
        Undersecretary for Technical Services and main workshop Affairs Sector  ''':
      const Offset(834.3, 136.3),
  '''Secretary of the agent for water projects  ''': const Offset(854.2, 161.2),

  '''Water Operation and Maintainenace Sector, Assistant 
        Undersecretary for Water Operation and Maintainenance  ''':
      const Offset(900.1, 171.2),

  //third floor

  '''third floor-Public Relation and Citizen Optimized  ''':
      const Offset(423.2, 352.3),
  '''third floor-Vice Secretary of Power Station and Distillation plants Sector   ''':
      const Offset(496.3, 282.2),
  '''third floor-Engineering Programs and Environment Department   ''':
      const Offset(524.5, 227.7),
  '''third floor-Vice Secretary of Planning , Trainging & Training Sector   ''':
      const Offset(499.2, 242.3),
  '''third floor-Assistant Undersecretary for Electrical Transmission Network    ''':
      const Offset(581.9, 178.0),
  '''third floor-Assistant Undersecretary for Planning , Training and It sector    ''':
      const Offset(617.0, 150.7),
  '''third floor-Electrical work Department  ''': const Offset(648.1, 100.1),
  '''third floor-Control / Coordintaion and Follow-up  ''':
      const Offset(728.0, 59.2),
  '''third floor-Undersecretary of Power Stations & Water Distillation  ''':
      const Offset(480.7, 384.4),
  '''third floor-Department of Public Relation and Citizen Service  ''':
      const Offset(524.5, 393.2),
  '''third floor-Electrical Power Station Projects / Drawing and Archive Section ''':
      const Offset(616.0, 253.9),
  '''third floor-Ministerial Zone / Undersecretary Office ''':
      const Offset(649.1, 220.8),
  '''third floor-Water Distribution Units Projects / Design Department ''':
      const Offset(571.2, 443.8),
  '''third floor-Underground Cable Section  ''': const Offset(632.6, 373.7),
  '''third floor-Cheif Engineer for Water Distillation Projects ''':
      const Offset(623.8, 484.7),
  '''Construction Division Water Distillation Plants Project ''':
      const Offset(650, 484.8),
  '''third floor-Electrical Power Station Projects / Drawing and Archive Section  ''':
      const Offset(691.0, 411.7),
  '''third floor-Civil work Department of Electrical Power Station Project ''':
      const Offset(720.0, 531.3),
  '''third floor-Construction Division Water Distillation Plants Project ''':
      const Offset(773.3, 568.1),
  '''third floor-Mechanical Works Department ''': const Offset(829.4, 581.7),
  '''third floor-Program Planning and follow-up   ''':
      const Offset(845.9, 522.6),
  '''third floor-Private Sector Projects Department  ''':
      const Offset(891.5, 497.4),
  '''third floor-Electrical works department  ''': const Offset(921.5, 448.9),
  '''third floor-Project Management of Power Station & Distillation Plants Sector  ''':
      const Offset(854.6, 364.6),
  '''third floor-Electrical Work department Instrument and & Control Department  ''':
      const Offset(939.9, 405.3),
  '''third floor-Instrument & Control Department of Electrical Power Station Project ''':
      const Offset(973.8, 388.9),
  '''third floor-Program Planning and Follow up Department  ''':
      const Offset(990.3, 343.3),
  '''third floor-Chief Engineer of Power Station Projects   ''':
      const Offset(1027.1, 310.4),
  '''third floor-Undersecretary of Supervision and Control Center   ''':
      const Offset(1067.8, 267.7),
  '''third floor-Cheif Engineer Operation and   Maintenance power Station and Distillation Plants  ''':
      const Offset(1036.8, 223.2),
  '''third floor-Assistant Undersecretary for Operation and Maintenance ''':
      const Offset(984.5, 198.0),
};

Map<String, Offset> mobilePortraitOffset = {
  '''basement-Emergency room''': const Offset(202.7, 534.9),

  '''basement-Administrative services department''': const Offset(185.6, 514.4),

  '''basement-Design and Supervision Departmnent''': const Offset(237.3, 453.1),

  '''basement-Communication Department Telephone Maintenance''':
      const Offset(53.3, 448.1),
  '''basement-Personnel Administration Work Division ''':
      const Offset(66.9, 483.4),
  '''basement-Personnel Administration , Archives & Report Division ''':
      const Offset(92.1, 479.2),
  '''basement-Transportation Department ''': const Offset(92.1, 479.2),
  '''basement-Archive Water Distillation Plant Project CE(DP)P ''':
      const Offset(92.1, 479.2),
  '''basement-Administrative Office Prepration Supervision Store  ''':
      const Offset(179.7, 516.3),
  '''basement-Safety and Security Division Health Equipment Store   ''':
      const Offset(276.4, 534.8),
  //second layer
  '''basement-Adminsitrative Office Prepration Supervision ''':
      const Offset(298.6, 473.0),
  '''basement-Distribution Networks Administration Store  ''':
      const Offset(337.7, 453.9),
  '''basement-Meeting Room    ''': const Offset(126.6, 437.4),
  '''basement-Contracts and Tenders Administrative Store ''':
      const Offset(150.8, 459.6),
  '''basement-Electrical and Power Station Department    ''':
      const Offset(175.0, 473.6),
  '''basement-Engineering Drawings Department  ''': const Offset(175.0, 473.6),
  '''basement-Design and supervision department ''': const Offset(231.1, 457.1),
  '''basement-General Offices ''': const Offset(751.1, 261.0),
  '''basement-CMS ''': const Offset(283.6, 417.4),
  '''basement-General Offices ''': const Offset(196.1, 426.2),
  '''basement-Communication Department Telephone Maintenance ''':
      const Offset(225.4, 403.5),
  '''basement-Power Station Project ''': const Offset(167.8, 420.5),
  '''basement-Financial Control Store , Purchases Store ,Accounts Store ,Investment & Projects Store''':
      const Offset(189.9, 400.9),
  '''basement-Passport Control & Passport Supervision ''':
      const Offset(122.5, 403.5),
  '''basement-Automated Center for Current Affairs ''':
      const Offset(135.8, 383.4),
  '''basement-information technology biometric office ''':
      const Offset(150.3, 369.0),
  '''basement-Automated Public Center ''': const Offset(211.5, 351.5),
  '''basement-Prayer Room ''': const Offset(245.5, 375.2),

  //ground
  '''ground-Information Office ''': const Offset(77.8, 468.6),
  '''ground-Purchases and Imports Departments  ''': const Offset(76.7, 416.4),
  '''ground-Monitor Current Expenses ''': const Offset(84.7, 398.8),
  '''ground-Accounts Department ''': const Offset(107.1, 380.1),

  '''ground-Financial and Administrative Affair Sector ''':
      const Offset(126.2, 365.7),
  '''ground-Financial Department ''': const Offset(157.1, 335.9),
  '''ground-Controller for Investment account''': const Offset(121.4, 408.4),
  '''ground-Post Receipt ''': const Offset(142.7, 386.0),
  '''ground-ManPower Planing Department  ''': const Offset(168.3, 544.3),
  '''ground-Department of end of services''': const Offset(231.1, 536.3),
  '''ground-Increments And Allownces Section ''': const Offset(274.6, 498.3),
  '''ground-Leave and Duties Section ''': const Offset(300.2, 470.6),
  '''ground-Personal Affairs Department ''': const Offset(327.4, 457.5),
  '''ground-Secretary of the Assistant Undersecretary for Administrative Affairs ''':
      const Offset(351.4, 446.0),
  '''ground-Assistant Undersecretary for Administrative Affairs ''':
      const Offset(311.2, 408.9),
  '''ground-Personal Affairs department ''': const Offset(235.5, 481.6),
  '''ground-Safety and Security Control  ''': const Offset(269.9, 464.3),

  //first floor
  '''first floor-Empty ''': const Offset(58.3, 453.0),
  '''first floor-Budgets Department  ''': const Offset(58.3, 453.0),
  '''first floor-Financial Audit Checking Department  ''':
      const Offset(58.3, 453.0),
  '''first floor-Financial Affairs Sector  ''': const Offset(121.1, 385.6),
  '''first floor-Contracts and Tenders Department ''':
      const Offset(737.2, 64.9),
  '''first floor-Assistant Under Secretary for Financial Affairs office ''':
      const Offset(148.9, 385.3),
  '''first floor-Contracts and Tenders Department  ''':
      const Offset(148.9, 385.3),
  '''first floor-Ministary of Finance   ''': const Offset(123.8, 413.1),
  '''first floor-Automated Center Management ''': const Offset(122.8, 481.7),
  '''first floor-Banking and Scheduling Department''':
      const Offset(90.2, 493.4),
  '''first floor-Distribution Network Managemnet''': const Offset(126.3, 531.0),
  '''first floor-Assistant Under Secretary for Electrical Distribution Network''':
      const Offset(126.3, 531.0),
  '''first floor-Department of Electrical Distribution Network Department  ''':
      const Offset(189.8, 594.5),
  '''first floor-Contract follow up and Maintenance Department  ''':
      const Offset(226.9, 567.0),
  '''first floor-Customer Service ''': const Offset(226.9, 567.0),
  '''first floor-Technical Support Monitor''': const Offset(226.9, 567.0),
  '''first floor-Department of Public Sector Institution & Private Utitlities ''':
      const Offset(279.7, 492.4),
  '''first floor-Collection Follow up Section ''': const Offset(279.7, 492.4),
  '''first floor-Clearence ''': const Offset(279.7, 492.4),
  '''first floor-Server room  ''': const Offset(279.7, 492.4),
  '''first floor-Secretary  ''': const Offset(279.7, 492.4),
  '''first floor-Assistant Under Secretary for Consumer Affairs''':
      const Offset(279.7, 492.4),

//second floor

  '''second floor-Water projects sector , Design department water networks and water projects''':
      const Offset(53.2, 458.3),
  '''second floor-Water projects Sector , Water Structure Projects Department ''':
      const Offset(95.3, 409.0),

  '''second floor-Office of the Assistant Undersecretary for water projects''':
      const Offset(95.3, 409.0),
  '''second floor-Technical Ofice of an Agent''': const Offset(95.3, 409.0),
  '''second floor-Water Projects Sector , fuel Network Project Management ''':
      const Offset(95.3, 409.0),
  '''second floor-Administrative Services  ''': const Offset(95.3, 409.0),
  '''second floor-Civil Service Bureau ''': const Offset(186.3, 334.9),
  '''second floor-Water Projects Sector - Water Network Project Management ''':
      const Offset(132.4, 438.0),
  '''second floor-Water Projects Sector - Water Structure Projects Department ''':
      const Offset(155.3, 411.6),
  '''second floor-Techinical Services and Main Workshop Sector , Design and Supervision Department ''':
      const Offset(78.6, 494.4),
  '''second floor-Water Operation and Maintainence Sector , Water opertaion and Maintenance Secretariat ''':
      const Offset(204.3, 346.8),
  ///////////////////////////////
  '''second floor-Technical Services and Main Workshop Sector ,
    Design and Supervision Department , Supervision Division   ''':
      const Offset(76.8, 502.0),

  '''second floor-Technical Services and Main workshop Sector , 
        Design and Supervision Department , Electrical Work Division ''':
      const Offset(108.6, 500.3),
  '''second floor-Technical Services and Main Workshop Sector , 
    Head of Technical Office and Fire Accidents to the assistant Undersecretary   ''':
      const Offset(121.3, 508.6),

  '''second floor-Technical Services and Main WrokShop Sector , Technical 
        office and Fire Accidents to the Assistant UnderSecretary  ''':
      const Offset(121.3, 508.6),
  '''second floor-State Audit Bureau ''': const Offset(147.5, 539.8),

  '''second floor-Administrative affairs sector , General Registry Department ''':
      const Offset(183.1, 562.6),
  '''second floor-Financial Controllers Agency  ''': const Offset(861.2, 499.4),

  '''second floor-Planning Training & Information System Sector  - Administrative Devleopment and training Department  ''':
      const Offset(142.5, 494.2),

  '''second floor-Services and Main Workshop Sector - Design and Supervision Department - Mechanical Work Divison   ''':
      const Offset(178.1, 495.3),

  '''second floor-Administrative Affair Sector , Director Office , Follow-up and Development Department ''':
      const Offset(924.0, 428.6),
  '''second floor-Technical Control Department ''': const Offset(289.4, 508.6),

  '''second floor-Planning , training and Information Systems Sector-Director Office Techinical Supervision Department ''':
      const Offset(262.1, 451.9),

  '''second floor-Planing , Training and Information System Sector . Statistics department ''':
      const Offset(262.1, 451.9),

  '''second floor-Planing , Training and Information system Sector , Study and Research Department  ''':
      const Offset(262.1, 451.9),
  '''second floor-Saftey and Security   ''': const Offset(321.1, 400.7),

  '''second floor-Stations sector , secuirty and safety managemnent of stations  ''':
      const Offset(321.1, 400.7),
  '''second floor-Legal Affairs ''': const Offset(321.1, 400.7),

  ''' Techinical Services and Main Workshop Sector-Vice Secretary 
        of Technical Services and main workshop Affair Sector  ''':
      const Offset(239.8, 407.4),

  '''second floor-Technical Service and main workshop Sector , Assistant 
        Undersecretary for Technical Services and main workshop Affairs Sector  ''':
      const Offset(238.2, 367.9),
  '''second floor-Secretary of the agent for water projects  ''':
      const Offset(238.2, 367.9),

  '''second floor-Water Operation and Maintainenace Sector, Assistant 
        Undersecretary for Water Operation and Maintainenance  ''':
      const Offset(238.2, 367.9),

  //third floor

  '''third floor-Public Relation and Citizen Optimized  ''':
      const Offset(40.7, 473.4),
  '''third floor-Vice Secretary of Power Station and Distillation plants Sector   ''':
      const Offset(40.7, 473.4),
  '''third floor-Engineering Programs and Environment Department   ''':
      const Offset(87.6, 396.9),
  '''third floor-Vice Secretary of Planning , Trainging & Training Sector   ''':
      const Offset(65.9, 421.0),
  '''third floor-Assistant Undersecretary for Electrical Transmission Network    ''':
      const Offset(65.9, 421.0),
  '''third floor-Assistant Undersecretary for Planning , Training and It sector    ''':
      const Offset(122.3, 370.2),
  '''third floor-Electrical work Department  ''': const Offset(122.3, 370.2),
  '''third floor-Control / Coordintaion and Follow-up  ''':
      const Offset(180.7, 333.4),
  '''third floor-Undersecretary of Power Stations & Water Distillation  ''':
      const Offset(58.4, 489.0),
  '''third floor-Department of Public Relation and Citizen Service  ''':
      const Offset(58.4, 489.0),
  '''third floor-Electrical Power Station Projects / Drawing and Archive Section ''':
      const Offset(133.9, 427.6),
  '''third floor-Ministerial Zone / Undersecretary Office ''':
      const Offset(143.9, 399.4),
  '''third floor-Water Distribution Units Projects / Design Department ''':
      const Offset(104.2, 518.2),
  '''third floor-Underground Cable Section  ''': const Offset(146.4, 480.9),
  '''third floor-Cheif Engineer for Water Distillation Projects ''':
      const Offset(132.3, 543.3),
  '''Construction Division Water Distillation Plants Project ''':
      const Offset(650, 484.8),
  '''third floor-Electrical Power Station Projects / Drawing and Archive Section  ''':
      const Offset(172.1, 501.5),
  '''third floor-Civil work Department of Electrical Power Station Project ''':
      const Offset(175.6, 574.0),
  '''third floor-Construction Division Water Distillation Plants Project ''':
      const Offset(202.8, 574.0),
  '''third floor-Mechanical Works Department ''': const Offset(225.5, 588.1),
  '''third floor-Program Planning and follow-up   ''':
      const Offset(238.0, 557.4),
  '''third floor-Private Sector Projects Department  ''':
      const Offset(238.0, 557.4),
  '''third floor-Electrical works department  ''': const Offset(284.3, 492.5),
  '''third floor-Project Management of Power Station & Distillation Plants Sector  ''':
      const Offset(241.1, 478.4),
  '''third floor-Electrical Work department Instrument and & Control Department  ''':
      const Offset(285.4, 489.0),
  '''third floor-Instrument & Control Department of Electrical Power Station Project ''':
      const Offset(304.5, 487.5),
  '''third floor-Program Planning and Follow up Department  ''':
      const Offset(302.0, 463.3),
  '''third floor-Chief Engineer of Power Station Projects   ''':
      const Offset(336.7, 453.2),
  '''third floor-Undersecretary of Supervision and Control Center   ''':
      const Offset(354.3, 436.6),
  '''third floor-Cheif Engineer Operation and   Maintenance power Station and Distillation Plants  ''':
      const Offset(341.7, 415.0),
  '''third floor-Assistant Undersecretary for Operation and Maintenance ''':
      const Offset(308.5, 395.9),
};

Map<String, Offset> mobilelandScapeOffset = {
  '''basement-Emergency room''': const Offset(392.5, 335.9),

  '''basement-Administrative services department''': const Offset(404.4, 379.9),

  '''basement-Design and Supervision Departmnent''': const Offset(463.6, 315.5),

  '''basement-Communication Department Telephone Maintenance''':
      const Offset(226.9, 326.7),
  '''basement-Personnel Administration Work Division ''':
      const Offset(270.6, 347.4),
  '''basement-Personnel Administration , Archives & Report Division ''':
      const Offset(349.0, 360.2),
  '''basement-Transportation Department ''': const Offset(299.9, 338.4),
  '''basement-Archive Water Distillation Plant Project CE(DP)P ''':
      const Offset(400.1, 379.5),
  '''basement-Administrative Office Prepration Supervision Store  ''':
      const Offset(480.6, 370.2),
  '''basement-Safety and Security Division Health Equipment Store   ''':
      const Offset(480.6, 370.2),
  //second layer
  '''basement-Adminsitrative Office Prepration Supervision ''':
      const Offset(537.3, 311.3),
  '''basement-Distribution Networks Administration Store  ''':
      const Offset(573.9, 303.4),
  '''basement-Meeting Room    ''': const Offset(349.6, 301.3),
  '''basement-Contracts and Tenders Administrative Store ''':
      const Offset(363.9, 303.9),
  '''basement-Electrical and Power Station Department    ''':
      const Offset(396.8, 316.1),
  '''basement-Engineering Drawings Department  ''': const Offset(496.0, 298.1),
  '''basement-Design and supervision department ''': const Offset(461.0, 309.7),
  '''basement-General Offices ''': const Offset(466.8, 266.9),
  '''basement-CMS ''': const Offset(511.2, 269.0),
  '''basement-General Offices ''': const Offset(415.6, 275.9),
  '''basement-Communication Department Telephone Maintenance ''':
      const Offset(443.1, 253.7),
  '''basement-Power Station Project ''': const Offset(379.7, 268.5),
  '''basement-Financial Control Store , Purchases Store ,Accounts Store ,Investment & Projects Store''':
      const Offset(391.9, 255.3),
  '''basement-Passport Control & Passport Supervision ''':
      const Offset(332.7, 246.4),
  '''basement-Automated Center for Current Affairs ''':
      const Offset(322.3, 223.4),
  '''basement-information technology biometric office ''':
      const Offset(365.0, 218.0),
  '''basement-Automated Public Center ''': const Offset(416.7, 199.9),
  '''basement-Prayer Room ''': const Offset(457.7, 220.7),

  //ground
  '''ground-Information Office ''': const Offset(250.3, 317.3),
  '''ground-Purchases and Imports Departments  ''': const Offset(263.3, 278.1),
  '''ground-Monitor Current Expenses ''': const Offset(289.0, 267.7),
  '''ground-Accounts Department ''': const Offset(317.7, 245.2),
  '''ground-Financial and Administrative Affair Sector ''':
      const Offset(339.2, 234.8),
  '''ground-Financial Department ''': const Offset(383.6, 193.5),
  '''ground-Controller for Investment account''': const Offset(333.4, 270.4),
  '''ground-Post Receipt ''': const Offset(353.8, 248.4),
  '''ground-ManPower Planing Department  ''': const Offset(392.5, 358.8),
  '''ground-department of end of services''': const Offset(428.6, 341.0),
  '''ground-Department of End of Services  ''': const Offset(856.2, 478.7),
  '''ground-Increments And Allownces Section ''': const Offset(508.3, 369.9),
  '''ground-Leave and Duties Section ''': const Offset(554.1, 337.1),
  '''ground-Personal Affairs Department ''': const Offset(561.9, 320.5),
  '''ground-Secretary of the Assistant Undersecretary for Administrative Affairs ''':
      const Offset(591.0, 299.7),
  '''ground-Assistant Undersecretary for Administrative Affairs ''':
      const Offset(558.2, 276.8),
  '''ground-Personal Affairs department ''': const Offset(501.0, 333.5),
  '''ground-Safety and Security Control  ''': const Offset(477.1, 358.4),

  //first floor
  '''first floor-Empty ''': const Offset(249.6, 313.9),
  '''first floor-Budgets Department  ''': const Offset(282.4, 270.2),
  '''first floor-Financial Audit Checking Department  ''':
      const Offset(299.5, 260.4),
  '''first floor-Financial Affairs Sector  ''': const Offset(322.3, 235.0),
  '''first floor-Assistant Under Secretary for Financial Affairs  ''':
      const Offset(616.1, 133.0),
  '''first floor-Contracts and Tenders Department ''':
      const Offset(354.3, 251.2),
  '''first floor-Assistant Under Secretary for Financial Affairs office ''':
      const Offset(364.0, 246.1),
  '''first floor-Ministary of Finance   ''': const Offset(333.8, 270.1),
  '''first floor-Automated Center Management ''': const Offset(353.7, 341.5),
  '''first floor-Banking and Scheduling Department''':
      const Offset(315.5, 352.8),
  '''first floor-Distribution Network Managemnet''': const Offset(341.5, 377.8),
  '''first floor-Assistant Under Secretary for Electrical Distribution Network''':
      const Offset(341.5, 377.8),
  '''first floor-Department of Electrical Distribution Network Department  ''':
      const Offset(408.4, 383.9),
  '''first floor-Contract follow up and Maintenance Department  ''':
      const Offset(441.0, 362.0),
  '''first floor-Customer Service ''': const Offset(453.3, 381.4),
  '''first floor-Technical Support Monitor''': const Offset(476.3, 357.4),
  '''first floor-Department of Public Sector Institution & Private Utitlities ''':
      const Offset(448.7, 338.0),
  '''first floor-Collection Follow up Section ''': const Offset(496.2, 339.5),
  '''first floor-Clearence ''': const Offset(506.4, 333.4),
  '''first floor-Server room  ''': const Offset(481.4, 326.7),
  '''first floor-Secretary  ''': const Offset(522.7, 325.2),
  '''first floor-Assistant Under Secretary for Consumer Affairs''':
      const Offset(543.1, 287.9),

  //second floor
  '''second floor-Water projects sector , Design department water networks and water projects''':
      const Offset(253.0, 333.1),
  '''second floor-Water projects Sector , Water Structure Projects Department ''':
      const Offset(300.3, 261.8),

  '''second floor-Office of the Assistant Undersecretary for water projects''':
      const Offset(330.4, 235.1),
  '''second floor-Technical Ofice of an Agent''': const Offset(330.4, 235.1),
  '''second floor-Water Projects Sector , fuel Network Project Management ''':
      const Offset(354.3, 204.0),
  '''second floor-Administrative Services  ''': const Offset(354.3, 204.0),
  '''second floor-Civil Service Bureau ''': const Offset(354.3, 204.0),
  '''second floor-Water Projects Sector - Water Network Project Management ''':
      const Offset(333.1, 284.1),
  '''second floor-Water Projects Sector - Water Structure Projects Department ''':
      const Offset(364.9, 255.2),
  '''second floor-Techinical Services and Main Workshop Sector , Design and Supervision Department ''':
      const Offset(275.3, 343.6),
  '''second floor-Water Operation and Maintainence Sector , Water opertaion and Maintenance Secretariat ''':
      const Offset(413.3, 200.1),
  '''second floor-Technical Services and Main Workshop Sector ,
    Design and Supervision Department , Supervision Division   ''':
      const Offset(283.1, 364.8),

  '''second floor-Technical Services and Main workshop Sector , 
        Design and Supervision Department , Electrical Work Division ''':
      const Offset(313.7, 355.3),
  '''second floor-Technical Services and Main Workshop Sector , 
    Head of Technical Office and Fire Accidents to the assistant Undersecretary   ''':
      const Offset(329.2, 369.8),

  '''second floor-Technical Services and Main WrokShop Sector , Technical 
        office and Fire Accidents to the Assistant UnderSecretary  ''':
      const Offset(329.2, 369.8),
  '''second floor-State Audit Bureau ''': const Offset(355.4, 381.5),
  ////////////////////
  '''second floor-Administrative affairs sector , General Registry Department ''':
      const Offset(407.1, 380.3),
  '''second floor-Financial Controllers Agency  ''': const Offset(466.1, 373.7),

  '''second floor-Planning Training & Information System Sector  - Administrative Devleopment and training Department  ''':
      const Offset(506.7, 356.4),

  '''second floor-Technical Control Department ''': const Offset(452.2, 341.2),

  '''second floor-Planning , training and Information Systems Sector-Director Office Techinical Supervision Department ''':
      const Offset(478.4, 308.0),

  '''second floor-Planing , Training and Information System Sector . Statistics department ''':
      const Offset(519.7, 330.7),

  '''second floor-Planing , Training and Information system Sector , Study and Research Department  ''':
      const Offset(557.9, 281.8),
  '''second floor-Saftey and Security   ''': const Offset(528.2, 254.2),

  '''second floor-Stations sector , secuirty and safety managemnent of stations  ''':
      const Offset(509.1, 247.1),
  '''second floor-Legal Affairs ''': const Offset(474.4, 259.2),

  '''second floor-Techinical Services and Main Workshop Sector-Vice Secretary 
        of Technical Services and main workshop Affair Sector  ''':
      const Offset(452.2, 241.1),

  '''second floor-Technical Service and main workshop Sector , Assistant 
        Undersecretary for Technical Services and main workshop Affairs Sector  ''':
      const Offset(446.2, 224.5),
  '''second floor-Secretary of the agent for water projects  ''':
      const Offset(457.8, 230.5),

  '''second floor-Water Operation and Maintainenace Sector, Assistant 
        Undersecretary for Water Operation and Maintainenance  ''':
      const Offset(479.4, 234.0),

  //third floor

  '''third floor-Public Relation and Citizen Optimized  ''':
      const Offset(243.7, 319.6),
  '''third floor-Vice Secretary of Power Station and Distillation plants Sector   ''':
      const Offset(265.3, 287.4),
  '''third floor-Engineering Programs and Environment Department   ''':
      const Offset(267.4, 267.3),
  '''third floor-Vice Secretary of Planning , Trainging & Training Sector   ''':
      const Offset(267.4, 269.8),
  '''third floor-Assistant Undersecretary for Electrical Transmission Network    ''':
      const Offset(310.1, 240.1),
  '''third floor-Assistant Undersecretary for Planning , Training and It sector    ''':
      const Offset(310.1, 240.1),
  '''third floor-Electrical work Department  ''': const Offset(351.9, 204.3),
  '''third floor-Control / Coordintaion and Follow-up  ''':
      const Offset(351.9, 204.3),
  '''third floor-Undersecretary of Power Stations & Water Distillation  ''':
      const Offset(259.3, 347.3),
  '''third floor-Department of Public Relation and Citizen Service  ''':
      const Offset(291.5, 347.3),
  '''third floor-Electrical Power Station Projects / Drawing and Archive Section ''':
      const Offset(336.3, 282.9),
  '''third floor-Ministerial Zone / Undersecretary Office ''':
      const Offset(354.4, 264.7),
  '''third floor-Water Distribution Units Projects / Design Department ''':
      const Offset(310.1, 368.9),
  '''third floor-Underground Cable Section  ''': const Offset(342.4, 322.1),
  '''third floor-Cheif Engineer for Water Distillation Projects ''':
      const Offset(348.4, 377.0),
  '''Construction Division Water Distillation Plants Project ''':
      const Offset(348.4, 377.0),
  '''third floor-Electrical Power Station Projects / Drawing and Archive Section  ''':
      const Offset(348.4, 377.0),
  '''third floor-Civil work Department of Electrical Power Station Project ''':
      const Offset(348.4, 377.0),
  '''third floor-Construction Division Water Distillation Plants Project ''':
      const Offset(348.4, 377.0),
  '''third floor-Mechanical Works Department ''': const Offset(348.4, 377.0),
  '''third floor-Program Planning and follow-up   ''':
      const Offset(348.4, 377.0),
  '''third floor-Private Sector Projects Department  ''':
      const Offset(457.8, 378.5),
  '''third floor-Electrical works department  ''': const Offset(457.8, 378.5),
  '''third floor-Project Management of Power Station & Distillation Plants Sector  ''':
      const Offset(447.2, 326.2),
  '''third floor-Electrical Work department Instrument and & Control Department  ''':
      const Offset(457.8, 378.5),
  '''third floor-Instrument & Control Department of Electrical Power Station Project ''':
      const Offset(510.1, 336.7),
  '''third floor-Program Planning and Follow up Department  ''':
      const Offset(510.1, 336.7),
  '''third floor-Chief Engineer of Power Station Projects   ''':
      const Offset(544.8, 310.6),
  '''third floor-Undersecretary of Supervision and Control Center   ''':
      const Offset(571.0, 279.9),
  '''third floor-Cheif Engineer Operation and   Maintenance power Station and Distillation Plants  ''':
      const Offset(571.0, 279.9),
  '''third floor-Assistant Undersecretary for Operation and Maintenance ''':
      const Offset(518.7, 252.2),
};
