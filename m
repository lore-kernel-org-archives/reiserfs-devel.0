From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs errors in dmesg output
Date: Sun, 04 Jul 2004 12:41:30 +0400
Message-ID: <40E7C2BA.8050003@namesys.com>
References: <ae9bd76a040703052222e0065f@mail.gmail.com> <40E6AC37.1090609@namesys.com> <ae9bd76a0407031610bfd1c7d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ae9bd76a0407031610bfd1c7d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sean Plaice <splaice@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

Sean Plaice wrote:
> On Sat, 03 Jul 2004 16:53:11 +0400, Vladimir V. Saveliev <vs@namesys.com> wrote:
> 
>>>sd(8,6):vs-13060: reiserfs_update_sd: stat data of object [1131
>>>1466199 0x0 SD] (nlink == 1) not found (pos 3)
>>>
>>
>>These is not too bad in this. But,
>>would you run find -inum 1466199?
>>What do you get?
> 
> 
> I am running the find now, but excuse my ignorance I could not find
> any information with a ton of google'ing to determine the exact
> partition that is refered to by sd(8,6).
> 
> I am assuming sd[scsi_device](8[controller?],6[partition?]. Using that
> logic I should be doing the find on /dev/sda5 (if partition referenced
> starts at 0). If anyone could clarify this I would appreciate it.
> 
8 is called MAJOR dev number, 6 - MINOR dev number

For any device you can easily find both major and minor numbers with
ls -l /dev/sda
brw-rw----    1 root     disk       8,   0 Sep 23  2003 /dev/sda

so, /dev/sda has (8,0)

ls /dev/sda6 -l
brw-rw----    1 root     disk       8,   6 Sep 23  2003 /dev/sda6
> 
>>>and
>>>
>>>sd(8,6):journal-1777: buffer 109798 bad state !PREPARED !LOCKED !DIRTY
>>> JDIRTY_WAIT
>>>sd(8,6):journal-1777: buffer 185659 bad state !PREPARED !LOCKED !DIRTY
>>> JDIRTY_WAIT
>>>sd(8,6):journal-1777: buffer 208840 bad state !PREPARED !LOCKED !DIRTY
>>> JDIRTY_WAIT
>>>sd(8,6):journal-1777: buffer 300870 bad state !PREPARED !LOCKED !DIRTY
>>> JDIRTY_WAIT
>>>
>>
>>IIRC, sometime ago, there were some fixes for race conditions which
>>might cause this. Chris, would you please confirm that?
> 
> 
> If this is a race condition that is specific to the kernel I am
> running could this lead to corruption or system instability?
> 
Still waiting for Chris reply


