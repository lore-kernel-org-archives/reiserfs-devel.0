From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC][PATCH] make reiserfs stop using 'struct file' for internal xattr operations
Date: Thu, 27 Sep 2007 22:04:23 +0100
Message-ID: <20070927210423.GA6117@infradead.org>
References: <20070927022220.c76a7a6e.akpm@linux-foundation.org> <46FC021F.8060109@free.fr> <20070927124833.d2691813.akpm@linux-foundation.org> <20070927202607.GA3812@infradead.org> <1190926419.7344.27.camel@localhost>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1190926419.7344.27.camel@localhost>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Hansen <haveblue@us.ibm.com>
Cc: Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Laurent Riffard <laurent.riffard@free.fr>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Thu, Sep 27, 2007 at 01:53:39PM -0700, Dave Hansen wrote:
> -int reiserfs_commit_write(struct file *f, struct page *page,
> -			  unsigned from, unsigned to);
> -int reiserfs_prepare_write(struct file *f, struct page *page,
> -			   unsigned from, unsigned to);
> +int reiserfs_commit_write(struct page *page, unsigned from, unsigned to);
> +int reiserfs_prepare_write(struct page *page, unsigned from, unsigned to);

I doubt this will work.  These are also used for the ->prepare_write
and ->commit_write aops, and the method signature definitively wants
a file there, even if it's zero..

