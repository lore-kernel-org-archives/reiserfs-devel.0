From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: NFS setup for a reiserfs-based /home
Date: Wed, 25 Sep 2002 15:46:27 +0200
Message-ID: <20020925154626.S32363@noris.de>
References: <20020924215756.GA24963@jerry.marcet.dyndns.org> <20020925114009.B23339@namesys.com> <200209251533.19567.Dieter.Nuetzel@hamburg.de> <20020925173718.A17138@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020925173718.A17138@namesys.com>; from green@namesys.com on Wed, Sep 25, 2002 at 05:37:18PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Javier Marcet <jmarcet@pobox.com>, reiserfs-list <reiserfs-list@namesys.com>

Hi,

Oleg Drokin:
> > I'll suggest RAID5 (4 or more disks plus 1 or more spare) for all your 
> > storage.
> 
> RAID5 is CPU hungry on writes, also writes are slower compared to RAID1.
> 
... on the other hand, you need fewer disks than with RAID1.  ;-)

Anyway, reasonably fast hardware RAID controllers do exist, so this isn't
necessarily a problem.

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
