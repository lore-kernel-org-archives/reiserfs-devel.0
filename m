From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC][PATCH] make reiserfs stop using 'struct file' for internal xattr operations
Date: Fri, 28 Sep 2007 08:16:35 +0100
Message-ID: <20070928071635.GA28841@infradead.org>
References: <20070927022220.c76a7a6e.akpm@linux-foundation.org> <46FC021F.8060109@free.fr> <20070927124833.d2691813.akpm@linux-foundation.org> <20070927202607.GA3812@infradead.org> <1190926419.7344.27.camel@localhost> <20070927210423.GA6117@infradead.org> <1190928434.7344.31.camel@localhost> <20070927145125.1346901f.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070927145125.1346901f.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Hansen <haveblue@us.ibm.com>, hch@infradead.org, laurent.riffard@free.fr, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Thu, Sep 27, 2007 at 02:51:25PM -0700, Andrew Morton wrote:
> That'll be because reiserfs-convert-to-new-aops.patch witched reiserfs over
> to ->write_begin() and ->write_end().

Yeah, I was looking at mainline.

> So your stuff becomes dependent on Nick's stuff, and Nick's stuff is still
> failing on NFS, I think.

I'd rather avoid the paramater removal for now, that makes it less
entangle, and it's an unrelated cleanup anyway.

Btw, there's more abuse of this sort in reiserfs.  Various other places
in xattr.c call dentry_open directly without the vfsmount aswell.  And
handling of an external journal uses filp_open which is similarly stupid,
it should use open_bdev_excl like xfs or the generic code to open the
main filesystem blockdevice.

