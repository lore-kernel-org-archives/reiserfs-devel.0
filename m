From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging
 (was:Compatibility of  current 2.4.19.pending ...)
Date: Thu, 19 Sep 2002 17:52:15 +0200
Message-ID: <3D89F2AF.3080806@mb.tu-ilmenau.de>
References: <20020913113735.A6022@namesys.com> <3D826FB9.7030909@mb.tu-ilmenau.de> <20020914130239.D26664@namesys.com> <3D867C14.5060404@mb.tu-ilmenau.de> <20020917103321.C25766@namesys.com> <3D87347D.8030504@mb.tu-ilmenau.de> <20020917180035.A15755@namesys.com> <3D8768DB.1030102@mb.tu-ilmenau.de> <20020918092012.A20063@namesys.com> <3D892510.2000602@mb.tu-ilmenau.de> <20020919103453.A14104@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 09/19/2002 08:34 AM, Oleg Drokin wrote:
> Hello!
> 
> On Thu, Sep 19, 2002 at 03:14:56AM +0200, Manuel Krause wrote:
> 
> 
>>>And you can run resulting script in target dir.
>>
>>Yes, I saw this work in a nightmare last night. Scheduled for some dark 
>>moonless cold snow flurry winter night, sorry. Except for someone 
>>experienced likes to provide me with a basic script for that... ;-))
> 
>>>This dataset is way too small and entirely fits into your RAM I presume.
>>
>>Yes, it fits. I know that problem with this RAM based test. Though I may 
>>increase the testing directory a bit closer to the OOM limit, having 
>>512MB available.
> 
> No, this is not enough of course since some data will remain unflushed and
> amount of such data is relatively big compared to total amount of data.

And if the participating filesystems are umounted after writing the data?

>>>So to avoid any distortion or results you'd better have all periodic stuff
>>>disabled. (though kupdated is still there) so it's better to run it several
>>>times.
>>>Also since it its into RAM, it must be flushed out, so I usually do this
>>>using such command:
>>>time sh -c "cp -a /testfs0/linux-2.4.18 /mnt/ ; umount /mnt"
>>
>>Couldn't you have written these words to me some years earlier?! The 
>>effect is measurable and on almost any so far discussed fs interaction 
>>huge or at least relevant. So, after reviewing my 
>>partition-backup-scripts, forget _all_ results I posted to the list. 
>>They're all lacking the umount=flush component.
> 
> It is only needed if data to be cached is big enough to be noticed when compared
> to total amount of data to be copied.
> 
>>No. /mnt/beta/ is my software storage partition and contains this:
>> /dev/hda11   5550248   4089088   1461160  74% /mnt/beta .
> 
> Ah!
> 
>>Oh. O.k. you get a definite "No" on this, sorry. I just reviewed the 
>>debugreiserfs' output file content and I would not send or publish this 
>>in any way. It is simply too sensitive as it contains direct file and 
>>directory names.
> 
> No, then I do not need that debugreiserfs dump anyway.
> 
> But here is another warning:
> I presume before each copy test is done, /mnt/beta/z.Backup.3 is removed
> completely and /mnt/beta is unmounted and mounted back, also
> between sevetral writing attempts (And during these attempts of course)
> no other processes can write to to this FS.

These clauses are both true and apply to the dd tests, too. Mmh, except 
for the case when /mnt/beta/z.Backup.3 or testfile.zero were the source 
to be copied/dd'ed... There haven't been overwrites or other writes to 
the disk during the testsets.

> If those two above clauses are not true, then results are also meaningless,
> as lots of unnecessary tree reads are issued for overwrite and new blocks are
> not allocated, but existing ones are reused.
> If somebody can write to FS, then with every next test blocks chosen for files
> are different (old ones may be already occupied).
> 
>>Is it possible to provide the needed info without clear directory or 
>>file names in future?! (These names replaced by sequentionally taken 
>>numbers?)
> 
> In such a case you can determine object id of big file (shown to userspace
> as inode number) and only provide it's SD and indirect items:
> |  9|4 357 0x0 SD (0), len 44, location 1572 entry count 65535, ...
> | 10|4 357 0x1 IND (1), len 504, location 1068 entr....
> 126 pointers
> [ 9948(126)]
> 
> This is a example of file with objectid 357, that have 126 blocks in size.
> 9948-10074 blocks (all continuous) are used.
> 
> If file is very big, there would be several IND (indirect) items in other nodes,
> number in brackets will changes to show offset that this INDIRECT item starts
> with.
> 
>>Comparison of "dd" actions:
>>---------------------------
>>reading command: time sh -c "dd if=/mnt/beta/testfile.zero bs=1M
>> count=1000 of=/dev/null ; umount /mnt/beta"
>>writing command: time sh -c "dd if=/dev/zero bs=1M count=1000
>> of=/mnt/beta/testfile.zero ; umount /mnt/beta"
> 
> I presume you earased /mnt/beta/testfile.zero between tests and executed
> sync.

I umounted the partition and mounted it back. I thought that would be 
the right action to avoid what you describe in the following:

> Ah, until I forgot - in reiserfs if you erased something blocks that were
> freed are only get back to you on next journal flush or after sync.
> So if you do something like this:
> rm -f /mnt/beta/testfile.zero ; time sh -c "dd ...",
> then second file will get different blocknumbers.
> 
>>related df values:
>>/dev/hda11   5550248   4089088   1461160  74% /mnt/beta
>>/dev/hda11   5550248   5114104    436144  93% /mnt/beta
>>Yes, that's going over the "senfseful" filesystem content value.
> 
> Hm. This is before and after dd command or what?

Yes, without and with the 1G file.

>>Comparison of "cp -a" actions:
>>------------------------------
>>reading command: time sh -c "cp -a /mnt/beta/z.Backup.3/. /mnt/ramfs/ ;
>> umount /mnt/beta ; umount /mnt/ramfs"
>>writing command: time sh -c "cp -a /mnt/ramfs/. /mnt/beta/z.Backup.3/ ;
>> umount /mnt/beta ; umount /mnt/ramfs"
> 
> You mean you executed your commands in this same order?

The order was:
mount /mnt/beta, mount ramfs, executing the reading command with the 
umounts -- and this order 2 more times -- for the read values.
Then :
mount ramfs, mount /mnt/beta, move data to ramfs, umount and mount back 
/mnt/beta, executing the writing command with the umounts -- and this 2 
more times -- for the write values.

So I didn't execute the above commands in direct order.

> I.e. first reading files from partition and then writing same files back
> in place of already existing ones? Then above thing about overwriting files
> applies directly in here.
> I thought you were reading files from one filesystem and writing these files
> to another one.

>>>Yes, kind of, though you have omitted timings of copying original data to
>>>/dev/shm/ that will give us read speed from original media.
>>
>>I thought my posted set "# time cp -a /mnt/beta/z.Backup.3/. /dev/shm/" 
>>represented copying the original data from reiserfs partition /mnt/beta 
>>to /dev/shm ?!
> 
> I thought that original data is residing on another filesystem on another disk.
> If originally you vere copying data from one disk to the same disk, just
> another partition, then thisis just lots of seeks.

Thanks for these reminders. Originally I wanted to copy data from one 
disk to another and on the way capture the timings to compare the 
throughput... Then you pointed me to re-check pure reads and pure writes 
mainly to make sure the writes were not read-speed bound and to compare 
this behaviour on -pre6 and -pre7.

Bye,

Manuel

