From: "Brian" <brian@english-bay.com>
Subject: Re: My mistake....
Date: Thu, 11 Jul 2002 06:21:59 -0700
Message-ID: <004901c228dd$f01fe220$0e01a8c0@englishbay.com>
References: <000b01c228db$3a1b1f00$0e01a8c0@englishbay.com> <20020711170537.A2611@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Oleg:

>    Have you tried specifying explicit -t reiserfs parameter?

Yes.

It reports the usual "mount" errors for wrong filesystem mount parameters.

'mount -t auto /dev/hdc2 /arch" always mounts as an ext3 filesysstem.

I guess I can remake /dev/hdc2 as a reiserfs but I fear I would loose the
data completely and I do not have another partition large enough to save a
10gig raw dump of that partition.

Thanks,

Brian
BSFH

