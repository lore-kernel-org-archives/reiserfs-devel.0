From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck --rebuild-tree aborted
Date: Fri, 10 Jan 2003 16:40:13 +0300
Message-ID: <200301101640.13350.vitaly@namesys.com>
References: <20030110005346.A24040@ux13.cso.uiuc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12308-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030110005346.A24040@ux13.cso.uiuc.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Fettig <jfettig@students.uiuc.edu>, reiserfs-list@namesys.com

Hi, 

> build_the_tree: Nothing but leaves are expected. Block 8532-??22683
> build_the_tree: Nothing but leaves are expected. Block 8580-??22660
> pass1.c 405 pass1_correct_leaf
> pass1_correct_leaf: block 8581, item 0, pointer 22: The wrong pointer
> (944715855) in the file [7471218 636]. Must be fixed on pass0.
> Aborted

All this looks like an fsck bug, but could be some kind of hardware 
problem also. I would like to have a look at the metadata of your 
partition. Could you run debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2 
and make it available for downloading. 

-- 

Thanks,
Vitaly Fertman
