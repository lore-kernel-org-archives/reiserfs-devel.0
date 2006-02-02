From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Small ZFS / Reiser4 / Ext 'benchmark'
Date: Thu, 2 Feb 2006 15:54:22 -0700
Message-ID: <20060202225422.GT11642@schatzie.adilger.int>
References: <20060202225943.47804036.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060202225943.47804036.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

On Feb 02, 2006  22:59 +0100, Adrian Ulrich wrote:
> If anyone is interested:
>  I ran a small filesystem benchmark on my x86 PC.
> 
>  It includes:
> 
>  On Linux:
>   * Reiser4
>   * ReiserFS
>   * Ext3
> 
>  On Solaris (Using 'gnusolaris'[.org] -> Alpha 2)
>   * UFS
>   * ZFS
> 
> 
>  NetApp's 'Postmark' was used to perform the tests.
>  (Postmark simulates something like Mail/NNTP-Server load)
> 
> Results:
>   http://spam.workaround.ch/dull/postmark.txt
> 
> (I used the *default* mkfs/mount options for all filesystems.
>  If you like, i can re-run the test with non-default parameters)

If you could format (or tune2fs) the ext3 filesystem with "-O dir_index"
this would likely improve performance if the test is creating many files
in the same dir.  Also, is the file size limit in bytes, or kilobytes?
Unfortunately, the canonical postmark URLs I can find are not useful.

What is a interesting, though maybe not terribly surprising is that ZFS
is doing so poorly in the second test.  I'd be extremely interested in
seeing the vmstat output while the tests are running, as I've heard that
ZFS is CPU hungry because of the checksumming.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.

