From: Sander <sander@humilis.net>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 19:30:46 +0100
Message-ID: <20041230183046.GD5206@favonius>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local> <m38y7gx8kq.fsf@merlin.emma.line.org> <20041230235911.4911a20c.hihone@bigpond.net.au> <m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name> <20041230174732.GB5206@favonius> <87zmzvoeeo.fsf@quasar.esben-stien.name>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22962-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87zmzvoeeo.fsf@quasar.esben-stien.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Esben Stien <b0ef@esben-stien.name>
Cc: sander@humilis.net, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

Esben Stien wrote (ao):
> Sander <sander@humilis.net> writes:
> > Next time it is not their mistake, but instead a broken harddisk.
> > Undelete wont save them then.
> 
> We got pretty good tools to restore from a hd with bad blocks. 
> 
> dd it, loop it, fsck it. 
 
I'm sure a friend of mine disagrees with you after paying big bucks to a
Norway based disk recovery company after a disk crash and zero backups.
A Dutch recovery company couldn't recover the disk.

And restore from backup is always quicker and less stressful on the
nerves.

> > Or they just edited it instead of rm.
> 
> This is handled in user space.

Maybe in your situation. But in general I advice everybody to make
backups. Might also be the reason nobody wrote a reiser4 undelete plugin
yet.
