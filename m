From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Fri, 17 May 2002 21:44:21 +0200
Message-ID: <200205172144.21544.Dieter.Nuetzel@hamburg.de>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de> <200205171905.30804.Dieter.Nuetzel@hamburg.de> <20020517222846.A1514@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10374-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020517222846.A1514@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

On Friday 17 May 2002 20:28, Oleg Drokin wrote:
> Hello!
>
> On Fri, May 17, 2002 at 07:05:30PM +0200, Dieter N?tzel wrote:
> > > What is the corruption pattern?
> >
> > Have a look into the two examples.
>
> I will, but later, it seems.
>
> > > What was the crash, btw?
> > > Hard power loss?
> >
> > No.
> > "Only" hard lookup. Sadly SysReq is not working ;-(
>
> And you fix it by "reset switch"?

Yes, but fix? 8-)
System come up "normal" do the replay and is smooth except of the "few" bro=
ken=20
files.

> BTW, Was that you with a kernel with lot of patches applied, or
> you do not use anything strange on your workstations?

Yes, but it happen with and without data logging, preemption, aa_VM, etc.

I can reproduce it with some "new" page coloring stuff (only).
When I modprobe the page coloring module (it is under development) the syst=
em=20
lookup from time to time during heavy (parallel) compilation for example.
Then I get the broken files.

> > > > written before/during crash and rebuild during replay, but it should
> > > > much more usefull if they were only _REMOVED_ during replay. Because
> > > > the "next" kernel build can't run smooth without "make clean" or
> > > > deletion by hand. What do you think?
> > >
> > > These files are not deleted, so why fs should delete these?
> >
> > Yes, you are right. But semantically they are worthless 'cause they are
> > "broken"...
>
> FS cannot know this. Absolutely cannot.

Yes, I know for sure.

> File was created, written into. So file appears after reboot (if
> transaction in which it was created was commited).

Maybe the FS should have some knowledge "build in" to "decide" that *.o fil=
es=20
are "temper=E4r" and should be removed during replay?

> BTW, I have a feeling that datalogging patches would help to get rid of
> garbage in the files, but files still will remain (may be of zero length).

Yes, Chris said this, too.

>
> > > > Have a look into the falsely "rebuild" broken files in the
> > > > attachment, too.
> > >
> > > Later today
> >
> > Hey, it's weekend then...;-)
>
> So what? ;)

:-)

> > Happy Whitsun everyone!
>
> Hm. What's that? ;)

Here in Germany the two Whitsun days Sunday and Monday are (high christian)=
=20
feasts and most people are out for short vacation.

-Dieter

BTW I have to work, tomorrow ;-)
