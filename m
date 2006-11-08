From: Francesco Biscani <biscani@pd.astro.it>
Subject: Re: Which version will be merged into mainline kernel?
Date: Wed, 8 Nov 2006 10:15:13 +0100
Message-ID: <200611081015.14320.biscani@pd.astro.it>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com> <454A596F.8070909@namesys.com> <194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30113-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Wednesday 08 November 2006 08:21, Clemens Eisserer wrote:
> Hello again,
>
> Thanks a lot for all the help, well ... I now use reiser4 as root-partiti=
on
> :-)
>
> Everything works ok and I haven't seen any crashes or compatibility
> problems, simply wonderful :-). If something bad happens I'll let you
> know ;)
>
> However performance is so-and-so, the system was faster with ext3,
> although I compiled the kernel with "-O3 -march=3Dpentium4
> -mtune=3Dpentium4 -mno-sse -mno-sse3". Booting the system into KDE takes
> about twice the time, although I have to admit I was using another
> harddrive - I now use a 60GB/4200RPM instead an 40GB/4200RPM which
> both show quite the same hdparm-results,
> I use the lzo1 plugin (default ccreg40).
>
> Are there some settings (or ext3 optimizations) in FC6, or could it be
> that some of my kernel-settings slow things down for FC6 (the same
> compiled kernel-binary was already used for ext3). The
> reiser4-partition is mounted with "noatime".
>
> These are some features I could imagine causing problems:
> * Inotify
> * Adaptive file readahead + hit feedback + fine grained readahead aging
> * Timer with 1kHz
> * Readahead-script of the distribution

I think the slow performance you're experiencing are caused by the fsync()=
=20
call not being well-optimized in reiser4. I've commented out the function i=
n=20
fs/buffer.c, and I'm having much better performance on my / partition.

HTH,

  Francesco

=2D-=20
Dr. Francesco Biscani
Dipartimento di Astronomia
Universit=E0 di Padova
biscani@pd.astro.it
