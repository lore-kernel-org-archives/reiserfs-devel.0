From: jbingemer@oilgear.de
Subject: Antwort: Re: Antwort: Re: Antwort: Re: Problems with reiserfsck 3.6.9
	(Newbie)
Date: Mon, 21 Jul 2003 14:35:10 +0200
Message-ID: <OF0D0FD0EC.A6025E4F-ONC1256D6A.0041DAD7-C1256D6A.00453635@oilgear.de>
References: <1058787199.32372.14.camel@haron.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 00453634C1256D6A_="
Return-path: <reiserfs-list-return-14979-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058787199.32372.14.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=_alternative 00453634C1256D6A_=
Content-Type: text/plain; charset="US-ASCII"

Yury Umanets <umka@namesys.com> schrieb am 21.07.2003 13:33:19:


I just took a look at the syslog and found the following line:

Jul  9 18:36:20 bi kernel:  I/O error: dev 0b:01, sector 0
Jul 21 01:20:13 bi kernel: hde: dma_intr: error=0x40 { UncorrectableError 
}, LBAsect=4903084, sector=4902920
Jul 21 01:20:13 bi kernel: end_request: I/O error, dev 21:05 (hde), sector 
4902920
bi:~ #

> Yet another issue. Can you run badblocks command in maner like the
> following:
> 
> badblocks -b 4096 -o /tmp/badblocks /dev/hde
> 
> And send us /tmp/badblocks.

I think the time it takes to run this command depends on how many bad 
blocks are found, but how can I check if it is still active/doing 
something ?

When I started the command, top reported 33% CPU time used by badblocks, 
but after 2 minutes or so it stops taking cputime.

  918 root      15   0  1668 1668  1260 S     0.0  0.6   0:00 bash
  937 root      15   0   472  472   340 D     0.0  0.1   0:20 badblocks
 1044 root      15   0  2088 2088  1824 S     0.0  0.8   0:00 sshd

Is this normal ?

Regards
joerg
--=_alternative 00453634C1256D6A_=--
