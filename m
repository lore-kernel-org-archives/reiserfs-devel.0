From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: can't find a reiserfs file ssytem!
Date: Wed, 17 Mar 2004 19:48:28 +0100
Message-ID: <200403171948.28885.Dieter.Nuetzel@hamburg.de>
References: <20040317004935.565332B2B57@ws5-7.us4.outblaze.com> <1079518225.2215.3.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17283-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079518225.2215.3.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Vladimir Saveliev <vs@namesys.com>, mite pascoff <ttl@linuxmail.org>

Am Mittwoch, 17. M=E4rz 2004 11:10 schrieb Vladimir Saveliev:
> Hello
>
> On Wed, 2004-03-17 at 03:49, mite pascoff wrote:
> > please help:
> > after a crash I can't mount my secont partition on which is located my
> > /home dir ...
> >
> > mount reports: "read_super_block: can't find a reiserfs file ssytem" ...
> >
> > in the man page it says to run reiserfsck with option --rebuild-sb ...
> >
> > am I going to lose all the data on this partition if I run reiserfsck
> > --rebuild-sb
>
> No.
>
> > and what it means "to recover a superblock on a reiserfs partition... if
> > yes how can I save my data from being lost ?!
>
> create a copy of that partition on spare device
> dd if=3Dproblemdevice of=3Dsparedevice

Please STOP such advice.

Start with dd_rescue (as you told people even with "reiserfsck=20
=2D-rebuild-tree")...

> get the latest reiserfsprogs
> (ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.13.tar.gz)
> reiserfsck --rebuild-sb sparedevice
> reiserfsck --rebuild-tree sparedevice
>
> Lets us know the result

Don't forget the latest reiserfsprogs-3.6.13+ patches...

E.g. when will we see 3.6.14 (even for RAID)?

Cheers,
	Dieter
