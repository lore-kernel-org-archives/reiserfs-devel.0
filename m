From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Thu, 31 Oct 2002 16:31:04 +0000
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20021031163104.A9845@infradead.org>
References: <15809.21559.295852.205720@laputa.namesys.com> <20021031161826.A9747@infradead.org> <15809.22856.534975.384956@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15809.22856.534975.384956@laputa.namesys.com>; from Nikita@Namesys.COM on Thu, Oct 31, 2002 at 07:24:40PM +0300
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Linus Torvalds <Torvalds@Transmeta.COM>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Thu, Oct 31, 2002 at 07:24:40PM +0300, Nikita Danilov wrote:
> Reiser4 stores meta-data in a huge balanced tree. This tree is kept
> (partially) in the page cache. All pages in this tree are attached to
> "fake" inode. Sometimes you need to remove node from the tree. At this
> moment page has to be removed from the fake inode mapping.

What about chaing truncate_inode_pages to take an additional len
argument so you don't have to remove all pages past an offset?

> 
> Other file systems don't need remove_from_page_cache() because they only
> store in the page cache data (and remove_from_page_cache() is called by
> truncate()) and meta data that are never explicitly deleted (like
> directory content in ext2).

Sorry, but that's wrong.  XFS does use the pagecache for all metadata and JFS
for all but the superblock (which is never changed durin use)
