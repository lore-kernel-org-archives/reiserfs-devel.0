From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: reiserfs 3.5.x partition and corruption - please help
Date: Sat, 30 Mar 2002 18:45:46 +0100
Message-ID: <200203301845.46677.Dieter.Nuetzel@hamburg.de>
References: <200203292109.46370.Dieter.Nuetzel@hamburg.de> <20020330171823.GA365@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020330171823.GA365@debian>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rajesh Fowkar <rfowkar@goatelecom.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Samstag, 30. M=E4rz 2002 :18, you wrote:
> On 29/03/02 at 21:09 - Dieter N?tzel said in public:
> >On Friday, 29. March 2002 07:58:32, Rajesh Fowkar wrote:
> >> Hi,
> >>
> >> I have got a primary partition of 1.5 GB on which I created reiserfs
> >> file debian:~# dpkg -l |grep reiser
> >> ii  reiserfsprogs  3.x.1a-2       User-level tools for ReiserFS
> >> filesystems
> >
> >Hello,
> >
> >first of all I think that you should start with the latest reiserfprogs
> > tools and let debian woody's e2fsprogs alone.
> >
> >ftp://ftp.namesys.com/pub/reiserfsprogs/pre
> >reiserfsprogs-3.x.1c_pre1.tar.gz
> >or
> >reiserfsprogs-3.x.1b.tar.gz (final)
>
> Hi,
>
> After upgrading to reiserfsprogs-3.x.1b I could rebuild and recover some =
of
> the files. However some of the files got corrupted.
>
> Thanks for the reply.
>
> >When all is smooth again you could switch to 3.6 format (kernel 2.4) with
> >mount -conv.
>
> At present I am using kernel 2.4.18 compiled on my machine.
>
> >Happy Easter!
>
> Happy Easter to you too.
>
> Peace

I only forwarded this to the list, so that all know what's going on.

-Dieter
