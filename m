From: David Masover <jedi@ninja.dynup.net>
Subject: swsusp and reiser4
Date: Fri, 12 Dec 2003 23:38:03 -0600
Message-ID: <3FDAA5BB.6090307@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16340-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Reiser4 won't compile with the latest swsusp patches.  According to 
Nigel Cunningham,

 > Regarding Reiser4, PF_IOTHREAD should be replaced by PF_SYNCTHREAD.

The swsusp patches actually go so far as to remove the line defining 
PF_IOTHREAD.  Nigel says he's working on it, but I want to make sure 
there's cooperation (or at least acknowledgement) at this end.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBP9qluwisZLIF6uqOAQJ94A/+MmyDnCF/7Ejv+aHNkk2fI7KLXsOgV/dp
S/Jos0ajG7CwJh2ClwT7UryaMlJflf80anfslw9w6I/7o56GMShfCB1RgkaHe/zm
S77Ul7Si22W2YLsEQxJ/JpIQWNrc/p6LiiySA6DBE8IxLYrjB+tFFJnwcV6sqVij
Lv3MjuJ7YBgZubQMOtUgydElhb0M06LGpm2RU+k9pOSxrrVSzAwe2fRc7gBe+KrJ
SZsN2DXqYBrhoCqopPnsyD7EwcIe41IUR2OssMASRJXTTdue+9xg4QVb/2GEnkM8
N4WaaoiBQNvYptRMLe8zbNMrTJZZ54VykHdJVz/fbutkZGIMdONgWCTNHUsosTz9
0Ry4difeTSc30W419oDhYG64TLAnP+ux4ORdIIisxBlKB6ZAsvb3HsCWDRPFfClZ
JRz24MPcrgiu4XrBJOiT1dIOcCAVs4w5BDZdm6ta9AI2H8KUxb9eUF83DXgQT9Qu
olrQgM71faxXTy2lVadxxM+HbEdpS7fApWZOJFdGw9HnmIjJZf0giTPzA83xxHxI
zkXJkVkCvTJR24V48CcNbue9+ukz57kMgEJqXiwy3YQk45nckXatX56HkOeF5dlW
zqTlA2yCTaISp33u0tXp61MXjQT+j6URsjTN4dxZ5zLQDLdVdoTSuYlW1zihO0aT
zWAOnGUMPIE=
=0JZu
-----END PGP SIGNATURE-----

