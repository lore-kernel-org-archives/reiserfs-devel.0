From: Oleg Drokin <green@namesys.com>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Sat, 29 Mar 2003 14:59:20 +0300
Message-ID: <20030329145920.B28628@namesys.com>
References: <200303281828.55093.bernd-schubert@web.de> <20030329140145.A24789@namesys.com> <200303291254.02498.bernd-schubert@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303291254.02498.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Mar 29, 2003 at 12:54:02PM +0100, Bernd Schubert wrote:
> > > due to hardware problems I just started our fall back server and got
> > > these messages for 2 files:
> > > nfsd-fh: found a name that I didn't expect: bin/uptime
> > > nfsd-fh: found a name that I didn't expect: bin/uptime
> > > nfsd: last server has exited
> > > nfsd: unexporting all filesystems
> > > nfsd-fh: found a name that I didn't expect: lib/libident.so.0
> > > nfsd-fh: found a name that I didn't expect: lib/libident.so.0
> > Hm. Does the message is visible each time you access those files?
> Yes, probably since uptime and libident.so.0 were called in and endless loop 
> from the clients, the nfs-servers log was filled with those messages and I 
> had to stop the nfsd and do the cp- and mv-procedure for those files.

Hm.

> > Does reiserfsck have found anything?
> As I said, the backup script runs a reiserfsck itself and found no problems, I 
> hope there is no corruption after a simple boot, but I will check this later 
> on this day.

Ok, let us know of the results.

> > We do not yet understand on how to reproduce that locally, because this
> > message indicates pretty strange conditions.
> Is there anything I can do to debug this, when I observe this phenomena the 
> next time  (e.g. enabling nfs-debugging via proc, etc) ?

Please try to reboot the server not changing fs, if the problem still persists,
then take FS metadata snapshot (debugreiserfs -p /dev/device | bzip2 -9c >metadata.bz2,
use recent reiserfsprogs please) and make it available for us to download, please.

Thank you.

Bye,
    Oleg
