From: Oleg Drokin <green@namesys.com>
Subject: new block allocator for 2.4.18
Date: Thu, 11 Apr 2002 17:31:01 +0400
Message-ID: <20020411173101.A1150@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

   Hans thinks it is about the time to release new bitmap allocator, I was
   working with for some time (and which I originally inherited from zam).

   This development version includes number of various mount options
   with which you may want to experiment and see what will happen.

   Known problems include a deadlock once fs become full (but not always).
   So try to avoid full FS for now. 

   Patch itself is available at:
   ftp://ftp.namesys.com//pub/reiserfs-for-2.4/testing/2.4.18_new_bitmap_full_speedup.diff.gz

   Block allocator options are passed with alloc=opt1:opt2:... mount parameter

   Here are the options descriptions:
concentrating_formatted_nodes this enables a thing that is formerly was known as
			      border algorithm. It may take a parameter that
			      defines where to put this border in % of
			      available space. If parameter is not specified,
			      10 is assumed. Border area is area where only
			      formatted nodes live except when we are low
			      on disk space.

displacing_large_files	      Takes one parameter - a blocknumber.
			      When this blocknumber allocated for the file,
			      it is placed separately on disk (by default new
			      location is the keyed_hash from the object_id
			      value. "displace_based_on_dirid" will change that
displacing_new_packing_localities Displace formatted nodes of directories at
			      creation time. Displacing is the hash from the
			      dir_id 
old_hashed_relocation	      This is some old attempt at reproducing original
			      block allocator behavior. Inherited from zam.
skip_busy		      Try to allocate blocks in block-groups (called
			      bitmaps in reiserfs) that have more than 10% of
			      blocks free first, if that fail, allocate
			      anywhere.
displace_based_on_dirid	      When displacing files, place files that live in
			      same directory in the same disk area. (achieved
			      by hashing by dir_id value of ondisk_key, instead
			      of object_id)
hashed_formatted_nodes	      Spread formatted data (this is tree itself) all
			      around allowed area (whole disk, or only inside
			      the border, if it is enabled). This approach has
			      such a downside: if particular directory has a lot
			      of formatted data associated with it, allocating
			      one more formatted block for it will be
			      CPU-expensive operation. On the positive side we
			      can see that formatted nodes are grouped by
			      context and it is easier to find free space if
			      needed.
old_way			      Mimic original block allocator from 2.4.18
hundredth_slices	      Disk is virtually divided to 100 pieces. When we
			      are choosing where to allocate, first we hash
			      dir_id and based on that choose one of the
			      hundredth pieces, then we check supplied
			      search_start, and if it fits inside of chosen
			      piece, we use it, otherwise we are looking from
			      the start of the piece for the block. It there is
			      no free space inside of the block, we just simply
			      continue searching until we reach the end of the
			      disk or found new block.
preallocmin		      specify amount of blocks file size should be when
			      we first attempt to preallocate on-disk blocks for
			      it. (default is 4)


  To get almost complete mimic of what you have in 2.4.18, you'd use
  alloc=concentrating_formatted_nodes=10:old_way

  With no options gived you get linear blocks allocation from start of the disk
  to its end. If you write one big file in this mode, you'd get nice read speed
  on it ;)

Bye,
    Oleg
