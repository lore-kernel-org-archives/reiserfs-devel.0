From: David Khoury <dave@hal.flex.com.au>
Subject: Re: Permission Denied errors in ReiserFS
Date: Tue, 23 Apr 2002 02:02:15 +1000
Message-ID: <20020422160215.GB27862@flex.com.au>
References: <20020422084257.GC25655@flex.com.au> <20020422124902.A8689@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020422124902.A8689@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

 Problem is solved now, thanks to Olav's suggestion.
 
 Just for the benefit of those with similar problems, and for those searching
 in the mail archives:

 Run reiserfsck --fix-fixable on your ReiserFS partition.  Make sure you're
 using at least verion 3.x.1c-pre2 of the reiserfsprogs.  You'll have to boot
 from a floppy or cdrom, if your ReiserFS partiton is the root partition.
 Remounting the root filesystem as 'ro' isn't enough.
 (this is obvious to me now, when I consider metadata cacheing.  It's a
 bummer, because it would have been wonderful to do an fsck on a 'ro' mounted
 filesystem).

 dave
