From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 17:17:13 -0400
Message-ID: <20050920211713.GB6179@thunk.org>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz> <200509202328.28501.rik@osrc.info> <200509202015.j8KKFfjd025051@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200509202015.j8KKFfjd025051@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Roman I Khimov <rik@osrc.info>, reiserfs-list@namesys.com, Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 20, 2005 at 04:15:41PM -0400, Valdis.Kletnieks@vt.edu wrote:
> On Tue, 20 Sep 2005 23:28:12 +0400, Roman I Khimov said:
> > --nextPart1692600.LIfSYN1P7A
> 
> > Maybe I'm doing something wrong here, but ext2 have failed on second check
> > of first pass with
> > 
> > Second check...
> > e2fsck 1.34 (25-Jul-2003)
> > Pass 1: Checking inodes, blocks, and sizes
> > Pass 2: Checking directory structure
> 
> > fsck.damaged: ***** FILE SYSTEM WAS MODIFIED *****
> > fsck.damaged: 1345/25064 files (1.7% non-contiguous), 94063/100000 blocks
> > fsck lied about its success (result = 1)

From the fsck man page:

       The exit code returned by fsck is the sum of the following conditions:
            0    - No errors
            1    - File system errors corrected
            2    - System should be rebooted
            4    - File system errors left uncorrected
            8    - Operational error
            16   - Usage or syntax error
            32   - Fsck canceled by user request
            128  - Shared library error

An exit code of 1 means that filesystem errors were corrected
(successfully).  

This is a convention that has been around for a long time (since at
least BSD 4.x).

						- Ted
