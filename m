From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: Small ZFS / Reiser4 / Ext 'benchmark'
Date: Thu, 02 Feb 2006 16:36:33 -0600
Message-ID: <1138919793.24587.31.camel@gentoo>
References: <20060202225943.47804036.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060202225943.47804036.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

I'm curious if disabling ZFS checksumming would make a significant
difference.

On Thu, 2006-02-02 at 22:59 +0100, Adrian Ulrich wrote:
> Hi,
> 
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
> 
> (I used the *default* mkfs/mount options for all filesystems.
>  If you like, i can re-run the test with non-default parameters)
> 
> 
>  -- Adrian
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

