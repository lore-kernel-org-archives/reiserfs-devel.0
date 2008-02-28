From: =?iso-8859-15?q?berny=AE?= <berny@mclink.it>
Subject: Re: Reiser4 Netbeans 6 problems
Date: Thu, 28 Feb 2008 09:26:56 +0100
Message-ID: <200802280926.56119.berny@mclink.it>
References: <200802272135.41599.berny@mclink.it> <47C5E204.2040607@inn.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47C5E204.2040607@inn.nl>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arend Freije <afreije@inn.nl>
Cc: reiserfs-devel@vger.kernel.org

Thanks, Arend I will try this!
That problem for me was only with reiser4, no problem with 3.6 release.

Warm reagrds, Paolo





On Wednesday 27 February 2008 23:19:48 you wrote:
> berny=AE wrote:
> > Hi, Edward.
> > Last week I reformat my Ubuntu 7.10 64bit system to try Reiser4
> > filesystem (actually I'm using reiserfs 3.6).
> > I put all my partition (even / and except boot) on reiser4 kernel w=
as
>
> 2.6.24
>
> > compiled in the kernel.
> >
> > I got strange problems:
> > the first was with netbeans java IDE, when I was compiling in the
>
> window on
>
> > the bottom of the screen I got only garbage (like little square) li=
ke
> > when you have a different char set than the good one!
> > After that the java app was working but it was impossible to see co=
mpile
> > warnings or errors.
> >
> > The second thing that happened was that sometimes my kde 3 desktop =
became
> > frozen, for example, konqueror window open then click on the cross,=
 the
> > system froze for 10 seconds then the window close and all was norma=
l
> > again.
> >
> > I formatted with standard options and also standard mount options f=
or
>
> all the
>
> > drives and partition.
> >
> > My system is a striker extreme board, intel core 2 duo 2.4 4 gb Kin=
gston
> > hiperX ram, 2 barracuda 500 Gb.
> >
> > Do you have some suggestions expecially about the java stuff?
> > Now I'm back to reiser 3.6 because I need to work with netbeans!
>
> Hi Paolo,
>
> Interesting that you see the squares in the Netbeans output window.
> I've seen them too but it didn't occur to me that it would be related
> to Reiser4. I'm running on a Gentoo box, Athlon XP 2400+,  kernel
> 2.6.22 with Reiser4 on all partitions, Netbeans 6 built from sources.
> I noticed that the squares appear initially but when the log grows
> (over a few KiB), the squares turn to normal characters. To force the
> log to grow, I changed the Ant verbosity to "verbose"
> (Tools/Options/Miscellaneous/Ant).
> Sometimes with a short log the blocks in the output window disappear
> when the compilation or XML transformation is repeated.
>
> Kind regards,
>
> Arend
>
>
>
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
