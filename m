From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Mon, 9 Feb 2004 14:04:40 +0100
Message-ID: <200402091404.40797.Dieter.Nuetzel@hamburg.de>
References: <1074530725.29546.178.camel@tiny.suse.com> <200401192353.03670.Dieter.Nuetzel@hamburg.de> <1074649838.3378.3.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074649838.3378.3.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, green@linuxhacker.ru, Gerd Knorr <kraxel@suse.de>, Jeff Mahoney <jeffm@suse.com>

Am Mittwoch, 21. Januar 2004 02:50 schrieb Chris Mason:
> On Mon, 2004-01-19 at 17:53, Dieter N=FCtzel wrote:
> > 05 and 06 needed some handwork 'cause the SuSE kernel inclues xattrs and
> > posix acl's but nothing special.
>
> Good to hear.  I wasn't expecting the suse merge to be difficult,
> luckily it doesn't have many patches in it yet.  Jeff and I will look at
> getting them into the suse kernel once data=3Djournal is done as well.
>
> > An EXPORT was missing in linux/fs/buffer.c to compile ReiserFS 3.x.x as
> > modul (inode.c, unresolved symbol):
>
> Thanks, I'll add it into the patch when I get back from linux world.

More on this.

I have now SuSE's 9.0 2.6.2-0 up and running.

Only 01-reiserfs-journal-writer is needed now without modifications.

02-reiserfs-nesting
03-reiserfs-iosize
04-reiserfs-balance_dirty

Are all in an these two need some _little_ hand work:

05-reiserfs-logging
06-reiserfs-jh-2

Don't forget this in fs/buffer.c

EXPORT_SYMBOL(try_to_release_page);

Greetings,
	Dieter
