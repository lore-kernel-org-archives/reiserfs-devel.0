From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Wed, 5 Mar 2003 18:09:29 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C07A1@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13100-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com, axboe@suse.de

	I don't know if the patch for 2.4.20 I received was rolled out to
the community at large or even if it will resolve your problem. It did help
my particular problem though.

-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Wednesday, March 05, 2003 5:50 PM
To: reiserfs-list@namesys.com
Subject: Re: Error messages.


>         You may want to look at the latest from SuSE. I've been mostly
> successful with lk 2.4.19 on the pdc202xx driver with Maxtor 250GB drives
on
> a Tyan PIII motherboard. I added IDE write barrier patches from Chris
Mason
> and Jens Axboe and ran into the "drive not ready for command" errors. This
> was subsequently fixed by Jens for a 2.4.20 kernel and I've back ported
that
> bit for the 2.4.19 kernel I'm testing. The status errors are gone but now
> I'm investigating filesystem coruptions on my ReiserFS partitions.

I  am currently running 2.4.21-pre4. It seem to keep most other things
working, except for the "drive not ready for command" error.

It might be worth testing 2.4.19 kernel with these patches then. I did
try with mandrake 2.4.19 without success though.

Also, am going to try 2.5.64 too.


PGP public key: https://tnonline.net/secure/pgp_key.txt
