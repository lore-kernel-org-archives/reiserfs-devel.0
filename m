From: Marc-Christian Petersen <m.c.p@gmx.net>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Mon, 24 Feb 2003 19:05:56 +0100
Message-ID: <200302241905.56193.m.c.p@gmx.net>
References: <1045870331.16048.325.camel@tiny.suse.com> <3E59787F.2030009@mb.tu-ilmenau.de> <200302241859.16343.m.c.p@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302241859.16343.m.c.p@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Chris Mason <mason@suse.com>

On Monday 24 February 2003 18:59, Marc-Christian Petersen wrote:

Hi again,

> > I see a performance decrease with my copies in data=3Dordered mode by
> > about 7.5% compared to the 2.4.20-pre10-data-logging (it's about 19%
> > decrease for 2.4.21-pre4 since 2.4.19-data-logging). What is causing
> > this? Partly I can blame it on the disk content distribution that
> > changed. If I removed the kinoded related patches would the throughpu=
t
> > rate increase?
> I can confirm that this is also true for me. I am using the -aa
> data-logging 36.
grmpf, I forgot to add one thing here ;(

I just tried it with:

- time seq -f "%06.0f" 1 100000  | xargs touch

v35-aa took about 4 seconds to complete this.
v36-aa took about 6 seconds to compelte this.

Mounted with:
nosuid,nodev,noexec,noatime,nodiratime,notail,block-allocator=3Dnoborder

It is my SQUID cache directory.

ciao, Marc


