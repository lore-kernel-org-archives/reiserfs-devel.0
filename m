From: Oleg Drokin <green@namesys.com>
Subject: Re: NFS setup for a reiserfs-based /home
Date: Wed, 25 Sep 2002 17:51:28 +0400
Message-ID: <20020925175128.A3477@namesys.com>
References: <20020924215756.GA24963@jerry.marcet.dyndns.org> <20020925114009.B23339@namesys.com> <200209251533.19567.Dieter.Nuetzel@hamburg.de> <20020925173718.A17138@namesys.com> <20020925154626.S32363@noris.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020925154626.S32363@noris.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Urlichs <smurf@noris.de>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Javier Marcet <jmarcet@pobox.com>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Wed, Sep 25, 2002 at 03:46:27PM +0200, Matthias Urlichs wrote:

> > > I'll suggest RAID5 (4 or more disks plus 1 or more spare) for all your 
> > > storage.
> > RAID5 is CPU hungry on writes, also writes are slower compared to RAID1.
> ... on the other hand, you need fewer disks than with RAID1.  ;-)

On the third hand, in RAID1 setup with N disks I won't mind failure of
N-1 disks. ;)

> Anyway, reasonably fast hardware RAID controllers do exist, so this isn't
> necessarily a problem.

This is just matter of truest, if you trust the binary closed source firmware
from such a device, that it will handle failures and this kind of stuff
correctly, go for it.
With Linux' softraid paranoid people can verify their own worst assumptions by
just reading source code ;)

Bye,
    Oleg
