From: David Masover <ninja@slaphack.com>
Subject: preexisting 'metas'?
Date: Sat, 12 Jun 2004 21:04:46 -0500
Message-ID: <40CBB63E.4060001@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



I finally got sick of having the metas directory named 'metas'.  I went
in and found (quite easily -- clean-ish looking code) the label name and
changed it to '...' (sanest option for me).

Well, the '...' in my brother's home dir had some stuff that he'd like
to keep secret -- as in, he doesn't want people to know he has them.
After reboot, his '...' dir still exists, but when I rename it, the
metas dir pops back in.  Then I can't overwrite it again (make a new dir
called '...', or move the old one back).

This is all perfect, and exactly what you'd want/expect.  Just curious
- -- is this intentional/documented?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQMu2PXgHNmZLgCUhAQJ0YBAAgbFpJhuGCiI+XZ3kKqzUm1SdABM7m8ZV
qbLwzHhRu1R5I8zVpXUEAfR2ba1bL+3/DuXkvNjvRjL/RopGDcmp2yH4C69MIC/B
kCEAkq1pb2Hh6Ot7Qopj9XNfXFO5VflPVu0JVj2xxaO4uXI3V0N5m34Uz7xfRV6T
D7pqxgsRWVwB+ipSZ0Et9KUodawcudBt9w4eCgx+y7lchTYMjXMu4iopqU5uUQuW
IPM/T997NslJ5tsAQjVVFtwZrotrEoC3pV2s24T7aYVnnF2HCmlHJDK5Ldpd751a
+9TyYxmEBHk4ZyAZQvKNc5oIN3vPGdRfz+Lphuv11/FZ8xDV05mgltPSqDQRMKjF
4zIwPvW6OQo3sL4kzBNWXF7i26/h6KrYb7TP/yUtd3zV4NLN2hHOKUzu1p02Pu/7
NB7Ds8nW3kpHmeS7rYIYLamyXJiarLTa+yMnLcHYC8zAQkHR31S6HPKqHDfgX2Qf
L+cBxJAnyu/wko1Ays52o0AbYjRlEaeMaiYRBCb5AAhNo8K7aZUWJgwPw5KVvxTU
F0z9fYNfMeCLhIyw3jFL7WF7nGdEfyr8lPJm3z9IZLqCEVxGeUrdvDRrazN1XQj0
FYeWh8GZPPgIPjZiUu5gwDWSRbqU3feCLQuH8tWjiUy1neI9/XBU4D5b1u/Z3IjG
jX3a360dfJ8=
=hMCA
-----END PGP SIGNATURE-----
