From: Esben Stien <b0ef@esben-stien.name>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 19:46:09 +0100
Message-ID: <87d5wroc9a.fsf@quasar.esben-stien.name>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
	<m38y7gx8kq.fsf@merlin.emma.line.org>
	<20041230235911.4911a20c.hihone@bigpond.net.au>
	<m3sm5nj2ef.fsf@merlin.emma.line.org>
	<87is6jpvdu.fsf@quasar.esben-stien.name>
	<20041230174732.GB5206@favonius>
	<87zmzvoeeo.fsf@quasar.esben-stien.name>
	<20041230183046.GD5206@favonius>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041230183046.GD5206@favonius> (sander@humilis.net's message
 of "Thu, 30 Dec 2004 19:30:46 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sander@humilis.net
Cc: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

Sander <sander@humilis.net> writes:

>> dd it, loop it, fsck it. 
>  
> I'm sure a friend of mine disagrees with you after paying big bucks
> to a Norway based disk recovery company after a disk crash and zero
> backups.  A Dutch recovery company couldn't recover the disk.

Probably IBAS;). What was the problem of the hd then?. Why couldn't
the dutchies do the job?

> And restore from backup is always quicker and less stressful on the
> nerves.

Like I said to James, this might not only be the fault of the user. 

> Maybe in your situation. But in general I advice everybody to make
> backups. Might also be the reason nobody wrote a reiser4 undelete
> plugin yet.

It's no use to talk about backups when we talk about undelete
features; backups are for recovery after nuclear explosions, faulty
hardware which makes it inaccessible to even retrieve data out of it
or something similar.

It would be too expensive to do all this backup'ing in userspace. When
a file gets deleted, a proper procedure to retrieve it would be to
umount the filesystem, scan it for the data which was removed and then
put it back in the tree again. It's not like reiserfs overwrites this
data, it's still there, so why should there be an artificial barrier
to getting this data back?.

-- 
Esben Stien is b0ef@esben-stien.name
http://www.esben-stien.name
irc://irc.esben-stien.name/%23contact
[sip|iax]:b0ef@esben-stien.name
