From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] ReiserFS v3 I/O error handling
Date: Wed, 15 Sep 2004 10:30:56 -0400
Message-ID: <41485220.7050602@suse.com>
References: <41461B2F.7080100@suse.com> <20040915131133.GD5137@backtop.namesys.com> <41484801.2000204@suse.com> <20040915141202.GF5137@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040915141202.GF5137@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alex Zarochentsev wrote:
|> I assume that was tested with some simulated i/o errors, wasn't it?.

Of course. The debugging code is since removed, but every place there
was a !buffer_uptodate(bh) check, I added a trigger such that I could
trigger each error path individually. I triggered various error paths
while running fsx, stress.sh, and/or ltp's fsstress.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBSFIfLPWxlyuTD7IRAqljAKCoCuXGN4GSG+hQ2RuiSNtuMZSVuwCgnEMp
gQhDrTbctbjBYwD8U73EB5E=
=2OFI
-----END PGP SIGNATURE-----
