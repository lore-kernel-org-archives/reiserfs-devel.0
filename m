From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 oopses...
Date: Wed, 5 Nov 2003 20:34:27 +0300
Message-ID: <20031105173427.GG11516@backtop.namesys.com>
References: <1068052906.12783.443.camel@mikeb.staff.netnation.com> <1068053280.5195.2.camel@redeeman.linux.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1068053280.5195.2.camel@redeeman.linux.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Redeeman <redeeman@metanurb.dk>
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

On Wed, Nov 05, 2003 at 06:28:01PM +0100, Redeeman wrote:
> :)
> now i see a debug message, i get to think about, is there a estimated
> date on how it will be ready? because there will be some time till i
> will get a new hd and that, and i would like to use reiser4 there :D

The oops is related to pseudo files, rest of reiser4 seems more stable. 

> On Wed, 2003-11-05 at 18:21, Mike Benoit wrote:
> > While playing with pseudo files, doing things like creating "..uid" and
> > "..gid" files on a ext3 partition, then trying to copy them to a reiser4
> > partition, (using cp,mv, and tar) it seemed oopses were quite a common
> > occurance. 
> > 
> > Kernel Version: 2.6.0-test9 ... and latest Reiser4 snapshot.

-- 
Alex.
