From: Linus Torvalds <torvalds@transmeta.com>
Subject: Re: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Thu, 31 Oct 2002 10:57:36 -0800 (PST)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0210311053170.1526-100000@penguin.transmeta.com>
References: <20021031163104.A9845@infradead.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20021031163104.A9845@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>


On Thu, 31 Oct 2002, Christoph Hellwig wrote:

> On Thu, Oct 31, 2002 at 07:24:40PM +0300, Nikita Danilov wrote:
> > Reiser4 stores meta-data in a huge balanced tree. This tree is kept
> > (partially) in the page cache. All pages in this tree are attached to
> > "fake" inode. Sometimes you need to remove node from the tree. At this
> > moment page has to be removed from the fake inode mapping.
> 
> What about chaing truncate_inode_pages to take an additional len
> argument so you don't have to remove all pages past an offset?

Actually, we may want that for other reasons anyway. In particular, I can
well imagine why a networked filesystem in particular might want to
invalidate a range of a file cache, but not necessarily all of it.

(Yeah, I don't know of any network filesystem that does invalidation on
anything but a file granularity, but I assume such filesystems have to
exist. Especially in cluster environments it sounds like a sane thing to
do invalidates on a finer granularity)

			Linus
