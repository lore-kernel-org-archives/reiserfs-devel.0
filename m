From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Wed, 5 Mar 2003 16:36:09 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C079D@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13095-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com

	You may want to look at the latest from SuSE. I've been mostly
successful with lk 2.4.19 on the pdc202xx driver with Maxtor 250GB drives on
a Tyan PIII motherboard. I added IDE write barrier patches from Chris Mason
and Jens Axboe and ran into the "drive not ready for command" errors. This
was subsequently fixed by Jens for a 2.4.20 kernel and I've back ported that
bit for the 2.4.19 kernel I'm testing. The status errors are gone but now
I'm investigating filesystem coruptions on my ReiserFS partitions.

-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Wednesday, March 05, 2003 4:21 PM
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com
Subject: Re: Error messages.


>         Anders, which kernel are you running and what Promise driver?

I  have  been  trying most kernels since 2.4.17 including stock redhat
and mandrake kernels.


> Wayne



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
