From: Hans Reiser <reiser@namesys.com>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 03 Mar 2004 16:42:25 +0300
Message-ID: <4045E0C1.9020806@namesys.com>
References: <4044119D.6050502@andrew.cmu.edu> <200403030700.57164.robin.rosenberg.lists@dewire.com> <1078307033.904.1.camel@teapot.felipe-alfaro.com> <200403031059.26483.robin.rosenberg.lists@dewire.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403031059.26483.robin.rosenberg.lists@dewire.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robin Rosenberg <robin.rosenberg.lists@dewire.com>
Cc: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>, David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@www-124.southbury.usf.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

Robin Rosenberg wrote:

>On Wednesday 03 March 2004 10:43, Felipe Alfaro Solana wrote:
>  
>
>>But XFS easily breaks down due to media defects. Once ago I used XFS,
>>but I lost all data on one of my volumes due to a bad block on my hard
>>disk. XFS was unable to recover from the error, and the XFS recovery
>>tools were unable to deal with the error.
>>    
>>
>
>What file systems work on defect media? 
>
>As for crashed disks I rarely bothered trying to "fix" them anymore. I save
>what I can and restore what's backed up and recovery tools (other than
>the undo-delete ones) usually destroy what's left, but that's not unique to
>XFS. Depending on how good my backups are I sometimes try the recovery
>tools just to see, but that has never helped so far.
>
>-- robin
>
>
>  
>
Never attempt to recover without first dd_rescue ing to a good hard 
drive, and doing the recovery there on good hard drive.

-- 
Hans


