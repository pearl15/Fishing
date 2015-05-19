 alter table fishing4.dbo.ADDRESS 
        drop FK_dq9pplwdj444woowv2vfjh4k8;

    alter table fishing4.dbo.ORDER_DETAIL 
        drop FK_g7684olhda6kidi072aw51mhi;

    alter table fishing4.dbo.ORDER_DETAIL 
        drop FK_t7ajqtv9m4h5frcpyddnrlhic;

    alter table fishing4.dbo.ORDER_DETAIL 
        drop  FK_4vc00e4wflxguoluvgoermt4k;

    alter table fishing4.dbo.ORDER_PRODUCT 
        drop FK_ld6cnr5h1q1sl97pg572bixhu;

    alter table fishing4.dbo.ORDER_PRODUCT 
        drop FK_4nsxta166qmi0u7v02p6gtnxa;

    alter table fishing4.dbo.PAYMENT 
        drop FK_jdgfqlnyvnr58ec37cbeyki2o;

    alter table fishing4.dbo.RATING 
        drop FK_8fwysr71n8y9wvp91srveyh0o;

    alter table fishing4.dbo.RATING 
        drop FK_bpa0bodql43jldy4j4sdpheaj;

    alter table fishing4.dbo.USER_ROLE 
        drop FK_j2j8kpywaghe8i36swcxv8784;

		IF OBJECT_ID('dbo.ADDRESS', 'U') IS NOT NULL
	  DROP TABLE dbo.ADDRESS; 

		IF OBJECT_ID('dbo.BLOG', 'U') IS NOT NULL
	  DROP TABLE dbo.BLOG; 
	  
	  IF OBJECT_ID('dbo.ORDER_ADDRESS', 'U') IS NOT NULL
	  DROP TABLE dbo.ORDER_ADDRESS; 
	  
	  IF OBJECT_ID('dbo.ORDER_DETAIL', 'U') IS NOT NULL
	  DROP TABLE dbo.ORDER_DETAIL; 
	  
	  IF OBJECT_ID('dbo.ORDER_PAYMENT', 'U') IS NOT NULL
	  DROP TABLE dbo.ORDER_PAYMENT; 
	  
	  IF OBJECT_ID('dbo.ORDER_PRODUCT', 'U') IS NOT NULL
	  DROP TABLE dbo.ORDER_PRODUCT; 

	  IF OBJECT_ID('dbo.PAYMENT', 'U') IS NOT NULL
	  DROP TABLE dbo.PAYMENT; 
	  
	  IF OBJECT_ID('dbo.PRODUCT', 'U') IS NOT NULL
	  DROP TABLE dbo.PRODUCT; 
	  
	  IF OBJECT_ID('dbo.RATING', 'U') IS NOT NULL
	  DROP TABLE dbo.RATING; 
	  
	  IF OBJECT_ID('dbo.USER', 'U') IS NOT NULL
	  DROP TABLE dbo.[USER]; 
	  
	  IF OBJECT_ID('dbo.USER_ROLE', 'U') IS NOT NULL
	  DROP TABLE dbo.USER_ROLE; 
	  

    create table fishing4.dbo.ADDRESS (
        ADDRESS_ID integer not null identity,
        ADDRESS1 varchar(255),
        ADDRESS2 varchar(255),
        CITY varchar(255),
        COUNTRY varchar(255),
        FIRST_NAME varchar(255),
        LAST_NAME varchar(255),
        STATE varchar(255),
        ZIP varchar(255),
        USER_ID integer not null,
        primary key (ADDRESS_ID)
    );

    create table fishing4.dbo.BLOG (
        BLOG_ID integer not null identity,
        AUTHOR varchar(255),
        CONTENT text,
        INSERT_DATE datetime,
        TITLE varchar(255),
        primary key (BLOG_ID)
    );

    create table fishing4.dbo.ORDER_ADDRESS (
        ADDRESS_ID integer not null identity,
        ADDRESS1 varchar(255),
        ADDRESS2 varchar(255),
        CITY varchar(255),
        COUNTRY varchar(255),
        FIRST_NAME varchar(255),
        LAST_NAME varchar(255),
        STATE varchar(255),
        ZIP varchar(255),
        primary key (ADDRESS_ID)
    );

    create table fishing4.dbo.ORDER_DETAIL (
        ORDER_ID integer not null identity,
        SHIPPING_STATUS varchar(255),
        TOTAL_PRICE double precision,
        ADDRESS_ID integer,
        PAYMENT_ID integer,
        USER_ID integer,
        primary key (ORDER_ID)
    );

    create table fishing4.dbo.ORDER_PAYMENT (
        PAYMENT_ID integer not null identity,
        CARD_HOLDER varchar(255),
        CARD_NUMBER integer,
        EXP_MONTH integer,
        EXP_YEAR integer,
        primary key (PAYMENT_ID)
    );

    create table fishing4.dbo.ORDER_PRODUCT (
        ORDER_PRODUCT_ID integer not null identity,
        QUATITY integer,
        PRODUCT_ID integer,
        ORDER_ID integer not null,
        primary key (ORDER_PRODUCT_ID)
    );

    create table fishing4.dbo.PAYMENT (
        PAYMENT_ID integer not null identity,
        CARD_HOLDER varchar(255),
        CARD_NUMBER integer,
        EXP_MONTH integer,
        EXP_YEAR integer,
        USER_ID integer not null,
        primary key (PAYMENT_ID)
    );

    create table fishing4.dbo.PRODUCT (
        PRODUCT_ID integer not null,
        DETAIL varchar(5000),
        NAME varchar(255),
        PRICE double precision,
        primary key (PRODUCT_ID)
    );

    create table fishing4.dbo.RATING (
        RATING_ID integer not null identity,
        COMMENT varchar(255),
        RATING_SCORE double precision,
        USER_ID integer,
        PRODUCT_ID integer,
        primary key (RATING_ID)
    );

    create table fishing4.dbo.[USER] (
        USER_ID integer not null identity,
        EMAIL varchar(255),
        ENABLED TINYINT,
        FIRST_NAME varchar(255),
        LAST_NAME varchar(255),
        PASSWORD varchar(255),
        primary key (USER_ID)
    );

    create table fishing4.dbo.USER_ROLE (
        USER_ROLE_ID integer not null identity,
        ROLE varchar(255),
        USER_ID integer not null,
        primary key (USER_ROLE_ID)
    );

    alter table fishing4.dbo.ORDER_PRODUCT 
        add constraint UK_hv3w5bqxixlskf6rgr5w4r0sg unique (ORDER_ID, PRODUCT_ID);

    alter table fishing4.dbo.[USER] 
        add constraint UK_ejfk3g58oxsgbb4ju3u4fhivk unique (EMAIL);

    alter table fishing4.dbo.ADDRESS 
        add constraint FK_dq9pplwdj444woowv2vfjh4k8 
        foreign key (USER_ID) 
        references fishing4.dbo.[USER] (USER_ID);

	CREATE INDEX AK_ADDRESS_USER_ID
		ON fishing4.dbo.ADDRESS (USER_ID);


    alter table fishing4.dbo.ORDER_DETAIL 
        add constraint FK_g7684olhda6kidi072aw51mhi 
        foreign key (ADDRESS_ID) 
        references fishing4.dbo.ORDER_ADDRESS (ADDRESS_ID);
        
        CREATE INDEX AK_ADDRESS_ADDRESS_ID
		ON fishing4.dbo.ORDER_DETAIL (ADDRESS_ID);

    alter table fishing4.dbo.ORDER_DETAIL 
        --add index FK_t7ajqtv9m4h5frcpyddnrlhic (PAYMENT_ID), 
        add constraint FK_t7ajqtv9m4h5frcpyddnrlhic 
        foreign key (PAYMENT_ID) 
        references fishing4.dbo.ORDER_PAYMENT (PAYMENT_ID);

	CREATE INDEX AK_ORDER_DETAIL_PAYMENT_ID
		ON fishing4.dbo.ORDER_DETAIL (PAYMENT_ID);

    alter table fishing4.dbo.ORDER_DETAIL 
        --add index FK_4vc00e4wflxguoluvgoermt4k (USER_ID), 
        add constraint FK_4vc00e4wflxguoluvgoermt4k 
        foreign key (USER_ID) 
        references fishing4.dbo.[USER] (USER_ID);
	
	CREATE INDEX AK_ORDER_DETAIL_USER_ID
		ON fishing4.dbo.ORDER_DETAIL (USER_ID);

    alter table fishing4.dbo.ORDER_PRODUCT 
        --add index FK_ld6cnr5h1q1sl97pg572bixhu (PRODUCT_ID), 
        add constraint FK_ld6cnr5h1q1sl97pg572bixhu 
        foreign key (PRODUCT_ID) 
        references fishing4.dbo.PRODUCT (PRODUCT_ID);

	CREATE INDEX AK_ORDER_PRODUCT_PRODUCT_ID
		ON fishing4.dbo.ORDER_PRODUCT (PRODUCT_ID);

    alter table fishing4.dbo.ORDER_PRODUCT 
        --add index FK_4nsxta166qmi0u7v02p6gtnxa (ORDER_ID), 
        add constraint FK_4nsxta166qmi0u7v02p6gtnxa 
        foreign key (ORDER_ID) 
        references fishing4.dbo.ORDER_DETAIL (ORDER_ID);
        
	CREATE INDEX AK_ORDER_PRODUCT_ORDER_ID
		ON fishing4.dbo.ORDER_PRODUCT (ORDER_ID);


    alter table fishing4.dbo.PAYMENT 
        --add index FK_jdgfqlnyvnr58ec37cbeyki2o (USER_ID), 
        add constraint FK_jdgfqlnyvnr58ec37cbeyki2o 
        foreign key (USER_ID) 
        references fishing4.dbo.[USER] (USER_ID);

	CREATE INDEX AK_PAYMENT_USER_ID
		ON fishing4.dbo.PAYMENT (USER_ID);

    alter table fishing4.dbo.RATING 
        --add index FK_8fwysr71n8y9wvp91srveyh0o (USER_ID), 
        add constraint FK_8fwysr71n8y9wvp91srveyh0o 
        foreign key (USER_ID) 
        references fishing4.dbo.[USER] (USER_ID);

CREATE INDEX AK_RATING_USER_ID
		ON fishing4.dbo.RATING (USER_ID);

    alter table fishing4.dbo.RATING 
        --add index FK_bpa0bodql43jldy4j4sdpheaj (PRODUCT_ID), 
        add constraint FK_bpa0bodql43jldy4j4sdpheaj 
        foreign key (PRODUCT_ID) 
        references fishing4.dbo.PRODUCT (PRODUCT_ID);

CREATE INDEX AK_RATING_PRODUCT_ID
		ON fishing4.dbo.RATING (PRODUCT_ID);

    alter table fishing4.dbo.USER_ROLE 
       -- add index FK_j2j8kpywaghe8i36swcxv8784 (USER_ID), 
        add constraint FK_j2j8kpywaghe8i36swcxv8784 
        foreign key (USER_ID) 
        references fishing4.dbo.[USER] (USER_ID);
        
        
CREATE INDEX AK_USER_ROLE_USER_ID
		ON fishing4.dbo.USER_ROLE (USER_ID);
