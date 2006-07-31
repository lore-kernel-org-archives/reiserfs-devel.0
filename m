From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 19:56:21 +0200
Message-ID: <20060731195621.367ed702.reiser4@blinkenlights.ch>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch>
	<20060731165406.GA8526@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060731165406.GA8526@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Andree <matthias.andree@gmx.de>
Cc: vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com


> Well - easy to fix, newfs again with proper inode density (perhaps 1 per
> 2 kB) and redo the migration.

Ehr: Such a migration (on a very busy system) takes *some* time (weeks).
Re-Doing (migrate users back / recreate the FS / start again) the whole
thing isn't really an option..


> Of course you're free to pay for a new
> file system if your fellow admin can't be bothered to remember newfs's
> -i option.

Let's face it: Shit happens and nobody is perfect. A filesystem should
be flexible (modern..) and support Admin/User-needs.

We wouldn't need ECC / Raid / UPS's in a perfect world.

 
> > Have you ever seen VxFS or WAFL in action?
> 
> No I haven't. As long as they are commercial, it's not likely that I
> will.

Why?

NetApp WAFL-Blurb:
 http://www.netapp.com/library/tr/3002.pdf
 

Maybe we should crop the Cc: list .. this is getting OT.

 -- Adrian

