From: =?iso-8859-1?q?berny=AE?= <berny@mclink.it>
Subject: Re: Reiser4 Netbeans 6 problems
Date: Fri, 29 Feb 2008 17:07:17 +0100
Message-ID: <200802291707.17501.berny@mclink.it>
References: <200802272135.41599.berny@mclink.it> <5c7c368b0802290456hbf3db9cu52ae4b9ee56920a9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5c7c368b0802290456hbf3db9cu52ae4b9ee56920a9@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hi Edward, Thanks for the reply.
My console is usually working, I had this problems only after convertin=
g my=20
partitions to reiser4 this was the reason why I was thinking it was a r=
eiser4=20
related problem, anyway may be you are right.
I'm a risky man but I think I will wait that your patch will be put in =
your=20
official reiser4 patch release. I use this pc for work...so best not pl=
ay too=20
much with fate :-)
May be is best to disable fsync, my pc has UPS.

Many thanks and warm regards, Paolo

PS: go on with the work reiser4 design is wonderfull!


On Friday 29 February 2008 13:56:38 you wrote:
> On Wed, Feb 27, 2008 at 11:35 PM, berny(R) <berny@mclink.it> wrote:
> > Hi, Edward.
>
> Hello
>
> >  Last week I reformat my Ubuntu 7.10 64bit system to try Reiser4
> > filesystem (actually I'm using reiserfs 3.6).
> >  I put all my partition (even / and except boot) on reiser4 kernel =
was
> > 2.6.24 compiled in the kernel.
> >
> >  I got strange problems:
> >  the first was with netbeans java IDE, when I was compiling in the =
window
> > on the bottom of the screen I got only garbage (like little square)=
 like
> > when you have a different char set than the good one!
> >  After that the java app was working but it was impossible to see c=
ompile
> >  warnings or errors.
>
> This looks like broken console settings not related to reiser4.
> Something similar can happen after trying to read a file which
> contains unreadable symbols..
>
> >  The second thing that happened was that sometimes my kde 3 desktop
> > became frozen, for example, konqueror window open then click on the
> > cross, the system froze for 10 seconds then the window close and al=
l was
> > normal again.
>
> If system freezes look annoying for you, then I can send an experimen=
tal
> patch against them.
>
> As per fsync-bound application freezes: there is no any instant remed=
y
> for now except disabling reiser4-specific fsync. Such solution requir=
es
> an UPS (unpopular option).
>
> Thanks,
> Edward.
>
> >  I formatted with standard options and also standard mount options =
for
> > all the drives and partition.
> >
> >  My system is a striker extreme board, intel core 2 duo 2.4 4 gb Ki=
ngston
> >  hiperX ram, 2 barracuda 500 Gb.
> >
> >  Do you have some suggestions expecially about the java stuff?
> >  Now I'm back to reiser 3.6 because I need to work with netbeans!
> >
> >  Thanks, warm regards.
> >  Paolo
> >
> >
> >  -
> >  To unsubscribe from this list: send the line "unsubscribe
> > reiserfs-devel" in the body of a message to majordomo@vger.kernel.o=
rg
> >  More majordomo info at  http://vger.kernel.org/majordomo-info.html



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
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
