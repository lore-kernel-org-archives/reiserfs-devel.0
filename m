From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC][PATCH] make reiserfs stop using 'struct file' for
 internal xattr operations
Date: Thu, 27 Sep 2007 14:54:23 -0700
Message-ID: <20070927145423.32ae6d1c.akpm@linux-foundation.org>
References: <20070927022220.c76a7a6e.akpm@linux-foundation.org>
	<46FC021F.8060109@free.fr>
	<20070927124833.d2691813.akpm@linux-foundation.org>
	<20070927202607.GA3812@infradead.org>
	<1190926419.7344.27.camel@localhost>
	<20070927210423.GA6117@infradead.org>
	<1190928434.7344.31.camel@localhost>
	<20070927145125.1346901f.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20070927145125.1346901f.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: haveblue@us.ibm.com, hch@infradead.org, laurent.riffard@free.fr, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Thu, 27 Sep 2007 14:51:25 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> > Plus, reiserfs seems to compile with that patch I just sent.  Sure as
> > heck surprised me.
> > 
> 
> That'll be because reiserfs-convert-to-new-aops.patch witched reiserfs over
> to ->write_begin() and ->write_end().

Actually, we should rename reiserfs_prepare_write and reiserfs_commit_write
to something else to reduce confusion.  Probably lots of other filesystems
would benefit from the same change, post-Nick's-stuff.
