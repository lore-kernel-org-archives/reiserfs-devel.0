From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Deleting a 5 GB directory in Reiser4 hangs system(s)
Date: Tue, 29 Jul 2014 03:06:09 -0700
Message-ID: <CAM12Q5SqkZXW7gV5r4WCTKwpbpfLwUytKghWNWvZd_agYk=NPw@mail.gmail.com>
References: <CAM12Q5RGOuEMyVhTPcVcLDGAri6H9-NbBKOF2T_PXfq0=kMVoQ@mail.gmail.com>
	<f651f508fe39c0bf8484b2996012d16c@mail.velocitynet.com.au>
	<CAM12Q5RLQKTm15Sw4=NT0tUVq2LVbo90onGnq9fy6G1zhNd5fQ@mail.gmail.com>
	<1825802.TSAWuTl8Lm@intelfx-laptop>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1825802.TSAWuTl8Lm@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, doiggl@velocitynet.com.au

Thanks, Ivan!

fsck.reiser4 --build-fs <unmounted reiser4 dev>

(wait for long process)

but it worked: I was able to rm -rf old-directory/

However, I do not think that the root fs corruption was caused by
Reiser4 itself. Some background info below.

Out of the four or five Reiser4 instances that I am currently testing,
that was the only root reiser4 fs instance/partition that I was having
issues with.

Couple of weeks prior to experiencing issue described, I had booted a
program (from bootable media) in my dev/test machine where the problem
partition resides. That program -- without warning -- executed:
"parted -s /dev/${tgtdrive} mklabel gpt" effectively destroying my
partition table.

I was in a predicament because most (if not all) of the rescue
bootable media out there do not support reiser4 and I had to hack my
own < http://sourceforge.net/projects/xonecuiltzin/ >.

Evidently I had to recover by using testdisk and gparted utilities to
bring back my original partitions. The reiser4 partition in question
initially was not bootable nor mountable; thus I had previously
executed fsck.reiser4 --fix <unmounted-partition>.

Afterwards, yes, I was able to mount/boot the reiser4 partition and I
*assumed* it was *fixed*.
But I was unaware that I had to use: --build-fs
              "fixes all severe fs corruptions, except super block
ones; rebuilds reiser4 filesystem from the scratch if needed."

Anyhow, Ivan & doiggl, appreciate your help. Issue was collateral
damage of destroyed partition and not from Reiser4 per se.

On Mon, Jul 28, 2014 at 11:12 AM, Ivan Shapovalov <intelfx100@gmail.com> wrote:
> On Monday 28 July 2014 at 10:45:03, Jose R R wrote:
>> Niltze, doiggl-
>>
>> On Sat, Jul 26, 2014 at 11:49 PM,  <doiggl@velocitynet.com.au> wrote:
>> > Hello,
>> > - Run following commands in another terminal while doing a rm command in
>> > the other.
>> > # iotop --only
>> > - also does # dmesg show any messages in another terminal
>> > --Glenn
>> >
>> > [1]
>> > This command shows only show processes or threads actually doing I/O
>> > # iotop --help
>> >
>> > Usage: /usr/sbin/iotop [OPTIONS]
>> >
>> > DISK READ and DISK WRITE are the block I/O bandwidth used during the
>> > sampling
>> > period. SWAPIN and IO are the percentages of time the thread spent
>> > respectively
>> > while swapping in and waiting on I/O more generally. PRIO is the I/O
>> > priority at
>> > which the thread is running (set using the ionice command).
>> >
>> > Controls: left and right arrows to change the sorting column, r to invert
>> > the
>> > sorting order, o to toggle the --only option, p to toggle the --processes
>> > option, a to toggle the --accumulated option, i to change I/O priority, q
>> > to
>> > quit, any other key to force a refresh.
>> >
>> > Options:
>> >   --version             show program's version number and exit
>> >   -h, --help            show this help message and exit
>> >   -o, --only            only show processes or threads actually doing I/O
>> >   -b, --batch           non-interactive mode
>> >   -n NUM, --iter=NUM    number of iterations before ending [infinite]
>> >   -d SEC, --delay=SEC   delay between iterations [1 second]
>> >   -p PID, --pid=PID     processes/threads to monitor [all]
>> >   -u USER, --user=USER  users to monitor [all]
>> >   -P, --processes       only show processes, not all threads
>> >   -a, --accumulated     show accumulated I/O instead of bandwidth
>> >   -k, --kilobytes       use kilobytes instead of a human friendly unit
>> >   -t, --time            add a timestamp on each line (implies --batch)
>> >   -q, --quiet           suppress some lines of header (implies --batch)
>> >
>>
>> Example: Reiser4-formatted /dev/sda10 partition has old data that I
>> copied over with (cp -a) but which I now want to remove with (rm -rf).
>> From my current Debian system I mount /dev/sda10 to a local mount
>> point and do on one shell window:
>>
>> nice rm -rf /mnt/sda10/copied-onto-reiser4-data-dir
>>
>> on another shell I follow your suggestion:
>>
>> iotop --only
>>
>> (output)
>> ----------------------------------------------------------
>> reiser4: sda10: found disk format 4.0.0.
>> reiser4: sda10: using Hybrid Transaction Model.
>> reiser4[rm(3352)]: parse_node40
>> (fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
>> WARNING: Wrong level found in node: 1 != 0
>
> Hello,
>
> this looks like a filesystem corruption.
>
> Could you please run fsck.reiser4 (if needed, with --build-fs switch)
> and retry everything this?
>
> If the corruption persists, please, post your kernel version, config
> and tell which reiser4 patch have you used.
>
> Thanks,
> --
> Ivan Shapovalov / intelfx /
>
>> reiser4[rm(3352)]: delete_object_cryptcompress
>> (fs/reiser4/plugin/file/cryptcompress.c:3734)[edward-430]:
>> WARNING: cannot truncate cryptcompress file  425684: -5
>> reiser4[rm(3352)]: parse_node40
>> (fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
>> WARNING: Wrong level found in node: 1 != 0
>> reiser4[rm(3352)]: reiser4_cut_tree_object
>> (fs/reiser4/tree.c:1790)[nikita-2861]:
>> WARNING: failure: -5
>> reiser4[rm(3352)]: delete_object_cryptcompress
>> (fs/reiser4/plugin/file/cryptcompress.c:3734)[edward-430]:
>> WARNING: cannot truncate cryptcompress file  425688: -5
>> -----------------------------------------------------------
>>
>> and yet on another shell I execute:
>>
>> dmesg
>>
>> and I take a snapshot:
>>
>> < https://pbs.twimg.com/media/Bto5EF0CYAAhwhQ.png:large >
>>
>> waited 15 minutes but the process nice rm -rf hung -- and executing:
>>
>> kill -9 <process id>
>>
>> does not work either and the system fan strains with the unkillable process.
>>
>> Odd? Yes I know, but it only occurs on old data copied over onto a
>> newly formatted reiser4 partition. There is no issue with new data
>> that I create (say 5GB or more) once my root Debian system is
>> operating on a Reiser4 file system.
>>


Best Professional Regards.


-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
---------------------------------------------------------------------------------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
---------------------------------------------------------------------------------------------
