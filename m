From: John Fettig <jfettig@students.uiuc.edu>
Subject: Re: reiserfsck --rebuild-tree aborted
Date: Fri, 10 Jan 2003 16:58:36 -0600
Message-ID: <20030110165836.A13329@ux8.cso.uiuc.edu>
References: <20030110005346.A24040@ux13.cso.uiuc.edu> <200301101640.13350.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12315-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200301101640.13350.vitaly@namesys.com>; from vitaly@namesys.com on Fri, Jan 10, 2003 at 04:40:13PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: John Fettig <jfettig@students.uiuc.edu>, reiserfs-list@namesys.com

* Vitaly Fertman <vitaly@namesys.com>: 
> > build_the_tree: Nothing but leaves are expected. Block 8532-??22683
> > build_the_tree: Nothing but leaves are expected. Block 8580-??22660
> > pass1.c 405 pass1_correct_leaf
> > pass1_correct_leaf: block 8581, item 0, pointer 22: The wrong pointer
> > (944715855) in the file [7471218 636]. Must be fixed on pass0.
> > Aborted
> 
> All this looks like an fsck bug, but could be some kind of hardware 
> problem also. I would like to have a look at the metadata of your 
> partition. Could you run debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2 
> and make it available for downloading. 

You can download the output from debugreiserfs from:
http://salty.ncsa.uiuc.edu/debugout.bz2

Please let me know what you find.

John
