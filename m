From: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Subject: Re: Filesystem Tests
Date: Wed, 06 Aug 2003 11:55:14 +0200
Message-ID: <1060163714.764.0.camel@teapot.felipe-alfaro.com>
References: <3F306858.1040202@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15171-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F306858.1040202@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: LKML <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

On Wed, 2003-08-06 at 04:30, Grant Miner wrote:
> I tested the performace of various filesystems with a mozilla build tree 
> of 295MB, with primarily writing and copying operations.  The test 
> system is Linux 2.6.0-test2, 512MB memory, 11531.85MB partition for 
> tests.  Sync is run a few times throughout the test (for full script see 
> bottom of this email).  I ran mkfs on the partition before every test. 
> Running the tests again tends to produces similar times, about +/- 3 
> seconds.
> 
> The first item number is time, in seconds, to complete the test (lower 
> is better).  The second number is CPU use percentage (lower is better).
> 
> reiser4 171.28s, 30%CPU (1.0000x time; 1.0x CPU)
> reiserfs 302.53s, 16%CPU (1.7663x time; 0.53x CPU)
> ext3 319.71s, 11%CPU	(1.8666x time; 0.36x CPU)
> xfs 429.79s, 13%CPU (2.5093x time; 0.43x CPU)
> jfs 470.88s, 6%CPU (2.7492x time 0.02x CPU)

What about ext2? :-)
I think it could be interesting to compare the overhead of a journaled
fs against a non-one, simply for reference.

