From: Brian Marr <cabernet@internode.on.net>
Subject: Re: Filesystem errors
Date: Wed, 17 Jul 2002 17:36:44 +0930
Message-ID: <200207171736.44485.cabernet@internode.on.net>
References: <200207160146.01440.cabernet@internode.on.net> <200207160222.50147.cabernet@internode.on.net> <20020717094252.C4841@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020717094252.C4841@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs list <reiserfs-list@namesys.com>

Thanks for your comments. My system is still going under my watchful eye.=
 I=20
tried to copy the data using tar to a spare diskl
tar -cplf - -C /myhardrive . | tar -xpvf -
but this did not go far. I wonder if I could boot into rescue and do  a d=
d ?
I have not used this before.
Brian Marr




On Wednesday 17 July 2002 15:12, Oleg Drokin wrote:
> Hello!
>
> On Tue, Jul 16, 2002 at 02:22:50AM +0930, Brian Marr wrote:
> > What reiserfsck paramaters should I try ? Do I have to do --rebuild-t=
ree
> > ?
>
> You hard drive is failing, so yuo should backup all the data to other
> drive first, then you might want to revive your disk, or get it replace=
d
> (which is even beter).
> You better not to run reiserfsck or any other programs (besides tar or
> some other backup tool) on this disk, because you might loose even more
> data this way.
>
> Bye,
>     Oleg

