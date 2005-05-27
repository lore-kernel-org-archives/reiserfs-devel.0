From: btinsley <btinsley@gmail.com>
Subject: Re: online fsck
Date: Fri, 27 May 2005 18:04:20 -0500
Message-ID: <263a8b350505271604186263f@mail.gmail.com>
References: <263a8b350505231124758be936@mail.gmail.com>
	 <42930542.1000407@namesys.com> <4293B817.5030906@accessplus.com.au>
	 <263a8b35050524200220eff78b@mail.gmail.com>
	 <20050527091725.E7CC5BF6@philou.gramoulle.local>
	 <4296E91E.5050505@darthvader.us> <4297A43C.1010608@slaphack.com>
Reply-To: btinsley <btinsley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4297A43C.1010608@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> I'd rather donate for a reiser4 online repacker.  By the time
> something's fsck'd, so to speak, I'd rather take it offline and possibly
> pull in backups.  But a repacker (even an offine one) and a resizer
> (even an offline one) are two things that we even have in the Linux
> ntfs-tools, and it's also something that people would have an immediate
> use for.

Pulling in backups is not always practical though. It's no fun
restoring a 900GB filesystem from tape, especially when the data has
to be transferred over the network :-)

I would like to see the repacker though. I have certain filesystems
that could really use it. Would it be practical to have an option to
enable the repacker to include some level of consistency checking?
It's been my experience that corruptions requiring a rebuild-tree are
pretty obvious to reiserfsck ;-)

>=20
> Another killer feature would be to bring back metadata, or at least a
> way to create special (plugin) files, and the ability to write certain
> kinds of userland plugins, thus giving us FS-level support for things
> like zipfiles.  Yet another killer feature would be stable crypto and
> compression, and the ability to enable it only for certain directories.

I would go for this one as well. Our particular application stores
data in an industry-standard format. Being able to
index/search/crypt/etc. this at the FS level would let me get rid of
the cost and overhead of Oracle :-)
