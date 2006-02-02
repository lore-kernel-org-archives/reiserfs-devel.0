From: Grzegorz Kulewski <kangur@polcom.net>
Subject: Re: Small ZFS / Reiser4 / Ext 'benchmark'
Date: Thu, 2 Feb 2006 23:20:55 +0100 (CET)
Message-ID: <Pine.LNX.4.63.0602022311370.8060@alpha.polcom.net>
References: <20060202225943.47804036.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060202225943.47804036.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

On Thu, 2 Feb 2006, Adrian Ulrich wrote:
> Hi,
>
> If anyone is interested:
> I ran a small filesystem benchmark on my x86 PC.
>
> It includes:
>
> On Linux:
>  * Reiser4
>  * ReiserFS
>  * Ext3
>
> On Solaris (Using 'gnusolaris'[.org] -> Alpha 2)
>  * UFS
>  * ZFS
>
>
> NetApp's 'Postmark' was used to perform the tests.
> (Postmark simulates something like Mail/NNTP-Server load)
>
> Results:
>  http://spam.workaround.ch/dull/postmark.txt
>
>
> (I used the *default* mkfs/mount options for all filesystems.
> If you like, i can re-run the test with non-default parameters)

WOW! I am misreading something or Reiser4 is _really_ _that_ _fast_?

Could you also add some basic description what these tests do? Do they 
ensure that the data is really written to disk before the timer stops? 
What about using bigger partition (and data written/read) - say 4 times 
your RAM? Are you rebooting after creating fs? Could you make scripts you 
used available?

Could you add ext2, jfs, xfs to these benchmarks? Maybe also some other 
bechmarking program? Also maybe add Reiser4 with compression plugin to the 
list of filesystems.

Also, maybe you should post the updated results (preferably attached, not 
URL if it will fit in 60KB) to LKML for wider discussion about why things 
are like this?


Thanks,

Grzegorz Kulewski

