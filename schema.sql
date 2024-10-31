-- onboarding table (for showing onboarding page)
create table montrack.onboarding
(
    title       varchar(150) not null,
    description varchar(255) not null,
    image_url   varchar(255) not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default current_timestamp,
    deleted_at  timestamp default current_timestamp
);

--
-- users table (for users data, login, register, reset password and authentication)
--
create table montrack.users
(
    user_id                 SERIAL primary key  not null,
    full_name               varchar(150)        not null,
    email                   varchar(255) unique not null,
    password_hash           varchar(255)        not null,
    profile_picture         varchar(255),
    pin                     varchar(4)          not null,
    is_onboarding_completed boolean   default false,
    created_at              timestamp default current_timestamp,
    updated_at              timestamp default current_timestamp,
    deleted_at              timestamp default current_timestamp
);

-- social_providers table (for social login)
create table montrack.social_providers
(
    provider_id      SERIAL primary key                                                                 not null,
    user_id          int references montrack.users (user_id) on delete cascade                          not null,
    provider_name    varchar(100) unique check ( provider_name IN ('google', 'facebook', 'instagram') ) not null,
    provider_user_id varchar(255)                                                                       not null,
    created_at       timestamp default current_timestamp,
    updated_at       timestamp default current_timestamp,
    deleted_at       timestamp default current_timestamp
);

-- currencies table (for currency list)
create table montrack.currency
(
    currency_id SERIAL primary key not null,
    name        varchar(100)       not null,
    code        varchar(10)        not null,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default current_timestamp,
    deleted_at  timestamp default current_timestamp
);

-- wallets table (for wallet can be multiple)
create table montrack.wallets
(
    wallet_id   SERIAL primary key                                        not null,
    user_id     int references montrack.users (user_id) on delete cascade not null,
    name        varchar(100)                                              not null,
    amount      decimal(15, 2)                                            not null,
    currency_id int references montrack.currency (currency_id)            not null,
    isActive    boolean   default false,
    created_at  timestamp default current_timestamp,
    updated_at  timestamp default current_timestamp,
    deleted_at  timestamp default current_timestamp
);

-- pockets table (one wallet can have multiple pocket)
create table montrack.pockets
(
    pocket_id      SERIAL primary key                                          not null,
    wallet_id      int references montrack.wallets (wallet_id)                 not null,
    emoji_id       int references montrack.emojis (emoji_id) on delete cascade not null,
    name           varchar(100)                                                not null,
    description    varchar(150),
    total_amount   decimal(15, 2)                                              not null,
    current_amount decimal(15, 2)                                              not null,
    emoji_code     varchar(20),
    created_at     timestamp default current_timestamp,
    updated_at     timestamp default current_timestamp,
    deleted_at     timestamp default current_timestamp
);

-- emojis table (contain emoji code)
create table montrack.emojis
(
    emoji_id   SERIAL primary key not null,
    emoji_code varchar(20)        not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp,
    deleted_at timestamp default current_timestamp
);

-- goals table (for storing user goals)
create table montrack.goals
(
    goal_id         SERIAL primary key                                            not null,
    wallet_id       int references montrack.wallets (wallet_id) on DELETE cascade not null,
    name            varchar(100)                                                  not null,
    target_amount   decimal(15, 2)                                                not null,
    current_amount  decimal(15, 2)                                                not null,
    description     varchar(150),
    file_attachment varchar(255),
    created_at      timestamp default current_timestamp,
    updated_at      timestamp default current_timestamp,
    deleted_at      timestamp default current_timestamp
);

-- money records (for storing income or expense flow)
create table montrack.money_records
(
    money_record_id    SERIAL primary key                                            not null,
    pocket_id          int references montrack.pockets (pocket_id) on delete cascade not null,
    goal_id            int references montrack.goals (goal_id) on delete cascade     not null,
    name               varchar(150)                                                  not null,
    type               varchar(50)                                                   not null,
    transaction_amount decimal(15, 2)                                                not null,
    transaction_date   timestamp,
    description        varchar(150),
    file_attachment    varchar(255),
    created_at         timestamp default current_timestamp,
    updated_at         timestamp default current_timestamp,
    deleted_at         timestamp default current_timestamp
);

