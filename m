From: Sander <sander@humilis.net>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 20:21:11 +0100
Message-ID: <20041230192111.GF5206@favonius>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local> <m38y7gx8kq.fsf@merlin.emma.line.org> <20041230235911.4911a20c.hihone@bigpond.net.au> <m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name> <20041230174732.GB5206@favonius> <87zmzvoeeo.fsf@quasar.esben-stien.name> <20041230183046.GD5206@favonius> <87d5wroc9a.fsf@quasar.esben-stien.name>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87d5wroc9a.fsf@quasar.esben-stien.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Esben Stien <b0ef@esben-stien.name>
Cc: sander@humilis.net, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

Esben Stien wrote (ao):
> Sander <sander@humilis.net> writes:
> > I'm sure a friend of mine disagrees with you after paying big bucks
> > to a Norway based disk recovery company after a disk crash and zero
> > backups. A Dutch recovery company couldn't recover the disk.
> 
> Probably IBAS;). What was the problem of the hd then?. Why couldn't
> the dutchies do the job?

Maybe the Dutch company is not that good :-)
It could be IBAS, but they didn't mention a company name. It has to be a
well know one. And your mention of gold in your other mail is very true
of course :-)

> When a file gets deleted, a proper procedure to retrieve it would be
> to umount the filesystem, scan it for the data which was removed and
> then put it back in the tree again. It's not like reiserfs overwrites
> this data, it's still there, so why should there be an artificial
> barrier to getting this data back?.

I did recover data that way several times back when I didn't do backups.
The problem is though that one file does not occupy one spot on the
harddisk. It might be spread all over the place. While the data might
still be there (on an idle disk), you miss the much needed pointers to
the data.
