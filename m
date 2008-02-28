From: =?utf-8?q?berny=C2=AE?= <berny@mclink.it>
Subject: Re: Reiser4 Netbeans 6 problems
Date: Thu, 28 Feb 2008 12:11:10 +0100
Message-ID: <200802281211.10536.berny@mclink.it>
References: <200802272135.41599.berny@mclink.it> <200802280924.06538.berny@mclink.it> <a08621850802280158j4d83ff0ap636fc8dea9de1747@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a08621850802280158j4d83ff0ap636fc8dea9de1747@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi,  Dushan.
I think that it was happening something like this.
The overall imperssion that I had using the file system was of extremel=
y fast=20
moments with many lock intervals where the system was like frozen.
May be is best to have some fancy options in fstab for mounting.
But anyway I'm sure that noatime was on:=20
reiser4 		defaults,noatime,nodiratime        0       0

That was.

Thanks, Paolo



On Thursday 28 February 2008 10:58:42 you wrote:
> It's not wrong.
> I remember that there were stalls when fs was mounted without -noatim=
e
> option because there was a lot of atime updates that were batched.
> This behaviour was fixed I think, but I asked you to see if it reappe=
ared
> again.
>
> Thanks
> Dushan
>
> On Thu, Feb 28, 2008 at 9:24 AM, berny(R) <berny@mclink.it> wrote:
> > On Thursday 28 February 2008 07:11:45 you wrote:
> > > And about freezing, are you using -noatime mount option for your
> > > reiser4 partition or not?
> >
> > Yes, I'm using noatime option for all partitions. Was there wrong?
> >
> > Paolo
> >
> > > On Wed, Feb 27, 2008 at 11:19 PM, Arend Freije <afreije@inn.nl> w=
rote:
> > > > berny(R) wrote:
> > > > > Hi, Edward.
> > > > > Last week I reformat my Ubuntu 7.10 64bit system to try Reise=
r4
> > > >
> > > > filesystem
> > > >
> > > > > (actually I'm using reiserfs 3.6).
> > > > > I put all my partition (even / and except boot) on reiser4 ke=
rnel
> >
> > was
> >
> > > > 2.6.24
> > > >
> > > > > compiled in the kernel.
> > > > >
> > > > > I got strange problems:
> > > > > the first was with netbeans java IDE, when I was compiling in=
 the
> > > >
> > > > window on
> > > >
> > > > > the bottom of the screen I got only garbage (like little squa=
re)
> >
> > like
> >
> > > > when
> > > >
> > > > > you have a different char set than the good one!
> > > > > After that the java app was working but it was impossible to =
see
> > > > > compile warnings or errors.
> > > > >
> > > > > The second thing that happened was that sometimes my kde 3 de=
sktop
> > > >
> > > > became
> > > >
> > > > > frozen, for example, konqueror window open then click on the =
cross,
> >
> > the
> >
> > > > > system froze for 10 seconds then the window close and all was
> > > > > normal
> > > >
> > > > again.
> > > >
> > > > > I formatted with standard options and also standard mount opt=
ions
> >
> > for
> >
> > > > all the
> > > >
> > > > > drives and partition.
> > > > >
> > > > > My system is a striker extreme board, intel core 2 duo 2.4 4 =
gb
> > > > > Kingston hiperX ram, 2 barracuda 500 Gb.
> > > > >
> > > > > Do you have some suggestions expecially about the java stuff?
> > > > > Now I'm back to reiser 3.6 because I need to work with netbea=
ns!
> > > >
> > > > Hi Paolo,
> > > >
> > > > Interesting that you see the squares in the Netbeans output win=
dow.
> > > > I've seen them too but it didn't occur to me that it would be r=
elated
> > > > to Reiser4. I'm running on a Gentoo box, Athlon XP 2400+,  kern=
el
> > > > 2.6.22 with Reiser4 on all partitions, Netbeans 6 built from so=
urces.
> > > > I noticed that the squares appear initially but when the log gr=
ows
> > > > (over a few KiB), the squares turn to normal characters. To for=
ce the
> > > > log to grow, I changed the Ant verbosity to "verbose"
> > > > (Tools/Options/Miscellaneous/Ant).
> > > > Sometimes with a short log the blocks in the output window disa=
ppear
> > > > when the compilation or XML transformation is repeated.
> > > >
> > > > Kind regards,
> > > >
> > > > Arend
> > > >
> > > >
> > > >
> > > >
> > > > -
> > > > To unsubscribe from this list: send the line "unsubscribe
> >
> > reiserfs-devel"
> >
> > > > in
> > > > the body of a message to majordomo@vger.kernel.org
> > > > More majordomo info at  http://vger.kernel.org/majordomo-info.h=
tml



--=20
Mail To:
 berny@mclink.it

My Icq:95939684
My yahoo:mailer227
Aim:berny9944566
Msn:fugazzi995@hotmail.com
=20
Home Page: http://www.ukbor.net

"The day you decide that it is better to be a hypocrite and just do wha=
tever=20
everybody else is doing and not be different, you have died you have=20
committed suicide."=20

"If you can love, love! If you cannot love, forget this one, find someb=
ody
  else. But don't waste time! The question is not of this lover or that=
 lover
  the question is of love. Love fullfills, people are just excuses."

"The moment you trust in let-go, the moment you stop struggling against=
=20
existence, you need not worry about anything; existence takes care.But =
it=20
takes care in its own way, not according to your desires, because if yo=
u have=20
desires, demands, you are not trusting existence. Trust simply means th=
at=20
whatever is happening and is going to happen is perfectly right.=20
Existence is wiser than any individual, because an individual has a sma=
ll=20
consciousness. Even if he is enlightened he is still just a dewdrop in =
this=20
vast ocean of existence. And what existence feels is right.
Existence cannot go wrong.=20
If it does not fulfill our desires, that simply means our desires were =
wrong."


=C2=A9CopyRight 1998-2008 UKBOR Corp.=C2=AE
   All Right Reserved.
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
