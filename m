From: Chris Mason <mason@suse.com>
Subject: Re: Memory Corruption
Date: 19 Aug 2002 16:01:01 -0400
Message-ID: <1029787262.12471.390.camel@tiny>
References: <1029775853.1608.40.camel@terrier2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1029775853.1608.40.camel@terrier2>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Boutcher <boutcher@us.ibm.com>
Cc: reiserfs-list@namesys.com

On Mon, 2002-08-19 at 12:50, Dave Boutcher wrote:
> Hi,
> 
> I'm chasing a wierd memory corruption problem on a ppc64 system.  The
> first byte of a slab_t structure keeps getting stepped on (zeroed,
> actually.)  This happens during a testcase that copies a large file
> called "junk" between file systems (a mix of ext2 and reiser) on a
> 2.4.13 kernel.  I know that's REALLY REALLY old, but it's whats in
> SuSE's SLES-7 release that we have customers running...
> 
> In every case, the page immediately preceding the slab_t has exactly the
> same data in it, and it looks like some kind of directory structure
> (note the presence of the word "junk", along with ".." and "." towards
> the end.)

Any chance the test case involves renames?

-chris


