From: Oleg Drokin <green@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Sat, 15 Feb 2003 16:23:47 +0300
Message-ID: <20030215162347.A3598@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com> <200302151551.12765.vitaly@namesys.com> <2164549156.20030215140454@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <2164549156.20030215140454@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Feb 15, 2003 at 02:04:54PM +0100, Anders Widman wrote:
> > Ok, so probably we should make the following changes. The kernel set IO=
_ERROR
> > and FS_ERROR flags.=20
> > In the case of IO_ERROR reiserfsck prints the message about hardware pr=
oblems
> > and returns error, so the fs does not get mounted at boot. On attempt m=
ounting
> > the fs with IO_ERROR flag set it is mounted ro with some message about =
hardware
> > problems. When you are sure that problems disappeared you can mount it =
with a
> > spetial option cleaning this flag and probably reiserfstune will have s=
ome
> > option cleaning these flags also.
> > In the case of FS_ERROR - search_by_key failed or beyond end of device =
access
> > or similar - reiserfsck gets -a option at boot, replays the journal if =
needed
> > and checks for the flag. No flag - returns OK. Else - run fix-fixable. =
Errors
> > left - returns 'errors left uncorrected' and the fs does not get mounte=
d at
> > boot. On attempt mounting the fs with the flag just print the message a=
bout
> > mounting the fs with errors and mount it. Not ro here as kernel will no=
t do
> > deep analysis of errors and it could be just a small insignificant erro=
r.
>   What  happens if there are FS errors on boot device? Not mounting ro

It get's mounted readonly first, then fsck will exit with appropriate error=
 code,
then system will refuse to continue booting process, I presume ;)

>   will  make  system  inaccessible unless users has some other boot or
>   rescue media.

Sure, just like with any other filesystem.
If you want to avoid that, don't run fsck on your root device during boot,
or ignore what it have said to you ;)

>   Of  course, this  is  where  admins  should  have  another  disk  or
>   partition to boot and make FS repairs. :)

Actually it is possible to reiserfsck (readonly) mounted filesystem. The on=
ly
prerequisite I found is reiserfsck binary (built statically it seems, or
with all the libs) should be located on another fs (tmpfs works just fine f=
or me).
And of course little bit of reiserfsck patching is needed ;)
That's how I repair broken root filesystems on our test-boxes when rootfs i=
s getting
corrupt, because some moron=08clear guy have not created rescue partition i=
n there
and I hate booting from CDs (And CDs usually have outdated reiserfsck anywa=
y).=20

Bye,
    Oleg
