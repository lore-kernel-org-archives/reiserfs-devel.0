From: Arend Freije <afreije@inn.nl>
Subject: Re: Reiser4 Netbeans 6 problems
Date: Wed, 27 Feb 2008 23:19:48 +0100
Message-ID: <47C5E204.2040607@inn.nl>
References: <200802272135.41599.berny@mclink.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200802272135.41599.berny@mclink.it>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?berny=AE?= <berny@mclink.it>
Cc: reiserfs-devel@vger.kernel.org

berny=AE wrote:
> Hi, Edward.
> Last week I reformat my Ubuntu 7.10 64bit system to try Reiser4 files=
ystem
> (actually I'm using reiserfs 3.6).
> I put all my partition (even / and except boot) on reiser4 kernel was
2.6.24
> compiled in the kernel.
>
> I got strange problems:
> the first was with netbeans java IDE, when I was compiling in the
window on
> the bottom of the screen I got only garbage (like little square) like=
 when
> you have a different char set than the good one!
> After that the java app was working but it was impossible to see comp=
ile
> warnings or errors.
>
> The second thing that happened was that sometimes my kde 3 desktop be=
came
> frozen, for example, konqueror window open then click on the cross, t=
he
> system froze for 10 seconds then the window close and all was normal =
again.
>
> I formatted with standard options and also standard mount options for
all the
> drives and partition.
>
> My system is a striker extreme board, intel core 2 duo 2.4 4 gb Kings=
ton
> hiperX ram, 2 barracuda 500 Gb.
>
> Do you have some suggestions expecially about the java stuff?
> Now I'm back to reiser 3.6 because I need to work with netbeans!
Hi Paolo,

Interesting that you see the squares in the Netbeans output window.
I've seen them too but it didn't occur to me that it would be related
to Reiser4. I'm running on a Gentoo box, Athlon XP 2400+,  kernel
2.6.22 with Reiser4 on all partitions, Netbeans 6 built from sources.
I noticed that the squares appear initially but when the log grows
(over a few KiB), the squares turn to normal characters. To force the
log to grow, I changed the Ant verbosity to "verbose"
(Tools/Options/Miscellaneous/Ant).
Sometimes with a short log the blocks in the output window disappear
when the compilation or XML transformation is repeated.

Kind regards,

Arend




-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
