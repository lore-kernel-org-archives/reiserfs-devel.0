From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Thu, 31 Oct 2002 10:33:11 -0700
Message-ID: <20021031173311.GA23959@clusterfs.com>
References: <15809.21559.295852.205720@laputa.namesys.com> <20021031161826.A9747@infradead.org> <15809.22856.534975.384956@laputa.namesys.com> <20021031163104.A9845@infradead.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021031163104.A9845@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>, Nikita Danilov <Nikita@Namesys.COM>, Linus Torvalds <Torvalds@Transmeta.COM>, Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Oct 31, 2002  16:31 +0000, Christoph Hellwig wrote:
> On Thu, Oct 31, 2002 at 07:24:40PM +0300, Nikita Danilov wrote:
> > Reiser4 stores meta-data in a huge balanced tree. This tree is kept
> > (partially) in the page cache. All pages in this tree are attached to
> > "fake" inode. Sometimes you need to remove node from the tree. At this
> > moment page has to be removed from the fake inode mapping.
> 
> What about chaing truncate_inode_pages to take an additional len
> argument so you don't have to remove all pages past an offset?

That would be what we have been calling "punch", and is quite useful
for putting holes in files (i.e. making them sparse again).  This
can be used for InterMezzo (among other things) so that the KML log
file can be growing at the end, but being punched out at the start
so it doesn't use up a lot of disk space.

Not that I'm holding my breath on getting this in the kernel, but
it is definitely useful.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

