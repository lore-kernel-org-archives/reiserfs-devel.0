From: David Masover <ninja@slaphack.com>
Subject: Re: resizer?
Date: Mon, 04 Apr 2005 20:53:55 -0500
Message-ID: <4251EFB3.8070803@slaphack.com>
References: <4250BAA0.6000708@slaphack.com> <20050404085301.GA6211@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050404085301.GA6211@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alex Zarochentsev wrote:
> hello,
> 
> On Sun, Apr 03, 2005 at 10:55:12PM -0500, David Masover wrote:
> 
>>-----BEGIN PGP SIGNED MESSAGE-----
>>Hash: SHA1
>>
>>What happened to resizefs.reiser4?  I know repacking/shrinking is
>>gone/proprietary, but what about growing?  I distinctly remember that I
>>used to be able to grow a Reiser4 partition.
> 
> 
> i guess it was reiserfs.

No.  It was Reiser4.  I remember because I booted with a normal install
CD, created partitions:

hda1	/boot		ext3
hda5	(no mount)	unformatted
hda6	/		reiserfs
hda7	swap		swap

After installing a Reiser4-enabled Gentoo Linux (and the reiser4progs)
on hda6, I booted hda6, formatted hda5 to reiser4 and copied hda6 to it.

After all that, I was able to boot a boot CD, copy the reiser4progs off
of hda6 to a tempfs (RAM), deleted hda6, resized hda5 to fill the disk,
and was able to use the reiser4 resizer to expand the filesystem on hda5.

I experimented, trying to shrink the FS back down, and it told me that
shrinking wasn't implemented.  But growing the FS?  That was in there
ever since my first download of reiser4progs, and it really seems like a
tiny job.

>>How much work would you expect a repacker to be?  (I might try writing a
>>proof-of-concept on my own...)
> 
> 
> no idea,  new version should be "smarter" then the old one, 
> the algorithm is not scratched yet.

An offline repacker would still be great, or at least one that assumes
no processes touching the FS.  Dirty a bunch of blocks towards the end
of the FS, shrink the FS, and let the normal packer (re: not repacker)
decide where to put them.

This seems like a weekend job to me, but my weekends are full and I
don't have a working knowledge of the FS internals, meaning I'd have to
spend two or three weekends reading source code...

I'm willing to do that, but it will have to wait till summer.

I realize that this may not be quite the industrial-strength repacker
that you wanted, but it should be immediately useful, which is a lot
better than "We might do it if you pay us."
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQlHvsngHNmZLgCUhAQKb3A/+NQGDjvVLbMVS7u0BnWwLa/Y/tiRb1ZRm
5QuNw0On57Y8WYj5ZJMQD5xP7F/waMKRbN1aDZXpxLC2TDQ1NpYh5v4FrM/YDmK+
DXMA0ZfQ89SLbfqLgj5Plys+9QVa8hlH6sokneL+0YXVBRIl24f3LuD4jKiwgwGD
pBNL3q8AgCsomfJWdMrF4wqmtIfML/jKgooqRlwi28kiNH5yjgFPGXawbFlUz6Yf
OT66SdkBUSOKp+NbeT9qasFtVwkL63wUq1QkE+Cg3kpck42hgWszo2S1eUI76zmb
Kf5c0dC/d1OiLeD6T+fs0nImVo69FMft+Wl3OtDhgizJzLKAvXFV4A3iUdJJOPTo
jw9QO/QryvtyfI4aslsogvE3+A5CpW3+JEUx46csrDUUASh87xXVojwLUiPidTaS
sH0+eWSZahfc2FlLNoUemm1ODJTOew0p5jxfNz+q27OEatFXcMcY3ia1Uql9SGJe
efWr49re5a3pendkkcKkLdiv7mloP/jdqUp5sYWznqOKgKdfA+14VlUZtOxmaHq0
8WzI4nUbTh9owHU8GbFJhemsw2QTwqyssrnnmiiOrnqteFAL4Jyb6iDRr4IYfZbW
vEfJXNL0L4ryWhWtJupvQiQmO5mpUIGpbVYoMHKde0yMHXcG6jf3aiIepUILbCaM
5VV09nFd7V4=
=c0ko
-----END PGP SIGNATURE-----
