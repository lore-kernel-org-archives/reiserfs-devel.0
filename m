From: Javier Marcet <lists@marcet.info>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Mon, 9 Feb 2004 15:14:01 +0100
Message-ID: <20040209141401.GA30795@hiroshi>
References: <1074530725.29546.178.camel@tiny.suse.com> <200401192353.03670.Dieter.Nuetzel@hamburg.de> <1074649838.3378.3.camel@tiny.suse.com> <200402091404.40797.Dieter.Nuetzel@hamburg.de>
Reply-To: Javier Marcet <javier@marcet.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16736-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200402091404.40797.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Dieter@marcet.info, =?iso-8859-1?Q?N=FCtzel_=3CDieter=2ENuetzel=40hamburg=2Ede=3E?=@marcet.info, Chris Mason <mason@suse.com>, green@linuxhacker.ru, Gerd Knorr <kraxel@suse.de>, Jeff Mahoney <jeffm@suse.com>

* Dieter N=FCtzel <Dieter.Nuetzel@hamburg.de> [040209 14:00]:

>> > An EXPORT was missing in linux/fs/buffer.c to compile ReiserFS 3.x.x as
>> > modul (inode.c, unresolved symbol):

>> Thanks, I'll add it into the patch when I get back from linux world.

>More on this.

>I have now SuSE's 9.0 2.6.2-0 up and running.

>Only 01-reiserfs-journal-writer is needed now without modifications.

>02-reiserfs-nesting
>03-reiserfs-iosize
>04-reiserfs-balance_dirty

>Are all in an these two need some _little_ hand work:

>05-reiserfs-logging
>06-reiserfs-jh-2

>Don't forget this in fs/buffer.c

>EXPORT_SYMBOL(try_to_release_page);

Of the above, only 04-reiserfs-balance_dirty is included in vanilla
2.6.2. I applied the rest and I haven't had the smallest problem.


--=20
Javier Marcet <javier@marcet.info>
