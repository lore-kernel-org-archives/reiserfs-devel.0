From: Oleg Drokin <green@namesys.com>
Subject: Re: NFS setup for a reiserfs-based /home
Date: Wed, 25 Sep 2002 11:40:09 +0400
Message-ID: <20020925114009.B23339@namesys.com>
References: <20020924215756.GA24963@jerry.marcet.dyndns.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11524-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020924215756.GA24963@jerry.marcet.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Javier Marcet <jmarcet@pobox.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Tue, Sep 24, 2002 at 11:57:56PM +0200, Javier Marcet wrote:
 
> As I said, I'm a newbie on NFS, and I've been reading quite a lot about
> the interactions of it with journalling file systems. Namely, last thing
> I remeber is I should put the journal on a different volume, if at all

No, this is not required for NFS (And never was).
There is nothing special about running NFS off reiserfs (v3.6 on-disk format)
filesystems. (in case of kernel nfsd, there are some difficulties with
userspace nfsd, so it should be avoided).

> That's my question then. What do you suggest me to get the most out of
> reiserfs (with which I'm really happy) for a server storing /home.
> Even if at the beginning it'll be small (only a few students), it'll
> most probably will be deployed campus-wide later on, hence I'd much
> prefer to set it up in a scalable way - storage space and speed-wise -
> from day one.

You may want to put your /home volume on some kind of RAID1 device to
increase data safeness from hardware errors and to increase access (read) speed.
(but this is storage space ineffective of course).

Bye,
    Oleg
