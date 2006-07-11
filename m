From: Hans Reiser <reiser@namesys.com>
Subject: Re: any way to disable fsync?
Date: Tue, 11 Jul 2006 14:42:07 -0700
Message-ID: <44B41B2F.6060300@namesys.com>
References: <op.tcjl3meld4os1z@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.tcjl3meld4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-2?Q?=A3ukasz_Mierzwa?= <prymitive@pcserwis.net>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

=A3ukasz Mierzwa wrote:

> Hi
>
> I got problem with apps that are calling fsync, it makes my hard
> drive  flush like mad and it slows down things quite a lot.
> Example:
> I'm using amarok and amrok uses sqlite for storing data, sqlite calls=20
> fsync after every write so on song change amarok writes to sqlite
> some  statistic data about what I listen and sqllite calls fsync, now
> I got  amarok trying to load next song and sqlite fsyncing and the
> problem is  that fsyncing under reiser4 is expensive, it takes a lot
> of time even if  I'm only running amarok and nothing else ( I got
> 4200RPM drive in my  notebook so it;s not a speed daemon).  I patched
> sqlite in amarok to fake  all fsync and it fixed it but there are
> other apps that try to secure my  data by syncing (I'm now running
> azareus and only fsyncs called every  minute can explain writing to
> disk at full speed almost non stop while I'm  downloading only 64KB/s ).
> So my question is: is there any way to disable fsync for reiser4?
> (beside  patching it to fake fsync instead of doing them).
> Thanks for great fs.
>
> =A3ukasz Mierzwa
>
>
Just insert a return in the fsync code, it will be an amusing beginner
kernel project for you.  If you make it into a mount option we'll give
you credit in the code for it.

Alternatively, wait a few months, and fsync will be optimized.
