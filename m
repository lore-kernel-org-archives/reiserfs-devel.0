From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Thu, 31 Oct 2002 19:45:39 +0300
Message-ID: <15809.24115.993132.576769@laputa.namesys.com>
References: <15809.21559.295852.205720@laputa.namesys.com>
	<20021031161826.A9747@infradead.org>
	<15809.22856.534975.384956@laputa.namesys.com>
	<20021031163104.A9845@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021031163104.A9845@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Linus Torvalds <Torvalds@Transmeta.COM>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Christoph Hellwig writes:
 > On Thu, Oct 31, 2002 at 07:24:40PM +0300, Nikita Danilov wrote:
 > > Reiser4 stores meta-data in a huge balanced tree. This tree is kept
 > > (partially) in the page cache. All pages in this tree are attached to
 > > "fake" inode. Sometimes you need to remove node from the tree. At this
 > > moment page has to be removed from the fake inode mapping.
 > 
 > What about chaing truncate_inode_pages to take an additional len
 > argument so you don't have to remove all pages past an offset?

It is possible, I think. But this will look more of a hack. Truncate is
rather for truncating mapping than cutting one page from the middle.

Besides, current truncate_inode_pages() with all its
radix_tree_gang_lookup()'s and two passes doesn't looks like easily
adaptable.

 > 
 > > 
 > > Other file systems don't need remove_from_page_cache() because they only
 > > store in the page cache data (and remove_from_page_cache() is called by
 > > truncate()) and meta data that are never explicitly deleted (like
 > > directory content in ext2).
 > 
 > Sorry, but that's wrong.  XFS does use the pagecache for all metadata and JFS
 > for all but the superblock (which is never changed durin use)
 > 

Interesting. Then, XFS and JFS meta data in the page cache probably
are linearly ordered, and there it is never necessary to remove meta
data page from the middle of the mapping, right?

Nikita.
