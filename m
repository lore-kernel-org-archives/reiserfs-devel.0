From: David Masover <ninja@slaphack.com>
Subject: Re: when will it end?
Date: Wed, 17 Nov 2004 23:07:35 -0600
Message-ID: <419C2E17.7020702@slaphack.com>
References: <417EF280.10003@slaphack.com>	 <20041027033443.GE25932@backtop.namesys.com>	 <417F3C7C.2020408@slaphack.com> <1406818064.20041027103126@tnonline.net>	 <417FD40B.2050807@namesys.com>  <418054C8.5020104@slaphack.com> <1099153412.14113.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22406-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1099153412.14113.1.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

[...]

| Perhaps.  I'd just feel a little cheated.  Currently, without a
| repacker/resizer, I would have to borrow/buy another hard drive to get
| my data off reiser4, and it seems that it would slowly become more
| fragmented.
|
|> hmm.. well you would certainly need that with another filesystem too

Doesn't cost me money with another filesystem.  In particular, I can
resize reiserfs (v3) for no cost (resize_reiserfs), meaning that
repartitioning/reformatting is slow, but requires no extra hardware.
Shrink fs, shrink partition, grow new partition, copy files, rinse,
repeat.  Probably difficult for drive more than 50% full.  Parted seems
to support this for quite a few filesystems, actually.

| What about plugins?  Application patches?  The repacker seems sort of
| essential, and definitely a lot of work, but your expertise would also
| be very useful for things like, say, a reiser4 backend to a traditional
| SQL database.  I sincerely doubt people would be willing to pay much for
| something that they see as "free" with Windows, while there's some real
|
|> you do pay in windows, but also, its more needed with ntfs and fat32 i
|> believe

I was talking about perception.  People already have Windows, therefore
they already have Windows Defrag.  It's "free" in the sense that
Internet Explorer is "free".  Imagine how little Firefox's market share
would be if it cost money.  Notice how they can afford a full-page ad in
the New York Times.  Not that it's infallible, just that I don't see a
better business plan right now, biased as I am (I'm an end-user).

[...]
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQZwuFngHNmZLgCUhAQKhnA/6A1sOODaX3L3mf173y3QzdfhrkN3ejJ+G
mAUnTykXjhNqgYfRaABVMD/4lIjkQpi193BaWA5lWiSa5mmVnNPCVJQbzS1bN4sE
oay8T5ecA696Qsw85iTy9cjGcIHeKf6VBFLXsTiz22UqrKNVPqhUegAFg/8OMV8w
Y+/b7/4kuQhnWL/r6HMVzxZrhlUKuL0vXdHfst0lHK80/zG9TkhFmBsnNamWHw9+
RxfZ5V2BmsG+ajC2v5joymXnTsL6KzZmv6NJVFyDg0ZZ3kSBs+rBrdVlEcXO0Uu+
pMcqRSRn8pK53wBcHx60KpOYs20D18FZyTA3E71SoeXXZF7q7wwIpm9HD89QYdLi
qU77gGWPVQoWIqrfJbwzLiZB1lO8rscjuk2U0U4BxSldt7ytYwke25h8gw8ICZXh
Gkaru0ZqCGsVyK+H3hOmui5H/z8OQoQ6uxXJ29950lfuDqBDYIJ4hIy+0Q8HUXKw
I2Xp3mzmoq7JJHzuxuGWOBLsNRuibp85xNUK4Wdw9rq9Pywa6+cDbdEZ2Ml+K7KU
6yiy4l59gHWJeXuaAmKEGIwhE/TcCOMvNt3RaHk+lembamdApnJaIqciIdfscPTI
9CSjuQrydKtBCEe2AA0+bEOkjuA5dHr8wmryi7JWrDl919C9cbR4zVQKmnrvXnSU
cRqIyji7aFs=
=ye9Y
-----END PGP SIGNATURE-----
