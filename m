From: Tom Vier <tmv@comcast.net>
Subject: Re: reiser4 data journalling?
Date: Tue, 2 Sep 2003 22:05:36 -0400
Message-ID: <20030903020536.GD9152@zero>
References: <3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero> <3F4E9C6D.2080009@namesys.com> <20030829012322.GJ21352@matchmail.com> <20030829050857.GA5755@namesys.com> <3F4F91DB.2080900@namesys.com> <16207.38985.871686.419166@laputa.namesys.com> <3F4FC8FD.1050303@namesys.com> <m3oey7m2ed.fsf@averell.firstfloor.org> <3F5517E0.6000403@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15521-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F5517E0.6000403@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, Sep 03, 2003 at 02:21:20AM +0400, Hans Reiser wrote:
> some IBM drives a power failure can cause a more than 4k chunk to go 
> bad, and that this can be a problem for filesystem consistency.

this thread talks about fsync, wb's, etc, and i think also mentions the
problem w/ an ibm drive. if not, it's in another thread from around the same
time. i forgot i had this linked on wipe.sf.net (shameless plug ;).

http://www.ussg.iu.edu/hypermail/linux/kernel/0103.0/0331.html

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
