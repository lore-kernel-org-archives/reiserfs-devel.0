From: "bo" <bo@sosnetwork.net>
Subject: Re: Mount and file system size issue
Date: Fri, 7 Jun 2002 09:38:01 -0700
Message-ID: <001601c20e41$b06afd60$5701a8c0@bomoon>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon> <20020607112121.C12869@namesys.com> <000801c20e3a$df840b20$5701a8c0@bomoon> <20020607200220.A1657@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg,

 I have several IDE controllers on the board.
My system have 65Mbytes RAM on the board, and it uses
256 Mbytes as swap devices.

I tried the same on the PC-386 linux, it comes in about 2-3 seconds for 120G
Reiserfs.
I use linux2.4.18 on my PC.

According to your openion and FAQ on www.namesys.com , there may be two
issues;
one is RAM shortage for bitmap, another is to use Linux2.4.13 or above for
ARM platform.

Could it be both?

Could you help me what( or how) I need to investigate?

Thanks,

Bo

----- Original Message -----
From: "Oleg Drokin" <green@namesys.com>
To: "bo" <bo@sosnetwork.net>
Cc: <reiserfs-list@namesys.com>
Sent: Friday, June 07, 2002 9:02 AM
Subject: Re: [reiserfs-list] Mount and file system size issue


> Hello!
>
>    reiserfs reading all of the bitmaps immediately and stick bitmaps in
the RAM.
>    So if reading all of the bitmaps on 120G volume, that means
>    reading 960 4k sectors off the media (each 32M there is bitmap on
disk).
>    That would eat at least 4 megabytes of RAM.
>    Actually if you can do a profiling to see what reiserfs does during
mounting,
>    that would be interesting.
>    Also you have not answered what kind of media you are using.
>
>    ext2/3 read bitmap blocks on demand on the other side.
>
> Bye,
>     Oleg
> On Fri, Jun 07, 2002 at 08:49:13AM -0700, bo wrote:
> > It is our new product.
> > When I use ext2fs it mounts 120G filesystem successfully in about 3-4
> > seconds,
> > but I waited for about an hour with the REISERFS, never came back.
> >
> > I know Linux 2.4.5 is far behind from the release. I want to know the
reason
> > why
> > I have this MOUNTproblem for the big FS.
> >
> > Thanks,
> >
> > Bo
> > ----- Original Message -----
> > From: "Oleg Drokin" <green@namesys.com>
> > To: "bo" <bo@sosnetwork.net>
> > Cc: <reiserfs-list@namesys.com>
> > Sent: Friday, June 07, 2002 12:21 AM
> > Subject: Re: [reiserfs-list] Mount and file system size issue
> >
> >
> > > Hello!
> > >
> > > On Thu, Jun 06, 2002 at 02:09:31PM -0700, bo wrote:
> > >
> > > > I am running the ARM-Linux, which is based on Debian 2.4.5.
> > >
> > > 2.4.5 is way too outdated for purposes of using reiserfs.
> > >
> > > > I tried to make and mount the reiserfs on 20G size, it was OK.
> > > > However, for 120G size, it is OK to make the file system but
> > > > I can not mount it.
> > >
> > > What do you mean by "cannot mount"?
> > > What is the error message if you get one?
> > >
> > > > Most of time it never come back from "mount -reiserfs ".
> > >
> > > Ah, so it just mounts, but does very slow.
> > > BTW, how you get 120GB on your ARM system?
> > > Do you have IDE controller and HDD attached to it or is this something
> > > accessed over network?
> > >
> > > > Is it really a problem of Linux revision?
> > > > Should I upgrade my linux to 2.4.13 or above to make the REISERFS
work?
> > >
> > > Upgrading to 2.4.18 is highly advisable.
> > >
> > > Bye,
> > >     Oleg
> > >
> >
>

