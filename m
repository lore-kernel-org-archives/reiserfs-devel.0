From: Corey Hickey <bugfood-ml@fatooh.org>
Subject: Re: Lack of cached bitmap causing degraded performance and occasional
 hangs
Date: Wed, 20 Feb 2008 15:44:02 -0800
Message-ID: <47BCBB42.4030804@fatooh.org>
References: <47BC6869.1020504@fatooh.org> <47BC7BE7.9010400@suse.com> <47BC9D0F.4060302@fatooh.org> <47BCA307.40401@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47BCA307.40401@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Jeff Mahoney wrote:
> Corey Hickey wrote:
>> Jeff Mahoney wrote:
>> Does dropping the page cache make reiserfs forget how many free blocks
>> are in the bitmap groups, or is that cached separately? I can always
>> make the problem occur after dropping the page cache.
> 
> That's cached separately. What version of the kernel are you using?

2.6.24.2. I've also seen what appeared to be the same problem in
- 2.6.24
- 2.6.23.1
- 2.6.21

...ever since I made this array and copied files to it from backup.

> There was an issue a while ago where file systems over 90% full would
> run into huge performance problems because the allocator would always
> try to find a free "window" of the size requested. This would cause it
> to loop over the entire file system, and then step back and take
> whatever it could find. We fixed that a while ago, though.

If you think there's any use in my testing it, I can try to clean house
and move files off the array to down below 90%. I'll start cleaning
after I send this (I ought to anyway); let me know if I should try to
get below 90%, though.

Still, I'm not seeing any issues when I fill up /dev/sda4 (on the same
machine) to 98%.

> Caching all the bitmaps in memory for your larger file system would take
> 30 MB. The pattern of looping over them and back is not a good case for
> an LRU list, since it loops over all of them and starts from the
> beginning again. What did the memory footprint look like before you
> dropped the caches?

For the report I gave earlier, I had closed a few memory hogs to see if
more free memory would alleviate the problem. Here's a more typical
report for free memory
- after normal usage
- after dropping page cache
- after reading bitmaps
- after droping page cache again

$ free
           total       used       free     shared    buffers     cached
Mem:     1023336    1004704      18632          0       8428     639680
-/+ buffers/cache:   356596     666740
Swap:    1004052      12000     992052

# echo 1 > /proc/sys/vm/drop_caches

$ free
           total       used       free     shared    buffers     cached
Mem:     1023336     419740     603596          0       3884      60072
-/+ buffers/cache:   355784     667552
Swap:    1004052      12000     992052

# debugreiserfs -m /dev/md0 &>/dev/null

$ free
           total       used       free     shared    buffers     cached
Mem:     1023336     456384     566952          0      33436      60296
-/+ buffers/cache:   362652     660684
Swap:    1004052      12000     992052

# echo 1 > /proc/sys/vm/drop_caches

$ free
           total       used       free     shared    buffers     cached
Mem:     1023336     419736     603600          0       3812      60056
-/+ buffers/cache:   355868     667468
Swap:    1004052      12000     992052

> Your analysis is probably right: Writing the 1 GB file is forcing the
> bitmaps out of the cache. Writing a 512MB file ends up not causing
> memory pressure, so nothing is forced out. Your original report
> mentioned that you could see measurable delays with 1 MB transferred or
> even just one byte. Was that while your system was running at normal
> load with a bit of memory pressure?

I was referring to seeing a delay after dropping the page cache, such as:

# echo 1 > /proc/sys/vm/drop_caches
# dd if=/dev/zero of=file bs=1c count=1
1+0 records in
1+0 records out
1 byte (1 B) copied, 7.72591 s, 0.0 kB/s

I'm not sure what to make of that; it would surprise me if there are
really so few "holes" toward the beginning of the filesystem that it
ought to take that long to find room for such a small file. I'm just
speculating, though....

As for when the problem crops up on its own, I often see it when the
system is under an I/O load (or was recently): for example, copying a
large file, compiling a program, watching a movie, or doing something
with git. That would seem consistent with the kernel dropping bitmap
data from cache in favor of files recently read/written. Being under
memory pressure might make the problem more likely, but it isn't
strictly necessary.

-Corey
