insert into app_config(app_config_id,config_value,key_desc) values(1,'D:/data/docdata/','保存文档的系统根目录');
insert into app_config(app_config_id,config_value,key_desc) values(2,'D:/data/wwwdata/thumbnail/','缩略图物理跟路径');
insert into app_config(app_config_id,config_value,key_desc) values(3,'D:/data/wwwdata/headimg/','头像根路径');
insert into app_config(app_config_id,config_value,key_desc) values(5,'5','最大评分');
insert into app_config(app_config_id,config_value,key_desc) values(6,'5','上传一个文档给分数');
insert into app_config(app_config_id,config_value,key_desc) values(7,'1','一次评论分数');
insert into app_config(app_config_id,config_value,key_desc) values(8,'D:/OpenOffice.org 3','OfficeHome or libreoffice home');
insert into app_config(app_config_id,config_value,key_desc) values(9,'0','上传文档评审开关 1:yes  0:no');
insert into app_config(app_config_id,config_value,key_desc) values(10,'0','添加评论评审开关 1:yes  0:no');
insert into app_config(app_config_id,config_value,key_desc) values(11,'0','创建知道评审开关 1:yes  0:no');
insert into app_config(app_config_id,config_value,key_desc) values(12,'0','回答知道评审开关 1:yes  0:no');
insert into app_config(app_config_id,config_value,key_desc) values(13,'D:/ffmpeg','时视频转换工具 home');

insert into topic (topic_name,topic_desc,topic_img_path) values('CC','专题分享--CC','topicsimg/1.png');
insert into topic (topic_name,topic_desc,topic_img_path) values('迈腾','专题分享--迈腾','topicsimg/2.png');
insert into topic (topic_name,topic_desc,topic_img_path) values('GTI','专题分享--GTI','topicsimg/3.png');
insert into topic (topic_name,topic_desc,topic_img_path) values('高尔夫','专题分享--高尔夫','topicsimg/4.png');
insert into topic (topic_name,topic_desc,topic_img_path) values('全新速腾','专题分享--全新速腾','topicsimg/5.png');
insert into topic (topic_name,topic_desc,topic_img_path) values('全新宝来','专题分享--全新宝来','topicsimg/6.png');
insert into topic (topic_name,topic_desc,topic_img_path) values('全新捷达','专题分享--全新捷达','topicsimg/7.png');
insert into topic (topic_name,topic_desc,topic_img_path) values('通用','专题分享--通用','topicsimg/2.png');

insert into app_user(login_name,account_status,password,realname,user_root_path,admin_flag) values('admin',1,'				9','管理员','1/',1);
insert into app_user(login_name,account_status,password,realname,user_root_path,admin_flag) values('commissioner',1,'				9','转员','2/',1);
insert into app_user(login_name,account_status,password,sale_code,realname,user_root_path,admin_flag) values('dealer',1,'				9','SA001','经销商','3/',2);
insert into app_user(login_name,account_status,password,sale_code,realname,user_root_path,admin_flag) values('wayne',1,'				9','SA001','孙伟','4/',2);

insert into dict(dict_id,dict_key,dict_value,key_desc) values(1,1,'行业知识','文档分类');
insert into dict(dict_id,dict_key,dict_value,key_desc) values(1,2,'品牌知识','文档分类');
insert into dict(dict_id,dict_key,dict_value,key_desc) values(1,3,'竞品相关','文档分类');
insert into dict(dict_id,dict_key,dict_value,key_desc) values(1,4,'疑难问题','文档分类');

insert into dict(dict_id,dict_key,dict_value,key_desc) values(2,1,'电脑类','知道分类-电脑类');
insert into dict(dict_id,dict_key,dict_value,key_desc) values(2,2,'汽车类','知道分类-汽车类');
insert into dict(dict_id,dict_key,dict_value,key_desc) values(2,3,'生活类','知道分类-生活类');

insert into dict(dict_id,dict_key,dict_value,key_desc) values(3,1,'大众课堂 ','文档来源');
insert into dict(dict_id,dict_key,dict_value,key_desc) values(3,2,'他人共享','文档来源');