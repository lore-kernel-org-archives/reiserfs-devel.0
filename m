From: Stuart Levy <slevy@ncsa.uiuc.edu>
Subject: Re: errors with very large reiserfs partition (was: Re: Software Raid0 problem (Update))
Date: Wed, 17 Mar 2004 16:37:07 -0600
Message-ID: <20040317223707.GB1875251@ilia.ncsa.uiuc.edu>
References: <87ish46lq3.fsf@freeze.oslo.dnmi.no> <001701c40c27$1e4c6f00$4a64000a@aztechsolutions.com> <20040317201821.GB1869726@ilia.ncsa.uiuc.edu> <20040317213006.GB5080@favonius>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17290-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040317213006.GB5080@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sander <sander@humilis.net>
Cc: Stuart Levy <slevy@ncsa.uiuc.edu>, reiserfs-list@namesys.com

On Wed, Mar 17, 2004 at 10:30:06PM +0100, Sander wrote:
> Hi Stuart,
> 
> I hope you don't mind that I inform the reiserfs team about your tests
> and the resulting error for reiserfs by cc'ing them.

Great, thanks.

It's probably not strictly a reiserfs problem, except that
(like the XFS implementors) they could try to detect the problem at mount 
time on systems with 32-bit block addressing, and refuse to mount large filesystems.

I just checked fs/xfs/linux/xfs_linux.h for the 2.6.4 kernel.
They conditionally enable XFS_BIG_BLKNOS under either of two conditions:
either CONFIG_LBD is set (the Large Block Device option, which somebody
mentioned earlier in this linux-ide-arrays thread), or BITS_PER_LONG == 64.

   Stuart
