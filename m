From: =?iso-8859-1?q?berny=AE?= <berny@mclink.it>
Subject: Re: Reiser4 Netbeans 6 problems
Date: Thu, 28 Feb 2008 12:41:28 +0100
Message-ID: <200802281241.28752.berny@mclink.it>
References: <200802272135.41599.berny@mclink.it> <200802281211.10536.berny@mclink.it> <a08621850802280316h41feae89ie505b09942dacdb3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a08621850802280316h41feae89ie505b09942dacdb3@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Ok, I will do that, but before I have to format again with reiser4, the=
n I=20
will try also the netbeans solution.
I put reiser 3.6 again because I need to use netbeans for my work.

Thanks, that are your reiser4 time numbers?




On Thursday 28 February 2008 12:16:18 you wrote:
> Then it's something else.
> BTW, nodiratime is unnecessary when you use noatime, it's a subset of=
 it.
> I can't reproduce it, but I use GMOME :)
> Try to time sync sometimes, and see what happens.
>
> dusan@krshina3 ~ $ time sync
>
> real    0m1.330s
> user    0m0.000s
> sys    0m0.005s
>
> On Thu, Feb 28, 2008 at 12:11 PM, berny(R) <berny@mclink.it> wrote:
> > Hi,  Dushan.
> > I think that it was happening something like this.
> > The overall imperssion that I had using the file system was of extr=
emely
> > fast moments with many lock intervals where the system was like fro=
zen.
> > May be is best to have some fancy options in fstab for mounting. Bu=
t
> > anyway I'm sure that noatime was on:
> > reiser4                 defaults,noatime,nodiratime        0       =
0
> >
> > That was.
> >
> > Thanks, Paolo
> >
> > On Thursday 28 February 2008 10:58:42 you wrote:
> > > It's not wrong.
> > > I remember that there were stalls when fs was mounted without -no=
atime
> > > option because there was a lot of atime updates that were batched=
=2E
> > > This behaviour was fixed I think, but I asked you to see if it
> > > reappeared again.
> > >
> > > Thanks
> > > Dushan
> > >
> > > On Thu, Feb 28, 2008 at 9:24 AM, berny(R) <berny@mclink.it> wrote=
:
> > > > On Thursday 28 February 2008 07:11:45 you wrote:
> > > > > And about freezing, are you using -noatime mount option for y=
our
> > > > > reiser4 partition or not?
> > > >
> > > > Yes, I'm using noatime option for all partitions. Was there wro=
ng?
> > > >
> > > > Paolo
> > > >
> > > > > On Wed, Feb 27, 2008 at 11:19 PM, Arend Freije <afreije@inn.n=
l>=20
wrote:
> > > > > > berny(R) wrote:
> > > > > > > Hi, Edward.
> > > > > > > Last week I reformat my Ubuntu 7.10 64bit system to try R=
eiser4
> > > > > >
> > > > > > filesystem
> > > > > >
> > > > > > > (actually I'm using reiserfs 3.6).
> > > > > > > I put all my partition (even / and except boot) on reiser=
4
> > > > > > > kernel
> > > >
> > > > was
> > > >
> > > > > > 2.6.24
> > > > > >
> > > > > > > compiled in the kernel.
> > > > > > >
> > > > > > > I got strange problems:
> > > > > > > the first was with netbeans java IDE, when I was compilin=
g in
> > > > > > > the
> > > > > >
> > > > > > window on
> > > > > >
> > > > > > > the bottom of the screen I got only garbage (like little
> > > > > > > square)
> > > >
> > > > like
> > > >
> > > > > > when
> > > > > >
> > > > > > > you have a different char set than the good one!
> > > > > > > After that the java app was working but it was impossible=
 to
> > > > > > > see compile warnings or errors.
> > > > > > >
> > > > > > > The second thing that happened was that sometimes my kde =
3
> > > > > > > desktop
> > > > > >
> > > > > > became
> > > > > >
> > > > > > > frozen, for example, konqueror window open then click on =
the
> > > > > > > cross,
> > > >
> > > > the
> > > >
> > > > > > > system froze for 10 seconds then the window close and all=
 was
> > > > > > > normal
> > > > > >
> > > > > > again.
> > > > > >
> > > > > > > I formatted with standard options and also standard mount
> > > > > > > options
> > > >
> > > > for
> > > >
> > > > > > all the
> > > > > >
> > > > > > > drives and partition.
> > > > > > >
> > > > > > > My system is a striker extreme board, intel core 2 duo 2.=
4 4 gb
> > > > > > > Kingston hiperX ram, 2 barracuda 500 Gb.
> > > > > > >
> > > > > > > Do you have some suggestions expecially about the java st=
uff?
> > > > > > > Now I'm back to reiser 3.6 because I need to work with
> > > > > > > netbeans!
> > > > > >
> > > > > > Hi Paolo,
> > > > > >
> > > > > > Interesting that you see the squares in the Netbeans output
> > > > > > window. I've seen them too but it didn't occur to me that i=
t
> > > > > > would be related to Reiser4. I'm running on a Gentoo box, A=
thlon
> > > > > > XP 2400+,  kernel 2.6.22 with Reiser4 on all partitions, Ne=
tbeans
> > > > > > 6 built from sources. I noticed that the squares appear ini=
tially
> > > > > > but when the log grows (over a few KiB), the squares turn t=
o
> > > > > > normal characters. To force the log to grow, I changed the =
Ant
> > > > > > verbosity to "verbose"
> > > > > > (Tools/Options/Miscellaneous/Ant).
> > > > > > Sometimes with a short log the blocks in the output window
> > > > > > disappear when the compilation or XML transformation is rep=
eated.
> > > > > >
> > > > > > Kind regards,
> > > > > >
> > > > > > Arend
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > -
> > > > > > To unsubscribe from this list: send the line "unsubscribe
> > > >
> > > > reiserfs-devel"
> > > >
> > > > > > in
> > > > > > the body of a message to majordomo@vger.kernel.org
> > > > > > More majordomo info at=20
> > > > > > http://vger.kernel.org/majordomo-info.html
> >
> > --
> > Mail To:
> >  berny@mclink.it
> >
> > My Icq:95939684
> > My yahoo:mailer227
> > Aim:berny9944566
> > Msn:fugazzi995@hotmail.com
> >
> > Home Page: http://www.ukbor.net
> >
> > "The day you decide that it is better to be a hypocrite and just do
> > whatever everybody else is doing and not be different, you have die=
d you
> > have committed suicide."
> >
> > "If you can love, love! If you cannot love, forget this one, find
> > somebody else. But don't waste time! The question is not of this lo=
ver or
> > that lover the question is of love. Love fullfills, people are just
> > excuses."
> >
> > "The moment you trust in let-go, the moment you stop struggling aga=
inst
> > existence, you need not worry about anything; existence takes care.=
But it
> > takes care in its own way, not according to your desires, because i=
f you
> > have desires, demands, you are not trusting existence. Trust simply=
 means
> > that whatever is happening and is going to happen is perfectly righ=
t.
> > Existence is wiser than any individual, because an individual has a=
 small
> > consciousness. Even if he is enlightened he is still just a dewdrop=
 in
> > this vast ocean of existence. And what existence feels is right.
> > Existence cannot go wrong.
> > If it does not fulfill our desires, that simply means our desires w=
ere
> > wrong."
> >
> >
> > (c)CopyRight 1998-2008 UKBOR Corp.(R)
> >   All Right Reserved.
>
> -
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



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


=A9CopyRight 1998-2008 UKBOR Corp.=AE
   All Right Reserved.
-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
