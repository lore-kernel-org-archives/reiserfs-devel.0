From: Perry Kundert <perry.kundert@gmail.com>
Subject: Fwd: reiser4 plugins
Date: Fri, 24 Jun 2005 14:01:24 -0600
Message-ID: <2f9ccaae05062413015b850961@mail.gmail.com>
References: <tdwebste2@yahoo.com>
	 <20050624093510.4330.qmail@web51301.mail.yahoo.com>
	 <200506241545.j5OFj3Iw014214@laptop11.inf.utfsm.cl>
	 <2f9ccaae050624101329390969@mail.gmail.com>
Reply-To: perry@kundert.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f9ccaae050624101329390969@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: tdwebste2@yahoo.com, Lincoln Dale <ltd@cisco.com>, Hans Reiser <reiser@namesys.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On 6/24/05, Horst von Brand <vonbrand@inf.utfsm.cl> wrote:
> Timothy Webster <tdwebste2@yahoo.com> wrote:
>
> [...]
>
> > I think it is the task of the linux community to
> > generalize the vfs layer and not lock out reiserfs4
> > until that is done.
>
> No... the task of the Linux community is to make a better kernel.

    In general, isn't it better to first include modules providing
divergent but possibly interesting functionality (such as Reiser4) as
an "optional" or "experimental" component, and then slowly re-factor
desirable functionality into higher level facilities like the VFS?

    One of the strengths of Linux (so far), is that it hasn't tried
too hard to "guess" what functionality might be the next "killer"
kernel feature; if something is truly interesting, it will eventually
find its way more deeply into the kernel.  If not, it stays in an
"optional" driver.

>
> You will have to do the work to convince it that the changes give a bette=
r
> kernel if included. That means the work to find out what they object to,
> solve the problem (if it can be solved), and try again.
>
> >                     reiserfs4 wants to keep a plugin
> > id for each and every file.
>
> Good for you. Nobody else has shown any interest in that.

    The jffs2 filesystem may perhaps vary its functionality and
"on-flash" format wildly, depending on whether you use it with NOR or
NAND flash.  Not many people have shown interest in that; however, it
is still an important feature to some (ie. ME).

    This is an implicit analog of a plugin; Why force the VFS to take
note of how jffs2 happens to handle its formatting for NAND and NOR
flash?  Just let it use the correct "plugin"!

    Virtually every non-trivial filesystem has the concept of varying
its behaviour, some implicitly (jffs2 NAND or NOR?), some explicitly
(NFS mount options).  Should we force them ALL to select ALL format
variability via the VFS?

    So what if reiser4 wants to have a plugin that converts all
english files to swahili or pig latin as an on-disk format, and it
wants to call it a "plugin".  So long as it doesn't interfere with the
correctness of other filesystems, why prevent it from merging?

    I believe that it would be a GREATER error to force VFS changes
supporting the generic idea of a "plugin", before proving that the
concept has more general applicability.  See if reiser4 lives or dies
first, as an optional experimental filesystem.  No one is forced to
use it.  In a couple of years, if it becomes an ignored "backwater"
filesystem (like, say, coda?), then remove it from the mainline
kernel.  No one will  notice...

>
> >                             An additional filesystem
> > layer is the traditional solution to achieve advanced
> > features, but not an optimal solution in my opinion.
>
> Right. And what is said here is to /use/ said layer (VFS) or see how it c=
an
> be changed to cater for your needs.

    If reiser4 wants to provide a usable interface (internally), to
select behaviour that is traditionally selected by choosing a
completely separate filesystem, then why not let it?  It harms *no
one* -- forcing changes to the VFS before it is proven that this kind
of functionality is even generally desirable would be a HUGE error!

>
> > Yes gnome, kde and perhaps cifs do it.
>
> Gnome and KDE are userspace utilities, designed to run on several operati=
ng
> systems that do not have such filesystem plugins at all, plus for the
> foreseable future the mayority of Linux (file)systems won't have them
> either; so they probably won't ever use it for portability's sake. CIFS i=
s
> a second class citizen AFAIU, as it exists for compatibility with legacy
> systems only. So none of the above is in any way compelling.
>
> >                                        But if instead
> > they used file plugins a lot more could be shared.

    The ext2 and ext3 filesystems support the same basic on-disk
format, as everyone knows.  However, the selection of ext3 provides an
on-disk journal, which (if the filesystem is then mounted as ext2), is
ignored.  You select the "journalling plugin" by mounting the fs as
ext3.  You turn it off by mounting it as ext2.

    Reiser4 provides a way to do precisely this kind of selection of
variable on-disk formats by specifying a plugin.

   I ask you -- if everyone in kernel-land is so convinced that you
should always select varying on-disk formats via the VFS, then *why*
hasn't ext2/ext3 been merged into a single filesystem?  Surely the
"journalling" plugin of this filesystem is a prime candidate for
selection via the VFS?



    Here's the deal.

    So Hans can be a butt-head.  Get over it.  Big projects attract
big egos.  This is a good thing!

    Reiser4 provides potentially very interesting functionality, some
of which may or may not  (over time) be interesting to other FS
implementers.  At that time, it will be "abstracted" into the VFS.
*AFTER* it has been proven safe and useful to do so!

    Until then, including Reiser4 in the main-line kernel is
*completely* consistent with the "do no harm" philosophy that has let
other filesystems and drivers have be included.  No one running a
"stable" server is going to let the "experimental" Reiser4 filesystem
code anywhere near their kernel -- just like all other "experimental"
code!

    Others (like me), will use the 'md' drivers to provide the stable,
error-free media that ALL filesystems, including reiser4, assume,
'rsync' to provide for backups since it is clearly marked as
"experimental", and continue to benefit from the improved atomicity
and speed that reiser4 provides -- just as I have been doing for the
last 18 months!

--
    -pjk

"If you will not fight when your victory will be sure and not too
costly, you may come to the moment when you will have to fight with
all the odds against you and only a precarious chance for survival.
There may even be a worse case. You may have to fight when there is no
hope of victory, because it is better to perish than to live as
slaves." -- Winston Churchill
