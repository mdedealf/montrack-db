create table onboarding
(
    title       varchar(150) not null,
    description varchar(255) not null,
    image_url   varchar(255) not null,
    created_at  timestamp default CURRENT_TIMESTAMP,
    updated_at  timestamp default CURRENT_TIMESTAMP,
    deleted_at  timestamp default CURRENT_TIMESTAMP
);

alter table onboarding
    owner to postgres;

create table users
(
    user_id                 serial
        primary key,
    full_name               varchar(150) not null,
    email                   varchar(255) not null
        unique,
    password_hash           varchar(255) not null,
    profile_picture         varchar(255),
    pin                     varchar(4)   not null,
    is_onboarding_completed boolean   default false,
    created_at              timestamp default CURRENT_TIMESTAMP,
    updated_at              timestamp default CURRENT_TIMESTAMP,
    deleted_at              timestamp default CURRENT_TIMESTAMP
);

alter table users
    owner to postgres;

create table social_providers
(
    provider_id      serial
        primary key,
    user_id          integer      not null
        references users
            on delete cascade,
    provider_name    varchar(100) not null
        unique
        constraint social_providers_provider_name_check
            check ((provider_name)::text = ANY
                   ((ARRAY ['google'::character varying, 'facebook'::character varying, 'instagram'::character varying])::text[])),
    provider_user_id varchar(255) not null,
    created_at       timestamp default CURRENT_TIMESTAMP,
    updated_at       timestamp default CURRENT_TIMESTAMP,
    deleted_at       timestamp default CURRENT_TIMESTAMP
);

alter table social_providers
    owner to postgres;

create table currency
(
    currency_id serial
        primary key,
    name        varchar(100) not null,
    code        varchar(10)  not null,
    created_at  timestamp default CURRENT_TIMESTAMP,
    updated_at  timestamp default CURRENT_TIMESTAMP,
    deleted_at  timestamp default CURRENT_TIMESTAMP
);

alter table currency
    owner to postgres;

create table wallets
(
    wallet_id   serial
        primary key,
    user_id     integer        not null
        references users
            on delete cascade,
    name        varchar(100)   not null,
    amount      numeric(15, 2) not null,
    currency_id integer        not null
        references currency,
    isactive    boolean   default false,
    created_at  timestamp default CURRENT_TIMESTAMP,
    updated_at  timestamp default CURRENT_TIMESTAMP,
    deleted_at  timestamp default CURRENT_TIMESTAMP
);

alter table wallets
    owner to postgres;

create table emojis
(
    emoji_id   serial
        primary key,
    emoji_code varchar(20) not null,
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP,
    deleted_at timestamp default CURRENT_TIMESTAMP
);

alter table emojis
    owner to postgres;

create table pockets
(
    pocket_id      serial
        primary key,
    wallet_id      integer        not null
        references wallets,
    emoji_id       integer        not null
        references emojis
            on delete cascade,
    name           varchar(100)   not null,
    description    varchar(150),
    total_amount   numeric(15, 2) not null,
    current_amount numeric(15, 2) not null,
    emoji_code     varchar(20),
    created_at     timestamp default CURRENT_TIMESTAMP,
    updated_at     timestamp default CURRENT_TIMESTAMP,
    deleted_at     timestamp default CURRENT_TIMESTAMP
);

alter table pockets
    owner to postgres;

create table goals
(
    goal_id         serial
        primary key,
    wallet_id       integer        not null
        references wallets
            on delete cascade,
    name            varchar(100)   not null,
    target_amount   numeric(15, 2) not null,
    current_amount  numeric(15, 2) not null,
    description     varchar(150),
    file_attachment varchar(255),
    created_at      timestamp default CURRENT_TIMESTAMP,
    updated_at      timestamp default CURRENT_TIMESTAMP,
    deleted_at      timestamp default CURRENT_TIMESTAMP
);

alter table goals
    owner to postgres;

create table money_records
(
    money_record_id    serial
        primary key,
    pocket_id          integer        not null
        references pockets
            on delete cascade,
    goal_id            integer        not null
        references goals
            on delete cascade,
    name               varchar(150)   not null,
    type               varchar(50)    not null,
    transaction_amount numeric(15, 2) not null,
    transaction_date   timestamp,
    description        varchar(150),
    file_attachment    varchar(255),
    created_at         timestamp default CURRENT_TIMESTAMP,
    updated_at         timestamp default CURRENT_TIMESTAMP,
    deleted_at         timestamp default CURRENT_TIMESTAMP
);

alter table money_records
    owner to postgres;

