From: Badari Pulavarty <pbadari@gmail.com>
Subject: Re: migratepage failures on reiserfs
Date: Fri, 02 Nov 2007 08:46:42 -0800
Message-ID: <1194022002.1547.19.camel@dyn9047017100.beaverton.ibm.com>
References: <1193768824.8904.11.camel@dyn9047017100.beaverton.ibm.com>
	 <20071030135442.5d33c61c@think.oraclecorp.com>
	 <1193781245.8904.28.camel@dyn9047017100.beaverton.ibm.com>
	 <20071030185840.48f5a10b@think.oraclecorp.com>
	 <1193847261.17412.13.camel@dyn9047017100.beaverton.ibm.com>
	 <20071031134006.2ecd520b@think.oraclecorp.com>
	 <1193935137.26106.5.camel@dyn9047017100.beaverton.ibm.com>
	 <20071101115103.62de4b2e@think.oraclecorp.com>
	 <1193940626.26106.13.camel@dyn9047017100.beaverton.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1193940626.26106.13.camel@dyn9047017100.beaverton.ibm.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <chris.mason@oracle.com>
Cc: mel@csn.ul.ie, reiserfs-devel@vger.kernel.org, linux-mm <linux-mm@kvack.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Thu, 2007-11-01 at 10:10 -0800, Badari Pulavarty wrote:
> On Thu, 2007-11-01 at 11:51 -0400, Chris Mason wrote:
> > On Thu, 01 Nov 2007 08:38:57 -0800
> > Badari Pulavarty <pbadari@us.ibm.com> wrote:
> > 
> > > On Wed, 2007-10-31 at 13:40 -0400, Chris Mason wrote:
> > > > On Wed, 31 Oct 2007 08:14:21 -0800
> > > > Badari Pulavarty <pbadari@us.ibm.com> wrote:
> > > > > 
> > > > > I tried data=writeback mode and it didn't help :(
> > > > 
> > > > Ouch, so much for the easy way out.
> > > > 
> > > > > 
> > > > > unable to release the page 262070
> > > > > bh c0000000211b9408 flags 110029 count 1 private 0
> > > > > unable to release the page 262098
> > > > > bh c000000020ec9198 flags 110029 count 1 private 0
> > > > > memory offlining 3f000 to 40000 failed
> > > > > 
> > > > 
> > > > The only other special thing reiserfs does with the page cache is
> > > > file tails.  I don't suppose all of these pages are index zero in
> > > > files smaller than 4k?
> > > 
> > > Ahhhhhhhhhhhhh !! I am so blind :(
> > > 
> > > I have been suspecting reiserfs all along, since its executing
> > > fallback_migrate_page(). Actually, these buffer heads are
> > > backing blockdev. I guess these are metadata buffers :( 
> > > I am not sure we can do much with these..
> > 
> > Hmpf, my first reply had a paragraph about the block device inode
> > pages, I noticed the phrase file data pages and deleted it ;)
> > 
> > But, for the metadata buffers there's not much we can do.  They are
> > included in a bunch of different lists and the patch would
> > be non-trivial.
> 
> Unfortunately, these buffer pages are spread all around making
> those sections of memory non-removable. Of course, one can use
> ZONE_MOVABLE to make sure to guarantee the remove. But I am
> hoping we could easily group all these allocations and minimize
> spreading them around. Mel ?
> 


BTW, I am having better luck with being able to offline sections
of memory on x86-64, if I take out __GFP_MOVABLE flag for 
blockdev pages. (in grow_dev_page()).

Thanks,
Badari

