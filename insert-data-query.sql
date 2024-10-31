INSERT INTO montrack.onboarding (title, description, image_url, created_at, updated_at, deleted_at)
VALUES ('Welcome in Montrack!',
        'With Montrack, you can easily and quickly track all your expenses. Enjoy full control over your finances.',
        'image1.webp', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
       ('Your finances, at your fingertips',
        'Montrack provides easy access to all your financial information at your fingertips. Start managing your finances more efficiently.',
        'image1.webp', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO montrack.users (full_name, email, password_hash, profile_picture, pin, is_onboarding_completed, created_at,
                            updated_at, deleted_at)
VALUES ('John Doe', 'johndoe@gmail.com', 'passwordhash', 'profile.webp', '1234', false, CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP, null);