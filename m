From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 10:56:40 -0500
Message-ID: <20021223155640.GB773@willow.seitz.com>
References: <3E06F360.7000708@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12219-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E06F360.7000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Mon, Dec 23, 2002 at 02:28:32PM +0300, Hans Reiser wrote:
> Booting the machine seems like one activity that many users end up 
> waiting on the FS for.  Yes?

Not really.  I've been running ReiserFS for at least three or four
years.  I haven't seen a machine have to fsck in forever ::-)

On machines with Linux md RAID arrays that need to be remirrored, 
I do end up waiting a bit (10-30 seconds) due to read starvation, but
this problem is so much better than it used to be it's hardly worth
mentioning.

> Starting up complex and big applications like xemacs and mozilla would 
> be another.  Yes?

Not really - I've found that apps like mozilla are usually loaded from
disk exactly once per reboot, and then stay cached in memory until the
box is restarted.  Most of the startup time comes from the app doing
lots of work itself - subsequent starts show no disk activity at all.

> Others?

As a long time user of ReiserFS, I don't really wait on the filesystem
anymore.  With Ext2, I used to wait on large deletes, but that's clearly
not an issue anymore.  I've noticed that when I need a performance
upgrade, a faster disk is the best solution.

-- 
Ross Vandegrift
ross@willow.seitz.com

A Pope has a Water Cannon.                               It is a Water Cannon.
He fires Holy-Water from it.                        It is a Holy-Water Cannon.
He Blesses it.                                 It is a Holy Holy-Water Cannon.
He Blesses the Hell out of it.          It is a Wholly Holy Holy-Water Cannon.
He has it pierced.                It is a Holey Wholly Holy Holy-Water Cannon.
He makes it official.       It is a Canon Holey Wholly Holy Holy-Water Cannon.
Batman and Robin arrive.                                       He shoots them.
