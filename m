From: Hans Reiser <reiser@namesys.com>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 03 Mar 2004 17:16:16 +0300
Message-ID: <4045E8B0.4090001@namesys.com>
References: <KHEHKKKAAILFJGJCHDCAAEFFEKAA.mg@sgi.com> <1078319654.1113.10.camel@teapot.felipe-alfaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078319654.1113.10.camel@teapot.felipe-alfaro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Cc: Mike Gigante <mg@sgi.com>, Robin Rosenberg <robin.rosenberg.lists@dewire.com>, David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

Felipe Alfaro Solana wrote:

>
>
>As I said, it could have been a kernel bug, or maybe I simply didn't
>understand the implications of recovery, but xfs_repair was totally
>unable to fix the problem. It instructed me to use "dd" to move the
>volume to a healthy disk and retry the operation, but it was not easy to
>do that as I explained before.
>
>
>
>  
>
I think that your expectation is unreasonable.  XFS was designed for 
machines where popping in a working hard drive was feasible.  Making a 
disk layout adaptable to any arbitrary block going bad is more work than 
you might think, and for their intended market (not laptops) they did 
the right thing. 

You can buy cables that allow you to connect laptop drives to desktops. 

-- 
Hans


