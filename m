From: Ookhoi <ookhoi@humilis.net>
Subject: Re: [ANNOUNCE]: reiser4 snapshot
Date: Thu, 16 Jan 2003 09:14:20 +0100
Message-ID: <20030116091420.G7526@humilis>
References: <15880.36350.410391.708308@laputa.namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12370-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15880.36350.410391.708308@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

Nikita Danilov wrote (ao):
> new reiser4 snapshot is available at:
> 
> http://www.namesys.com/snapshots/2002.12.24/
> 
> It is released as a patch against linux-2.5.53 kernel. It should also
> work with current (December 24th) bk snapshot at
> http://linux.bkbits.net/linux-2.5
> 
> This is mostly bug fixing release.
> 
> READ.ME file contains changelog.
> 
> In addition, our public BK repository with reiser4 code is available
> at bk://namesys.com/bk/reiser4.

Hi Nikita,

Is there also a BK repository with the reiserfs4-progs?

And what is the right way to integrate reiser4 into the kernel? At the
moment I pull reiser4 and linux-2.5, patch linux-2.5 with the
reiser4.diff out of the snapshots dir, and replace fs/reiser4 with the
BK reiser4. 

This works*, but I think the patch part is not the right way.

* I can compile a 2.5 kernel, boot it, and mkfs.reiser4 a partition.

Thanks in advance!
