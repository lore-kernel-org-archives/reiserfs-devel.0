From: Chris Mason <mason@suse.com>
Subject: Re: reiserfsprogs: lib/misc.c: why die() aborts?
Date: Mon, 22 Mar 2004 08:26:07 -0500
Message-ID: <1079961967.11055.414.camel@watt.suse.com>
References: <20040320161819.GA6734@raptus.homelinux.org>
	 <1079959787.1977.24.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079959787.1977.24.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

On Mon, 2004-03-22 at 07:49, Vladimir Saveliev wrote:
> Hi
> 
> On Sat, 2004-03-20 at 19:18, Domenico Andreoli wrote:
> > hi all,
> > 
> > in trying to figure out what is the unpack program in reiserfsprogs
> > and if it supposed to be distributed in the debian package,
> 
> No, it should not be distributed
> 
Hmmm, I disagree.  Normal users can use debugreiserfs -p and unpack to
do test rebuilds on copies of broken filesystems when they are
rebuilding critical data.

-chris


