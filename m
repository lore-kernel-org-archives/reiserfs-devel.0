From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 for windows
Date: Sat, 04 Dec 2004 22:54:41 -0600
Message-ID: <41B29491.20405@slaphack.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41B287C6.2060902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22674-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41B287C6.2060902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Job Bob <yzhang2004@yahoo.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hans Reiser wrote:
| I should add that reiser4 for windows would be proprietary.   If they
| can pay MS, they can pay me, and I see no reason to do free work for MS.

Don't think too highly of the Cygwin project, do you?  Oh, and it's
almost impossible to get a laptop without paying MS, directly or
indirectly.  No reiser4 for laptops, then.

Also, is it a given that reiser4 for windows would work without help
from MS?  I've just never seen a third-party filesystem driver for
windows.  You'd think that at least one other filesystem, one of the
Linux/BSD/etc ones, would have done this, if it was feasable.

To start with, ntfs read access is still case insensitive, last I
checked.  How deep does that go?  How many programs would be broken if
it was changed?  How much point would there be if one could not access a
unix-created reiser4 partition, or if unix reiser4.2 had to be case
insensitive?  And let's not go into the file-as-directory stuff -- it's
hard enough on unix.

All this leaves me with the distinct impression that it'd be cheaper to
buy some gigabit ethernet (or fibre) and a Linux CIFS/Samba fileserver
using reiser4.  Steam and others refuse to install on network drives,
Windows probably will not boot off a network drive, but I imagine that
fixing these would be easier than porting a filesystem.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQbKUkHgHNmZLgCUhAQIjwg//bES/Y5TRhdkNyaMAveX4TutK+lKNJqsp
P6j0OJTIW9DxrwtpuMjTICwMW1Lr50oercybKtvQz+UIz7lznmyegyPyjCQFF4dm
/styevdcbUOal5kP1gqxquyxw0nmO4Nl45AUAuArUetYVHbDN/odgQ1jFNt1WXpT
suno3iDwZqiF5+ZSYN1psruukI4KS59+S/Cl9D8TYT7XJUp1AzFa8i+I2ODRw1uj
CQDV1tU7CfqngKheJ/yKV5VTLIb0RrTAhaf2tU5V5bm60+8UIGii8blHWs/0ltq0
UEfAOSXPJiLHcYPiVCutKagss02Nyy0dlWzD160JSUkXq22+3pKSFQXUxJFKCrXa
7lFAbosAYO7pt/JIjDBB9Y72F/p8dQJq9kizIBg/KLGD/ZdoRPksxsvf3Ale6uCb
wtciIIsRPlxb+UkefubWeo9kmoD7bWig3IF9zSQUZEupM1WZYcNEdyYEXpLg6BqD
x1Yn0DfCv61ISIahKdNoQEiOyc87Wqcsg6IvByH0pXmdYh0bBkWxxpax4+n+kd2y
TI5yX2QmXxS6RWFAuXV1H2mUyYRcKLeVsNy75Kxorl7nbc4HC/MZsmV+e4z5Whkh
+/5gH9l9bV2NxXL0vKmdQ9zEUHUYYCCqUxWoRtYHY4DFoDgtGE8GyD8QTmyevoT4
bVDdji2mpS0=
=2xlV
-----END PGP SIGNATURE-----
