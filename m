From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging
 (was:Compatibility of  current 2.4.19.pending ...)
Date: Mon, 23 Sep 2002 02:36:50 +0200
Message-ID: <3D8E6222.6080303@mb.tu-ilmenau.de>
References: <20020914130239.D26664@namesys.com> <3D867C14.5060404@mb.tu-ilmenau.de> <20020917103321.C25766@namesys.com> <3D87347D.8030504@mb.tu-ilmenau.de> <20020917180035.A15755@namesys.com> <3D8768DB.1030102@mb.tu-ilmenau.de> <20020918092012.A20063@namesys.com> <3D892510.2000602@mb.tu-ilmenau.de> <20020919103453.A14104@namesys.com> <3D89F2AF.3080806@mb.tu-ilmenau.de> <20020919200130.A18305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 09/19/2002 06:01 PM, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Sep 19, 2002 at 05:52:15PM +0200, Manuel Krause wrote:
> 
[...]
>>
>>Thanks for these reminders. Originally I wanted to copy data from one 
>>disk to another and on the way capture the timings to compare the 
>>throughput... Then you pointed me to re-check pure reads and pure writes 
>>mainly to make sure the writes were not read-speed bound and to compare 
>>this behaviour on -pre6 and -pre7.
> 
> Originally I was mostly interested in reads from source fs, not the one
> where you have copied the data (though that one is also might be useful).
> 
> Ok, thank you for lots of testing.
> 
> Bye,
>     Oleg
> 

Hi Oleg & others!

O.k. somehow I managed to "find" the "script to make the scripts" to 
measure writes from nowhere to the target disk. I decided to make up 2 
scripts - one for the dirs and one for the files, originally for the 
comparison of "pure" file wites to the reads (read below) including the 
umounts. They're containing just the lists of commands Oleg posted 
recently (e.g. mkdir "/mnt/beta/dir1" /// dd if=/dev/zero count=1 
bs=8466760 of="/mnt/beta/dir1/.../filename1" ). And I re-used Olegs 
posted command to measure reads from the source disk for the most recent 
reiserfs kernel versions.

The results are shown below.

I'm not very glad with comparing the "pure" reads against writes 
especially when watching the copy timings as different commands are 
included and their (relative) overhead is quite unknown, am I right? (So 
e.g. I didn't want to take these values' relation to tweak the disks 
read & write latency settings for now.)  CPU usage during the dd... and 
the find...cat commands is very high. Also the disk access when watched 
in ksysguardd is different for all these kinds of tests.

So, read and compare it yourself and I would be glad to get comments on 
how I needed to refine it.


Good night,

Manuel

------------------------------------------------------------------

/dev/hda11             5550248   3927572   1622676  71% /mnt/beta
/dev/hdd11             5550248   3927572   1622676  71% /mnt/gamma
containing 58015 files, 3481 files

kernel 2.4.19-      2.4.20-pre6  2.4.20-pre7
        data-logging

# time sh -c "cp -ax /mnt/gamma/. /mnt/beta/ ; umount /mnt/gamma ; 
umount /mnt/beta "
(representing copies from source to target disk)

real   7m46.970s    10m57.716s   10m04.328s
user   0m01.710s     0m01.390s    0m01.540s
sys    1m25.440s     1m11.100s    1m18.840s

# time /tmp/script.dirs.sh
(representing directory writes to target disk)

real   0m09.972s     0m10.055s    0m10.316s
user   0m04.960s     0m04.770s    0m04.880s
sys    0m04.370s     0m04.590s    0m04.550s

# time sh -c "/tmp/script.files.sh ; umount /dev/hda11 ; umount /dev/hdd11 "
(representing file writes to target disk)

real   7m35.992s     8m24.499s    8m20.830s
user   1m31.100s     1m30.120s    1m32.280s
sys    2m21.480s     1m42.230s    2m02.660s

# cd /mnt/ ; time sh -c "find ./gamma/* -type f -exec cat {} >/dev/null 
\; ; umount /dev/hda11 ; umount /dev/hdd11 "
(representing reads from source disk)
real   8m34.665s     9m54.103s    9m50.796s
user   1m11.650s     1m10.760s    1m11.100s
sys    1m15.000s     1m29.960s    1m17.370s


I took care to freshly mount the participating partitions each
test, recreate and mount+umount the counterpart reiserfs
partition before when appropriate, had no overwrites and no
other accesses to the source partition during this test.

Going back from 2.4.20-pre7 to 2.4.19-data-logging and
beeing in doubt of the effects of the new block allocator I
recreated the source filesystem completely (copy to new
target and copy back) to measure the above data-logging
values. The first copy from the former 2.4.20-pre7 reiserfs
to 2.4.19-data-logging had this timings:
   real    7m38.715s
   user    0m2.030s
   sys     1m29.560s

Command to take the "/tmp/script.[dirs,files].sh" :
sh -c 'cd /mnt/gamma ; find * -type d -fprintf /tmp/script.dirs.sh 
"mkdir \"/mnt/beta/%p\"\n" ; find * -type f -fprintf 
/tmp/script.files.sh "dd if=/dev/zero count=1 bs=%s 
of=\"/mnt/beta/%p\"\n" ; chmod u+x /tmp/script.*.sh'

------------------------------------------------------------------

