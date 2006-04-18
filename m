From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Undeletable files...
Date: Tue, 18 Apr 2006 09:53:06 -0400
Message-ID: <4444EF42.7030507@suse.com>
References: <44414617.8030001@sharp.fm> <200604152358.07338.zam@namesys.com> <444353D7.5000302@namesys.com> <4442B2D9.6090307@suse.com> <44445AED.6080905@namesys.com> <4443B38D.1010103@suse.com> <44450FCE.4060608@namesys.com> <444471F5.90707@suse.com> <44452C44.9040000@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44452C44.9040000@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, Graham Leggett <minfrin@sharp.fm>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Was this a 3.5/3.6 conversion bug?  I thought we figured it out
> once....  I just can't remember the figuring....

Oh ok, I see where you're going with it. There was the bug where the
inode attribute bit in the super would claim that inode attribute were
valid and then cause problems when they were enabled by default. That
patch wasn't in mainline until 2.6.12.

The kernel in the bug report is 2.6.9 w/ RH patches. I haven't read the
source, but I doubt they would have backported that bug.

At any rate, Graham, can you post your dmesg and the output of "grep
kernel: /var/log/messages"? If you're seeing unexplained permissions
errors, I'd like to see the logs as the most likely source is corruption.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFERO9CLPWxlyuTD7IRAk+4AJ99lehSoURYKL9+DeBcLlaWA3rHAgCfdyo/
DRHDvbfPE7b32m/i8pveoRo=
=/RXV
-----END PGP SIGNATURE-----
