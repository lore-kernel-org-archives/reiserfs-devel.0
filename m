From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] reiserfs: Truncate blocks not used by a write
Date: Tue, 1 Sep 2009 13:42:56 -0400
Message-ID: <20090901174255.GA9051@infradead.org>
References: <20090901155554.GD8242@duck.novell.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090901155554.GD8242@duck.novell.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org, jeffm@suse.com, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 01, 2009 at 05:55:54PM +0200, Jan Kara wrote:
> It can happen that write does not use all the blocks allocated in write_begin
> either because of some filesystem error (like ENOSPC) or because page with
> data to write has been removed from memory. We truncate these blocks so that
> we don't have dangling blocks beyond i_size. 

vmtruncate is in the process of going away for 2.6.32.  Please use a
filesystems-specific routine to just trim the blocks, similar to what
the vmtruncate call in the generic write_begin helper is beeing replaced
with in Nick's truncate patch series.

