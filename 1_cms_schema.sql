/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2013-04-24 19:11:42                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('doc_comment') and o.name = 'FK_DOC_COMM_REFERENCE_APP_USER')
alter table doc_comment
   drop constraint FK_DOC_COMM_REFERENCE_APP_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('doc_comment') and o.name = 'FK_DOC_COMM_REFERENCE_DOCUMENT')
alter table doc_comment
   drop constraint FK_DOC_COMM_REFERENCE_DOCUMENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('document') and o.name = 'FK_DOCUMENT_REFERENCE_TOPIC')
alter table document
   drop constraint FK_DOCUMENT_REFERENCE_TOPIC
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('document_score') and o.name = 'FK_DOCUMENT_REFERENCE_APP_USER')
alter table document_score
   drop constraint FK_DOCUMENT_REFERENCE_APP_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('document_score') and o.name = 'FK_DOCUMENT_REFERENCE_DOCUMENT')
alter table document_score
   drop constraint FK_DOCUMENT_REFERENCE_DOCUMENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('files') and o.name = 'FK_FILES_REFERENCE_DOCUMENT')
alter table files
   drop constraint FK_FILES_REFERENCE_DOCUMENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('knowledge_reply') and o.name = 'FK_KNOWLEDG_REFERENCE_KNOWLEDG')
alter table knowledge_reply
   drop constraint FK_KNOWLEDG_REFERENCE_KNOWLEDG
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('knowledge_reply') and o.name = 'FK_KNOWLEDG_REFERENCE_APP_USER')
alter table knowledge_reply
   drop constraint FK_KNOWLEDG_REFERENCE_APP_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('point_detail') and o.name = 'FK_POINT_DE_REFERENCE_APP_USER')
alter table point_detail
   drop constraint FK_POINT_DE_REFERENCE_APP_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('recommend_document') and o.name = 'FK_RECOMMEN_REFERENCE_DOCUMENT')
alter table recommend_document
   drop constraint FK_RECOMMEN_REFERENCE_DOCUMENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('relation_document') and o.name = 'FK_RELATION_REFERENCE_DOCUMENT')
alter table relation_document
   drop constraint FK_RELATION_REFERENCE_DOCUMENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('relation_document') and o.name = 'FK_RELATION_REFERENCE_APP_USER')
alter table relation_document
   drop constraint FK_RELATION_REFERENCE_APP_USER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('app_config')
            and   type = 'U')
   drop table app_config
go

if exists (select 1
            from  sysobjects
           where  id = object_id('app_user')
            and   type = 'U')
   drop table app_user
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dict')
            and   type = 'U')
   drop table dict
go

if exists (select 1
            from  sysobjects
           where  id = object_id('doc_comment')
            and   type = 'U')
   drop table doc_comment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('document')
            and   type = 'U')
   drop table document
go

if exists (select 1
            from  sysobjects
           where  id = object_id('document_score')
            and   type = 'U')
   drop table document_score
go

if exists (select 1
            from  sysobjects
           where  id = object_id('files')
            and   type = 'U')
   drop table files
go

if exists (select 1
            from  sysobjects
           where  id = object_id('knowledge')
            and   type = 'U')
   drop table knowledge
go

if exists (select 1
            from  sysobjects
           where  id = object_id('knowledge_reply')
            and   type = 'U')
   drop table knowledge_reply
go

if exists (select 1
            from  sysobjects
           where  id = object_id('point_detail')
            and   type = 'U')
   drop table point_detail
go

if exists (select 1
            from  sysobjects
           where  id = object_id('recommend_document')
            and   type = 'U')
   drop table recommend_document
go

if exists (select 1
            from  sysobjects
           where  id = object_id('relation_document')
            and   type = 'U')
   drop table relation_document
go

if exists (select 1
            from  sysobjects
           where  id = object_id('topic')
            and   type = 'U')
   drop table topic
go

/*==============================================================*/
/* Table: app_config                                            */
/*==============================================================*/
create table app_config (
   app_config_id        int                  not null,
   config_value         nvarchar(200)        not null,
   key_desc             nvarchar(200)        null,
   update_by            int                  null,
   update_date          datetime             null default current_timestamp,
   constraint PK_APP_CONFIG primary key (app_config_id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('app_config') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'app_config' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '系统配置参数
   
   保存文档系统根文件夹 /opt/docdata/
   apache缩略图物理跟路径	/opt/wwwdata/thumbnail/
   apache 头像根路径 /opt/wwwdata/headimg/
   是否需要审核 1
   最大评分 5
   上传最大分数 5
   评论分数 1
   ', 
   'user', @CurrentUser, 'table', 'app_config'
go

/*==============================================================*/
/* Table: app_user                                              */
/*==============================================================*/
create table app_user (
   app_user_id          int                  identity,
   crm_user_id          uniqueidentifier     null,
   sale_code            varchar(20)          null,
   login_name           varchar(50)          not null,
   password             varchar(100)         not null,
   point                int                  null default 0,
   user_root_path       varchar(100)         null,
   space_limit          int                  null,
   head_img_url         varchar(100)         null,
   account_status       int                  not null default 1,
   nickname             varchar(50)          null,
   gender               int                  null,
   realname             varchar(50)          null,
   mobile               varchar(20)          null,
   id_card              varchar(18)          null,
   email                varchar(100)         null,
   company_id           uniqueidentifier     null,
   company_name         varchar(100)         null,
   position             varchar(100)         null,
   experience_years     int                  null,
   introduction         text                 null,
   open_contact         int                  null default 0,
   admin_flag           int                  null default 2,
   create_by            int                  null,
   create_date          datetime             null default CURRENT_TIMESTAMP,
   constraint PK_APP_USER primary key nonclustered (app_user_id),
   constraint AK_LOGIN_NAME_UNI_KEY_APP_USER unique (sale_code, login_name)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('app_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'password')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'app_user', 'column', 'password'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'sha1 加密',
   'user', @CurrentUser, 'table', 'app_user', 'column', 'password'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('app_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'user_root_path')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'app_user', 'column', 'user_root_path'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '相对于保存文档的系统根目录的路径  default: user_id
   real_path=保存文档的系统根目录的+用户文档存放相对路径
   example :
    1/',
   'user', @CurrentUser, 'table', 'app_user', 'column', 'user_root_path'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('app_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'head_img_url')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'app_user', 'column', 'head_img_url'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '保存ur 存在apache下
   real_path=头像根路径+用户id+头像+头像扩展名
   real_path=E:/roiland/cms/data/wwwdata/headimg/+1.png
   head_img_url=/headimg/1.png',
   'user', @CurrentUser, 'table', 'app_user', 'column', 'head_img_url'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('app_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'account_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'app_user', 'column', 'account_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:正常
   2:冻结,
   3:待审批',
   'user', @CurrentUser, 'table', 'app_user', 'column', 'account_status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('app_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'gender')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'app_user', 'column', 'gender'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:男
   2:女
   ',
   'user', @CurrentUser, 'table', 'app_user', 'column', 'gender'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('app_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'open_contact')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'app_user', 'column', 'open_contact'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:yes
   1:no',
   'user', @CurrentUser, 'table', 'app_user', 'column', 'open_contact'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('app_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'admin_flag')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'app_user', 'column', 'admin_flag'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:yes
   2:no',
   'user', @CurrentUser, 'table', 'app_user', 'column', 'admin_flag'
go

/*==============================================================*/
/* Table: dict                                                  */
/*==============================================================*/
create table dict (
   dict_id              int                  not null,
   dict_key             int                  not null,
   dict_value           varchar(50)          not null,
   key_desc             varchar(50)          null,
   status               int                  null default 1,
   parent_dict_id       int                  null,
   parent_key_id        int                  null,
   constraint PK_DICT primary key nonclustered (dict_id, dict_key)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'dict', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:正常
   2:作废',
   'user', @CurrentUser, 'table', 'dict', 'column', 'status'
go

/*==============================================================*/
/* Table: doc_comment                                           */
/*==============================================================*/
create table doc_comment (
   doc_comment_id       int                  identity,
   app_user_id          int                  null,
   document_id          varchar(8)           not null,
   comment_content      text                 not null,
   comment_status       int                  not null,
   comment_datetime     datetime             null default CURRENT_TIMESTAMP,
   constraint PK_DOC_COMMENT primary key nonclustered (doc_comment_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('doc_comment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'comment_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'doc_comment', 'column', 'comment_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:正常
   2:待审查
   3:未通过审查,
   4:删除
   ',
   'user', @CurrentUser, 'table', 'doc_comment', 'column', 'comment_status'
go

/*==============================================================*/
/* Table: document                                              */
/*==============================================================*/
create table document (
   document_id          varchar(8)           not null,
   document_name        varchar(50)          null,
   title                varchar(100)         null,
   about                varchar(200)         null,
   keyword              varchar(100)         null,
   document_type        varchar(4)           not null,
   document_catalog     int                  null,
   document_origin      int                  null,
   topic_id             int                  null,
   store_path           varchar(200)         null,
   cover_store_url      varchar(200)         null,
   document_size        numeric              null default 0,
   document_md5         varchar(32)          null,
   pages                int                  null default 0,
   avg_score            float(4)             null default 0,
   browse_times         int                  null default 0,
   download_times       int                  null default 0,
   collection_times     int                  null default 0,
   comment_times        int                  null default 0,
   recommend_times      int                  null default 0,
   not_recommend_times  int                  null default 0,
   view_level           int                  null default 1,
   view_cost            int                  null default 0,
   document_status      int                  not null,
   upload_app_user_id   int                  not null,
   upload_datetime      datetime             not null default CURRENT_TIMESTAMP,
   update_app_user_id   int                  null,
   update_datetime      datetime             null,
   constraint PK_DOCUMENT primary key nonclustered (document_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'document_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'document_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '手动生成8位id
   UUIDUtils->buildID()',
   'user', @CurrentUser, 'table', 'document', 'column', 'document_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'document_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'document_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '保存上传时使用的原始文件名',
   'user', @CurrentUser, 'table', 'document', 'column', 'document_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'document_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'document_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MS Office文档	doc,docx   ppt,pptx   xls,xlsx   vsd   pot   pps   rtf
   WPS office系列	wps   et   dps
   PDF	pdf
   纯文本	txt
   EPUB	epub
   img  1:n
   保存扩展名',
   'user', @CurrentUser, 'table', 'document', 'column', 'document_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'document_catalog')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'document_catalog'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dict_id=1  && dict_key
   设置分类id',
   'user', @CurrentUser, 'table', 'document', 'column', 'document_catalog'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'document_origin')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'document_origin'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:厂家下发 
   2:经销商上传',
   'user', @CurrentUser, 'table', 'document', 'column', 'document_origin'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'store_path')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'store_path'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '存放相对路径名=上传人的相对路径+文件名
   real_path=保存文档的系统根目录的+用户文档存放相对路径+存放相对路径名
   e.g.
   1. /opt/files/<relative_path>
   2. https://aws.amazon.com/s3/bucket/eastern/<relative_path>
   real_path=E:/roiland/cms/data/docdata/+1/+zrIVosCg.doc
   store_path=zrIVosCg.doc',
   'user', @CurrentUser, 'table', 'document', 'column', 'store_path'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'cover_store_url')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'cover_store_url'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'real_path=缩略图物理跟路径+用户文档存放相对路径+文档封面名
   real_path=E:/roiland/cms/data/wwwdata/thumbnail/+1/+zrIVosCg.png
   
   真正存在apache下
   cover_store_url=/thumbnail/1/文档id.png',
   'user', @CurrentUser, 'table', 'document', 'column', 'cover_store_url'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'view_level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'view_level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:公开
   2:私人',
   'user', @CurrentUser, 'table', 'document', 'column', 'view_level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'document_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'document', 'column', 'document_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:上传中
   2处理中
   3:正常
   4:待审查
   5:未通过审查,
   6:删除',
   'user', @CurrentUser, 'table', 'document', 'column', 'document_status'
go

/*==============================================================*/
/* Table: document_score                                        */
/*==============================================================*/
create table document_score (
   document_score_id    int                  identity,
   app_user_id          int                  null,
   document_id          varchar(8)           not null,
   score                int                  not null default 0,
   create_time          datetime             null default CURRENT_TIMESTAMP,
   constraint PK_DOCUMENT_SCORE primary key nonclustered (document_score_id)
)
go

/*==============================================================*/
/* Table: files                                                 */
/*==============================================================*/
create table files (
   files_id             int                  identity,
   document_id          varchar(8)           null,
   file_name            varchar(200)         not null,
   file_size            numeric              null,
   upload_app_user_id   int                  null,
   upload_datetime      datetime             null default CURRENT_TIMESTAMP,
   show_order           int                  null,
   constraint PK_FILES primary key nonclustered (files_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('files')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'files', 'column', 'file_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '只存放原始文件名',
   'user', @CurrentUser, 'table', 'files', 'column', 'file_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('files')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_size')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'files', 'column', 'file_size'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '字节',
   'user', @CurrentUser, 'table', 'files', 'column', 'file_size'
go

/*==============================================================*/
/* Table: knowledge                                             */
/*==============================================================*/
create table knowledge (
   knowledge_id         int                  identity,
   knowledge_catalog    int                  null,
   content              text                 not null,
   score                int                  null default 0,
   reply_times          int                  null default 0,
   status               int                  not null default 1,
   create_appuser_id    int                  null,
   create_date          datetime             null default CURRENT_TIMESTAMP,
   update_appuser_id    int                  null,
   update_date          datetime             null,
   constraint PK_KNOWLEDGE primary key nonclustered (knowledge_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('knowledge')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'knowledge', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:正常
   2:待审查
   3:未通过审查
   4:删除:关闭
   ',
   'user', @CurrentUser, 'table', 'knowledge', 'column', 'status'
go

/*==============================================================*/
/* Table: knowledge_reply                                       */
/*==============================================================*/
create table knowledge_reply (
   knowledge_reply_id   int                  identity,
   knowledge_id         int                  null,
   content              text                 not null,
   score                int                  null default 0,
   reply_appuser_id     int                  null,
   reply_date           datetime             null default CURRENT_TIMESTAMP,
   status               int                  null,
   constraint PK_KNOWLEDGE_REPLY primary key nonclustered (knowledge_reply_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('knowledge_reply')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'knowledge_reply', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:正常
   2:待审查
   3:未通过审查
   4:删除',
   'user', @CurrentUser, 'table', 'knowledge_reply', 'column', 'status'
go

/*==============================================================*/
/* Table: point_detail                                          */
/*==============================================================*/
create table point_detail (
   point_detail_id      int                  identity,
   app_user_id          int                  not null,
   point_type           int                  not null,
   point_releation_id   varchar(10)          null,
   point                int                  not null,
   create_date          datetime             null default CURRENT_TIMESTAMP,
   constraint PK_POINT_DETAIL primary key nonclustered (point_detail_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('point_detail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'point_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'point_detail', 'column', 'point_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:上传文档
   2:评论',
   'user', @CurrentUser, 'table', 'point_detail', 'column', 'point_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('point_detail')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'point_releation_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'point_detail', 'column', 'point_releation_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '评论或者上传文档设置文档id',
   'user', @CurrentUser, 'table', 'point_detail', 'column', 'point_releation_id'
go

/*==============================================================*/
/* Table: recommend_document                                    */
/*==============================================================*/
create table recommend_document (
   recommend_document_id int                  identity,
   document_id          varchar(8)           not null,
   cover_store_path     varchar(200)         null,
   recommend_desc       varchar(200)         null,
   status               int                  not null default 0,
   create_by            int                  null,
   create_date          datetime             null default CURRENT_TIMESTAMP,
   constraint PK_RECOMMEND_DOCUMENT primary key nonclustered (recommend_document_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('recommend_document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'cover_store_path')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'recommend_document', 'column', 'cover_store_path'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '可以与文档封面想同,或者不一样',
   'user', @CurrentUser, 'table', 'recommend_document', 'column', 'cover_store_path'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('recommend_document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'recommend_document', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '0:正常
   1:作废
   2:临时',
   'user', @CurrentUser, 'table', 'recommend_document', 'column', 'status'
go

/*==============================================================*/
/* Table: relation_document                                     */
/*==============================================================*/
create table relation_document (
   relation_document_id int                  identity,
   document_id          varchar(8)           not null,
   app_user_id          int                  null,
   relation_type        int                  not null,
   status               int                  not null default 1,
   create_date          datetime             not null default CURRENT_TIMESTAMP,
   constraint PK_RELATION_DOCUMENT primary key nonclustered (relation_document_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('relation_document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'relation_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'relation_document', 'column', 'relation_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:上传
   2:下载//可以下载多次
   3:,收藏
   4:,浏览(可以多次)
   5:推荐
   6:不推荐
   7:举报',
   'user', @CurrentUser, 'table', 'relation_document', 'column', 'relation_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('relation_document')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'relation_document', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:正常
   2:删除
   
   只有收藏和下载可以删除,其他不可以删除
   收藏数和下载数不做减1处理',
   'user', @CurrentUser, 'table', 'relation_document', 'column', 'status'
go

/*==============================================================*/
/* Table: topic                                                 */
/*==============================================================*/
create table topic (
   topic_id             int                  identity,
   topic_name           varchar(100)         not null,
   topic_desc           varchar(200)         null,
   topic_img_path       varchar(100)         null,
   topic_status         int                  not null default 1,
   create_by            int                  null,
   create_date          datetime             null default CURRENT_TIMESTAMP,
   constraint PK_TOPIC primary key nonclustered (topic_id)
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('topic')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'topic_status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'topic', 'column', 'topic_status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '1:正常
   2:删除',
   'user', @CurrentUser, 'table', 'topic', 'column', 'topic_status'
go

alter table doc_comment
   add constraint FK_DOC_COMM_REFERENCE_APP_USER foreign key (app_user_id)
      references app_user (app_user_id)
go

alter table doc_comment
   add constraint FK_DOC_COMM_REFERENCE_DOCUMENT foreign key (document_id)
      references document (document_id)
go

alter table document
   add constraint FK_DOCUMENT_REFERENCE_TOPIC foreign key (topic_id)
      references topic (topic_id)
go

alter table document_score
   add constraint FK_DOCUMENT_REFERENCE_APP_USER foreign key (app_user_id)
      references app_user (app_user_id)
go

alter table document_score
   add constraint FK_DOCUMENT_REFERENCE_DOCUMENT foreign key (document_id)
      references document (document_id)
go

alter table files
   add constraint FK_FILES_REFERENCE_DOCUMENT foreign key (document_id)
      references document (document_id)
go

alter table knowledge_reply
   add constraint FK_KNOWLEDG_REFERENCE_KNOWLEDG foreign key (knowledge_id)
      references knowledge (knowledge_id)
go

alter table knowledge_reply
   add constraint FK_KNOWLEDG_REFERENCE_APP_USER foreign key (reply_appuser_id)
      references app_user (app_user_id)
go

alter table point_detail
   add constraint FK_POINT_DE_REFERENCE_APP_USER foreign key (app_user_id)
      references app_user (app_user_id)
go

alter table recommend_document
   add constraint FK_RECOMMEN_REFERENCE_DOCUMENT foreign key (document_id)
      references document (document_id)
go

alter table relation_document
   add constraint FK_RELATION_REFERENCE_DOCUMENT foreign key (document_id)
      references document (document_id)
go

alter table relation_document
   add constraint FK_RELATION_REFERENCE_APP_USER foreign key (app_user_id)
      references app_user (app_user_id)
go

