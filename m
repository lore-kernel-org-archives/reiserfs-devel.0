From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Thu, 31 Oct 2002 19:24:40 +0300
Message-ID: <15809.22856.534975.384956@laputa.namesys.com>
References: <15809.21559.295852.205720@laputa.namesys.com>
	<20021031161826.A9747@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11866-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021031161826.A9747@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Linus Torvalds <Torvalds@Transmeta.COM>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Christoph Hellwig writes:
 > On Thu, Oct 31, 2002 at 07:03:03PM +0300, Nikita Danilov wrote:
 > > Hello, Linus,
 > > 
 > >     Following patch exports remove_from_page_cache(). reiser4 stores all
 > >     meta-data in the page cache. When piece of meta-data is removed,
 > >     corresponding page has to be removed from the page cache (this is
 > >     similar to truncate, but for meta-data), explicit call to
 > >     remove_from_page_cache() is required at this point.
 > 
 > Could you please explain the code that needs it?  No one should
 > call this in individual filesystem drivers.

Reiser4 stores meta-data in a huge balanced tree. This tree is kept
(partially) in the page cache. All pages in this tree are attached to
"fake" inode. Sometimes you need to remove node from the tree. At this
moment page has to be removed from the fake inode mapping.

Other file systems don't need remove_from_page_cache() because they only
store in the page cache data (and remove_from_page_cache() is called by
truncate()) and meta data that are never explicitly deleted (like
directory content in ext2).

Nikita.
