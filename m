From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: New to reiserfs
Date: Mon, 13 May 2002 23:24:24 +0200
Message-ID: <200205132324.24309.Dieter.Nuetzel@hamburg.de>
References: <200205132153.59075.Dieter.Nuetzel@hamburg.de> <3CE028A3.3080002@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10305-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CE028A3.3080002@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, JPASTORM@esade.edu

On Monday 13 May 2002 22:57, Hans Reiser wrote:
> Dieter N=FCtzel wrote:
> >On Monday 13 May 2002 10:07, Hans Reiser wrote:
> >>>>4.- I have a PIII 1 GHz, 512 MB RAM, SCSI server where I run sendmail,
> >>>>bind and squid. Will I have problems with performance if I migrate to
> >>>>reiserfs?
> >>
> >>sendmail will be lower in performance when using reiserfs unless you use
> >>the latest not yet released patches and turned data journaling on.
> >
> >More speed numbers on this to come with related post.
> >
> >>Do you really push the performance limits of the machine as a mail
> >> server?
> >
> >You mean if it is worth?

Here I don't understand you that's why I asking.

> >>squid will benefit from your putting all files in one directory.
> >
> >So I should clobber my squid partition/dir and reconfigure to put all
> > files into only one directory and let the squid hierarchy alone?
> >
> >Thanks,
> >	Dieter
>
> I don't understand you.
>
> You should put squid into one big directory (not using their kludge that
> avoids making directories too large by using a tree)

So you understand me right...;-)

> unless you have multiple processors (in which case the VFS directory giant
> lock will hurt you).

BKL?

Where is the limit 2, 4, or even more CPUs?
I'll have two in some days.

Thanks,
	Dieter

PS You know that I'm on the preemption+lock-break, O(1)-scheduler track...;=
-)
