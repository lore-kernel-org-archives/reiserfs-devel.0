From: Oleg Drokin <green@namesys.com>
Subject: Re: NFS setup for a reiserfs-based /home
Date: Wed, 25 Sep 2002 17:37:18 +0400
Message-ID: <20020925173718.A17138@namesys.com>
References: <20020924215756.GA24963@jerry.marcet.dyndns.org> <20020925114009.B23339@namesys.com> <200209251533.19567.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200209251533.19567.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Javier Marcet <jmarcet@pobox.com>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Wed, Sep 25, 2002 at 03:33:19PM +0200, Dieter N?tzel wrote:
> > > As I said, I'm a newbie on NFS, and I've been reading quite a lot about
> > > the interactions of it with journalling file systems. Namely, last thing
> > > I remeber is I should put the journal on a different volume, if at all
> > No, this is not required for NFS (And never was).
> > There is nothing special about running NFS off reiserfs (v3.6 on-disk
> > format) filesystems. (in case of kernel nfsd, there are some difficulties
> > with userspace nfsd, so it should be avoided).
> Excuse me but this is not clear for me.
> Oleg, you told him to avoid knfsd?

No I said to avoid unfsd (I already made that clear in separate private email)

> > You may want to put your /home volume on some kind of RAID1 device to
> > increase data safeness from hardware errors and to increase access (read)
> > speed. (but this is storage space ineffective of course).
> I'll suggest RAID5 (4 or more disks plus 1 or more spare) for all your 
> storage.

RAID5 is CPU hungry on writes, also writes are slower compared to RAID1.

Bye,
    Oleg
