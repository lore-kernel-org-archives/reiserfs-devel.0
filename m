From: Tanel Kokk <tanel.kokk@skype.net>
Subject: Re: How to interprete ReiserFS warnings?
Date: Tue, 30 Jan 2007 15:31:24 +0200
Message-ID: <45BF48AC.20300@skype.net>
References: <45BF34CE.7050500@skype.net> <200701301708.14742.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200701301708.14742.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:
> Hello
> 
> On Tuesday 30 January 2007 15:06, Tanel Kokk wrote:
>> There are reiserfs warning messages in dmesg:
>>
>> ReiserFS: cciss/c1d0p6: warning: vs-13060: reiserfs_update_sd: stat data
>> of object [454 231 0x0 SD] (nlink == 1) not found (pos 1)
>> ReiserFS: cciss/c1d0p6: warning: vs-13060: reiserfs_update_sd: stat data
>> of object [454 231 0x0 SD] (nlink == 1) not found (pos 1)
>> ReiserFS: cciss/c1d0p6: warning: vs-13060: reiserfs_update_sd: stat data
>> of object [454 231 0x0 SD] (nlink == 1) not found (pos 1)
>>
>> reiserfsck /dev/cciss/c1d0p6 didn't find any errors.
>>
> the above warnings indicate some kind of corruptions: file inode was not found in storage tree.
> 
> So, as long as reiserfsck does not find anything something does not work as expected.
> How often do the warnings come up?

These 3 message are all, no more errors were discovered:

Jan 30 00:00:01 host kernel: ReiserFS: cciss/c1d0p6: warning: vs-13060:
reiserfs_update_sd: stat data of object [454 231 0x0 SD] (nlink == 1)
not found (pos 1)
Jan 30 00:00:01 host last message repeated 2 times
Jan 30 12:37:01 host kernel: ReiserFS: cciss/c1d0p6: found reiserfs
format "3.6" with standard journal
Jan 30 12:37:02 host kernel: ReiserFS: cciss/c1d0p6: using ordered data mode
Jan 30 12:37:02 host kernel: ReiserFS: cciss/c1d0p6: journal params:
device cciss/c1d0p6, size 8192, journal first bl
ock 18, max trans len 1024, max batch 900, max commit age 30, max trans
age 30
Jan 30 12:37:02 host kernel: ReiserFS: cciss/c1d0p6: checking
transaction log (cciss/c1d0p6)
Jan 30 12:37:02 host kernel: ReiserFS: cciss/c1d0p6: Using r5 hash to
sort names

> 
>> my question is: how can I find out, to which file this "[454 231 0x0 SD]
>> data of object" refers?
>>
> 
> find -inum 231
> 
> Does this file still exist?

Yes! file with inode 231 still exists and is accessible (it is log-file)

I am quite sensible about reiserfs warnings at the moment, because
during half a year there was about 6-7 incidents, where filesystems with
reiserfs went "bad". All of them were on different servers, so I would
doupt that reasons are hardware-like.

At the moment one reiserfsck in one server is running about 4-5 days
already. And still in 2. stage at "60%." (fs size ca 400G)

Tanel
