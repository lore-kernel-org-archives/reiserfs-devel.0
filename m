From: Hans Reiser <reiser@namesys.com>
Subject: Re: Resier Fragmentation Effects (was compression vs performance)
Date: Sun, 11 Apr 2004 08:40:35 -0700
Message-ID: <407966F3.8030907@namesys.com>
References: <3DF9165145FACB4C96977FF650C1E9040C469DBF@its-mail1.its.corp.gwl.com>	 <40763A44.4040107@namesys.com> <1081534415.16461.10.camel@watt.suse.com>	 <40778F98.8030401@namesys.com> <1081627362.21342.9.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081627362.21342.9.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: "Burnes, James" <james.burnes@gwl.com>, Stewart Smith <stewart@flamingspork.com>, Tom Vier <tmv@comcast.net>, Scott Young <youngs1@sunyit.edu>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Sat, 2004-04-10 at 02:09, Hans Reiser wrote:
>
>  
>
>>>I put out some patches last week that try to deal with this in v3. 
>>>
>>>      
>>>
>>Describe the algorithmic changes please.
>>    
>>
>
>These are the patches that Jeff and I started working on back in 2.4.20
>or so.  The top of the patch documents the basic ideas.  Note that even
>though I use the term bitmap group, this is just a logical entity
>calculated from a hash of the packing locality or object id.  
>
>v3 has always had options for using hashes to find areas of the disk for
>allocation, the big difference is that I hashed into 64MB chunks of the
>disk instead of into an individual starting block.  This keeps data
>blocks together for the common case (files created one at a time in a
>directory), but doesn't bunch everything at the start of the disk.
>
>Rest of the info below:
>
>The current reiserfs allocator pretty much allocates things sequentially
>from the start of the disk, it works very nicely for desktop loads but
>once you've got more then one proc doing io data files can fragment badly.
>
>One obvious solution is something like ext2's bitmap groups, which put
>file data into different areas of the disk based on which subdirectory
>they are in.  The problem with bitmap groups is that if you've got a
>group of subdirectories their contents will be spread out all over the
>disk, leading to lots of seeks during a sequential read.
>
>This allocator patch uses the packing locality to determine which bitmap
>group to allocate from, but when you create a file it looks in the btree
>to see how 'full' that packing locality already is.  If it hasn't been
>heavily used yet, the packing locality is inherited from the parent
>directory putting files in new subdirs close to the parent subdir,
>  
>
this seems like a very good idea, to determine whether to go to a new 
area of the disk based on how full the current one is

>otherwise it is the inode number of the parent directory putting new
>files far away from the parent subdir.
>
>The end result is fewer packing localities for the same working set.  For
>example, one test data set created by 20 procs running in parallel has
>6822 subdirs.  And with vanilla reiserfs that would mean 6822
>packing localities.  This patch turns that into 2970 packing localities.
>
>This makes sequential reads of big directory trees more efficient, but
>it also makes the btree more efficient in general.  Things end up sorted
>better because groups of subdirs end up with similar keys in the btree,
>instead of being spread out all over.
>
>The patch does not change any of the defaults, you need special mount
>options to enable things.  I suggest starting here:
>
>mount -o alloc=skip_busy:dirid_groups,packing_groups
>
>mount -o alloc=dirid_groups will turn on the bitmap groups
>mount -o packing_groups turns on the packing locality reduction code
>mount -o alloc=skip_busy is the default
>mount -o alloc=skip_busy:dirid_groups turns on both dirid_groups and
>skip_busy
>
>Finally the patch adds a mount -o alloc=oid_groups, which puts files into
>bitmap groups based on a has of their objectid.  This would be used for
>databases or other situations where you have a limited number of very
>large files.
>
>This command will tell you how many packing localities are actually in
>use:
>
>debugreiserfs -d /dev/xxx | grep '^|.*SD' | sed 's/^.....//' | awk '{print $1}' | sort -u | wc -l
>
>-chris
>
>
>
>
>  
>


-- 
Hans

