--
-- INSERT ONBOARDING data
--
INSERT INTO montrack.onboarding (title, description, image_url, created_at, updated_at, deleted_at)
VALUES ('Welcome in Montrack!',
        'With Montrack, you can easily and quickly track all your expenses. Enjoy full control over your finances.',
        'image1.webp', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
       ('Your finances, at your fingertips',
        'Montrack provides easy access to all your financial information at your fingertips. Start managing your finances more efficiently.',
        'image1.webp', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

--
-- INSERT USERS data
--
INSERT INTO montrack.users (full_name, email, password_hash, profile_picture, pin, is_onboarding_completed, created_at,
                            updated_at, deleted_at)
VALUES ('John Doe', 'johndoe@gmail.com', 'passwordhash', 'profile.webp', '1234', false, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP, null);

--
-- INSERT SOCIAL PROVIDERS login data
--
INSERT INTO montrack.social_providers (user_id, provider_name, provider_user_id, created_at, updated_at,
                                       deleted_at)
VALUES (1, 'google', 'google1234', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null);

--
-- INSERT CURRENCY data
--
INSERT INTO montrack.currency (name, code, created_at, updated_at, deleted_at)
VALUES ('Indonesia Rupiah', 'IDR', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null),
       ('United State Dollar', 'USD', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null);

--
-- INSERT WALLETS data
--
INSERT INTO montrack.wallets (user_id, name, amount, currency_id, isactive, created_at, updated_at, deleted_at)
VALUES (1, 'Main Wallet', '8000000', 1, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null);

--
-- INSERT EMOJIS data
--
INSERT INTO montrack.emojis (emoji_code, created_at, updated_at, deleted_at)
VALUES ('#h4123qa', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null);

--
-- INSERT POCKETS data
--
INSERT INTO montrack.pockets (wallet_id, emoji_id, name, description, total_amount, current_amount, emoji_code,
                              created_at, updated_at, deleted_at)
VALUES (1, 1, 'Food', 'Money for food, snack, etc.', 1500000, 1000000, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null);

--
-- INSERT GOALS data
--
INSERT INTO montrack.goals (wallet_id, name, target_amount, current_amount, description, file_attachment, created_at,
                            updated_at, deleted_at)
VALUES (1, 'Buy A Jacket', 500000, 200000, 'New Stylish Jacket.', 'jacket.webp', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
        null);

--
-- INSERT MONEY RECORDS data
--
INSERT INTO montrack.money_records (pocket_id, goal_id, name, type, transaction_amount, transaction_date, description,
                                    file_attachment, created_at, updated_at, deleted_at)
VALUES (1, null, 'Nasi Goreng', 'Expense', 25000, CURRENT_TIMESTAMP, 'Beli Nasi Goreng.', 'bill.webp',
        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, null);