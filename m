From: David Masover <ninja@slaphack.com>
Subject: flush earlier?  (was Re: Congratulations! we have got hash function
 screwed up)
Date: Fri, 07 Jan 2005 17:27:29 -0600
Message-ID: <41DF1AE1.8090306@slaphack.com>
References: <20041228221218.GA6412@schmorp.de> <20050106124505.GE5352@backtop.namesys.com> <20050106142706.GE519@schmorp.de> <41DD5FA9.5020800@namesys.com> <1967462673.20050106171323@tnonline.net> <20050106162619.GG18173@ZenIV.linux.org.uk> <41DEC53A.40403@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41DEC53A.40403@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Dukes <pakrat@www.uk.linux.org>, Spam <spam@tnonline.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| Chris Dukes wrote:
|
|>
|>
|> All filesystems will fail or suffer degraded performance under
|> certain conditions, you need to determine what conditions are acceptable
|> for your data.
|>
|>
|>
| and each generation of software reduces the extent of such conditions.
| Reiser4 fixes this problem cleanly.

I think Reiser4's degraded performance condition is when it gets lots of
RAM.  First, a disclaimer -- I don't have the latest reiser4 patch.  But
in all versions of the FS, I've found that if I'm ever trying to do
anything when reiser finally decides to flush to disk, basically my
whole system is locked up.  I haven't tested, but I think this would
actually be worse with more RAM, because it would be longer until the
flush was forced, so each flush would take longer.

What is needed is some sort of estimator or estimate.  An estimator
would be something that would flush when, based on recent fs load, it
was reasonable to expect that RAM would fill up just as the flush was
completing.  An estimate would be to flush if a certain percentage of
RAM was full, and to go to synchronous mode if memory usage didn't go
back below that percentage.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQd8a4HgHNmZLgCUhAQKb+A//fps5uIUtnfrHGe0y3itGbggWGkDqV80O
MPlLDqmlyMRWAGij5f5F345OU7GBi7VVCkgXMJbemO7TJ82Yr8OQXPO1Ywrt1rL5
bdPej6rZD7RW7+2DRlT78XdvP2ZbqKQNjvIlmLvQIziGk2BfGxwzxt1P5vztIvfE
HtqiP9ImSbxFkjRjZmdeQC8koyEK0vqYeasRma2pC1ZsABXxRHdRPnm/OT1gZc5D
YAYqyHCcs+RFr6+KYs9TSh4H5pNcHq1kYUEcoNFI0ubMSnNK+DvlrhBPhi5fkxPT
8D86nvphYFn7gKob1A9DZzKQz0qFcbhY35KW8g4hwHUrAyQWQtOU5sh+eIF0hV+j
LRhI6Ao6lgSAyq/GuxVwZ64emiM70JvoRNDLt4YVs4VDWnTcarhUNCikEUjvSCqj
Ux2RWI+6YILFso1D0Zl+4J0hkSxZPurzvRGL9TWT3Gwkdlyfk77jRbgfvZ5oy2aC
Q4gv5h/j+7AngfzlYY8n20zlocGoW8GEpaSgWa4VimTwAuHYEoDMu0TdlHLZzMB6
u2CBoYy7brCaxUpaV7np5E/rfEPcccINVgea0/dVhvkVGjyMQHb8msyX1r4IXRRC
jVxP2veoyxsyTTmcOCAViF6Epe4fVIhTnafH7hVmcWEk0Vt+aHSbAJtYK9oFTz7E
RX0WHi9z4fs=
=UeYu
-----END PGP SIGNATURE-----
