From: Corey Hickey <bugfood-ml@fatooh.org>
Subject: Re: Lack of cached bitmap causing degraded performance and occasional
 hangs
Date: Wed, 20 Feb 2008 13:35:11 -0800
Message-ID: <47BC9D0F.4060302@fatooh.org>
References: <47BC6869.1020504@fatooh.org> <47BC7BE7.9010400@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47BC7BE7.9010400@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Jeff Mahoney wrote:
> Corey Hickey wrote:
>> Hello,
> 
>> Every once in a while one of the hard drives in my RAID-0 array starts
>> buzzing: seeking rapidly and regularly such that it provides a
>> continuous tone. The tone is continuous for 0.5-2 seconds before
>> changing frequency; the sound goes through many such steps over the
>> course of 5-30 seconds. Meanwhile, my computer is effectively unusable:
>> programs are starved for I/O, terminals hang, and sometimes X becomes
>> unresponsive--I can't even move the mouse pointer.
> 
>> This drove me nuts for a while until I figured out the problem:
>> reiserfs' bitmap data keeps falling out of the kernel's page cache, and
>> re-reading the bitmap is very slow.
> 
>> Dropping the page cache instantly triggers the same behavior.
> 
>> # echo 1 > /proc/sys/vm/drop_caches
>> # dd if=/dev/zero of=file bs=1M count=1024
> 
>> It's quite common for writing a gigabyte to consist of 30 seconds of
>> reading bitmap data followed by 7 seconds of writing. Sometimes writing
>> a single byte takes 15 seconds of reading and 0 seconds of writing. :)
> 
>> I did some tests this evening that appear to confirm my analysis. I
>> compiled two kernels: one from git immediately before this commit, and
>> one from after.
> 
>> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=5065227b46235ec0131b383cc2f537069b55c6b6
> 
>> Before:
>> - filesystem takes a long time to mount (of course)
>> - no problems thereafter
> 
>> After:
>> - filesystem mounts pretty quickly
>> - the usual buzzing and such
> 
> 
>> I don't understand why this problem is biting me so badly--I have
>> several other reiserfs filesystems (on the same computer and on others)
>> and I can't make any trouble happen with them. Actually, I can always
>> force the bitmap data to be forgotten by dropping the page cache, but
>> re-reading it only takes an moment on every other reiserfs I have. For
>> example, when writing a 1GB file, my 185 GB single-disk filesystem reads
>> about 600 KB of bitmap data in 1 second; my 932 GB RAID-0 is likely to
>> read 15 MB in 30 seconds.
> 
> 
>> I tried gathering information about the bitmaps on the two filesystems
>> and how quickly they can be read.
> 
>> # echo 1 > /proc/sys/vm/drop_caches
>> # time debugreiserfs -m /dev/md0 | wc -l
>> (and the same thing for /dev/sda4)
> 
>> Meanwhile, I captured disk read info with dstat to see how many
>> kilobytes of data were read.
> 
>>                time      lines     kilobytes
>> /dev/md0     55.125s     14935       29496
>> /dev/sda4     9.524s      2987        6680
> 
>> The ratios of the above data are very close to each other and to the
>> ratio of the filesystem sizes:
> 
>> fs size:   932 / 185      = 5.038
>> time:      55.126 / 9.524 = 5.788
>> lines:     14935 / 2987   = 5.000
>> kilobytes: 29496 / 6680   = 4.416
> 
> That makes sense. The number of bitmaps is a function of the size of the
> file system. There is one bitmap per 128MB of disk, and they're spaced
> as-needed, so every 128MB.

I thought that might be the case. Thanks for clarifying.

>> So, then, why does the larger filesystem have to read so much more
>> bitmap data before writing? As I mentioned before, /dev/md0 reads up to
>> 15 MB before writing, and /dev/sda4 reads only 600 KB.
> 
> It will only read until it can find the space available. How full are
> each of these file systems?

Well, I guess that would explain why so much is read.

/dev/sda4             185G  160G   25G  87% /nazgul
/dev/md0              932G  897G   35G  97% /oliphaunt

They're both pretty full, but it's quite likely that /dev/sda4 has a
large contiguous chunk of free space near the beginning. Most of that FS
is temporary storage for large files (many GB).

Unfortunately, I can't test cleaning out /dev/md0 right now--one of the
disks in my backup array started dying yesterday and I won't have a
replacement for a couple days.

I tried temporarily filling up /dev/sda4 to 98%, but I still wasn't able
to reproduce the problem there.

> It's certainly strange behavior. I have a 1.2 TB reiserfs file system
> that I can't duplicate this behavior with, even after dropping the
> caches. It's about 67% full, so finding free space is relatively easy.

What happens if you fill up the filesystem? I suppose the problem might
have something to do with the ratio between FS size and RAM size. I have
1 GB.

Once I get my replacement drive I'll be able to make a 1.2 TB array and
test it on a system with 640 MB of RAM.

> Does this happen repeatedly, or just the first time a write occurs? I'd
> be surprised if it happened every time, since reiserfs caches how many
> free blocks are in each bitmap group the first time the block is read.
> The cache is updated when a block is used or freed. If an allocation
> can't be met within that group, it's skipped.

Does dropping the page cache make reiserfs forget how many free blocks
are in the bitmap groups, or is that cached separately? I can always
make the problem occur after dropping the page cache.

If I drop the page cache, and then start writing repeatedly, as in:
-----------------------------------------------------
echo 1 > /proc/sys/vm/drop_caches
while true ; do
    dd if=/dev/zero of=file bs=1M count=1024 2>&1 | \
        grep copied | cut -d' ' -f6-
done
-----------------------------------------------------

...then I get the following results:
47.7652 s, 22.5 MB/s
34.7170 s, 30.9 MB/s
34.3364 s, 31.3 MB/s
35.0858 s, 30.6 MB/s
34.2207 s, 31.4 MB/s
34.4387 s, 31.2 MB/s
34.1648 s, 31.4 MB/s
34.6974 s, 30.9 MB/s
33.8431 s, 31.7 MB/s
35.1522 s, 30.5 MB/s


If, instead of dropping the page cache, I trick the kernel into caching
the bitmap with "debugreiserfs -m /dev/md0 &>/dev/null":
7.53645 s, 142 MB/s
8.17551 s, 131 MB/s
9.20222 s, 117 MB/s
7.12582 s, 151 MB/s
7.35693 s, 146 MB/s
6.98245 s, 154 MB/s
7.85886 s, 137 MB/s
7.96864 s, 135 MB/s
7.82978 s, 137 MB/s
7.84058 s, 137 MB/s


I don't know why the writing speeds are staying so consistently low in
the first test. Yesterday I ran pretty much the same thing and saw the
write speeds climb back up to around 140 MB/s over the course of five or
six runs; today I repeated the test several times and saw the same
results as I pasted above. I guess the kernel is preferring to cache the
1 GB file it just wrote. If I drop caches and write a 512 MB file
repeatedly, the results are nicer:

40.0924 s, 13.4 MB/s
3.78939 s, 142 MB/s
3.17951 s, 169 MB/s
3.33849 s, 161 MB/s
3.77553 s, 142 MB/s
3.78852 s, 142 MB/s
2.92377 s, 184 MB/s
3.38227 s, 159 MB/s
3.71573 s, 144 MB/s



This wasn't under any particular memory starvation.

$ free
            total       used       free     shared    buffers     cached
Mem:      1023336     291284     732052          0      48936      30300
-/+ buffers/cache     212048     811288
Swap:     1004052      12000     992052



Thank you very much for your reply, by the way. I was hoping you would. :)

-Corey
