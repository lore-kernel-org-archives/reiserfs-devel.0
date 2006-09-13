From: Quinn Harris <lists@qutek.net>
Subject: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Wed, 13 Sep 2006 14:51:39 -0600
Message-ID: <200609131451.42474.lists@qutek.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have been playing around with relocating file data to improve boot time and 
app start-up time (like OpenOffice) on reiser(fs/4).  This is done by 
monitoring the files accessed during boot/start-up then copying these files 
into a single directory with sequential names 0001 0002 ... matching the 
access order.  Finally the new files are hard linked (rename should work too) 
to the same location as the original files.

As I understand it both reiserfs and reiser4 assign keys to items based on the 
file name and the parent directory.  The file system then attempts to match 
block order with key order .  This allows the above trick to work for placing 
files in a specific order next to each other on disk.

I am using readahead-watch on Ubuntu.  This little tool uses inotify to 
monitor all file accesses while it runs.  The accessed files are written to a 
text file by disk order.  I have modified this tool to also write them by 
access time.  I then use a script (ruby) to do the above copy and link using 
the output from readahead-watch.

I have done some tests on my Athlon 2200 laptop running reiserfs.  Hard drive 
is a 40GB Hitachi Travelstar 80GB has a max real Tx of 25MB/s and access time 
of 12ms.

The reiserfs partition size is 36G with 8.9G used.

I used readahead-watch to create a readahead log during boot on Ubuntu Edgy 
much like the default configuration with the "profile" boot option except set 
to record by access time and I manually killed it after the system fully 
booted.  The with this log used for readahead the system booted in 2:15 from 
grub load to usable desktop (auto login) as measured manually by a stop 
watch.  After running the relocate script the boot time with the same 
readahead log was 1:38.  I then reran the readahead-watch during boot set to 
sort by disk order, resulting in a boot time of 1:15.  I booted twice for 
each test to make sure the results were within a few seconds.

I also used bootchart, but this didn't measure Gnome start-up and requires a 
bit of ambition to analyze thoroughly.  But it was evident that running the 
relocate script did increase peek disk throughput from 6MB/s to 13MB/s and 
increased the averate throughput rate.  But most of boot time is still spent 
waiting on the disk.  My relocate script relocated 310Mb of files.  If those 
where perfectly contiguous on disk, this drive should be able to load that in 
under 20s.  Thought I expect only a fraction of that is actually accessed 
during boot.

Using 'filefrag' it is evident that the relocate scripts attempt to relocate 
the file continuously was a bit half assed, but from the boot times it was 
clearly an improvement.

I also used readahead-watch to monitor the accessed files of openoffice writer 
on startup.  The initial cold start time was 17s (about 0.5s variation from 
load to load).  A warm start (start right after its closed) was 3.6s.  The 
results from readahead-watch where filtered through a script to remove all 
files that where open when openoffice wasn't running (using fuser).  Running 
the relocate script on some of the X and gnome libraries broke my system 
nicely until a reboot.  After running the relocate script the cold start time 
became 14s.  When readahead-list is run on the same files relocated before 
starting openoffice the load time was 6.5s.  sudo sh -c "echo 1 
> /proc/sys/vm/drop_caches" was used to ensure the disk was read between 
runs.

Of course, these results are highly dependent on how fragmented the files 
where before and how effectively the relocation worked.  I expect others 
could reproduce speedups but how much will vary.  I did these tests on my 
laptop with a slow hard drive so the results would be more evident.

I also did some test with fresh reiserfs, reiser4, and ext3 on a 100MB 
loopback to see how well the file system would take the hint to order data 
sequentially.  Creating 10 5MB files with sequential names on reiser4 
resulted in one fragment (measured by 'filefrag') for the whole bunch 
probably a disk allocation bitmap, nearly perfect.  reiserfs generally would 
end up with 3-4 fragments for the same test.  And ext3 didn't appear to make 
any real attempt to order the files sequentially on disk.

I have a 29GB reiser4 partition with 21GB used I have been running for a few 
years now (sometime before release).  When I ran the same 10 5MB file test on 
it, the total resulted in 1000+ fragments (didn't bother to count, but it was 
a lot).  But the files where allocated head to tail.  Its a bit scary to 
think the file system can't find a few MB unallocated region on disk.  
Clearly a repacker would be really nice.

Relocating file data to match pre-measured access patterns can clearly make a 
big performance difference.  Reiser(fs/4) provides an easy mechanism to hint 
at disk order which can be used to measurably improve boot/startup times.  
But, I expect more can be done to achieve better results.  This includes 
better measurements of read patterns and better allocation of the data.

I hope to rerun these tests with Reiser4 (maybe 4.1) on the same hardware.  I 
expect with a fresh (not fragmented) Reiser4 partition, the improvements will 
be more pronounced.  But a repacker should allow more reproducible results 
and nearly perfect data placement for boot and app start-up.

I hope with reiser4, relocation, and the new upstart (Ubuntu's sysvinit 
replacement) with good scripts, I will get this system to boot to usable in 
30 seconds.  And slowoffice (aka openoffice)  to load in 6s cold.  Am I 
overoptimistic?

What about a mechanism to explicitly set or hint at item keys?  Maybe someday, 
linux packages could include preferred file order information that a file 
system like reiser4 could use to order the files on disk resulting in fast 
load times without the need for the user to profile the app.

I think there is a lot to be said for measuring access patterns and using that 
to set keys in addition to deducing it from semantics using a fibration 
plug-in.

Thoughts?

--
Quinn Harris
