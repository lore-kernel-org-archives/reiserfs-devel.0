From: "Sean Rima" <fido@tcob1.net>
Subject: Re: Strange Syslog messages
Date: Tuesday, 17 Sep 2002 15:34:18 +0000
Message-ID: <MSGID_2=3a263=2f950_6996345a@fidonet.org>
References: <20020917101449.A30035@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020917101449.A30035@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Originally to: Oleg Drokin

Oleg,

>> I am using a stock 2.4.19 kernel, on a system with reiserfs only. I have
> started
>> getting a lot of:
>>vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat data
> of
>> [21003 21048 0x0 SD]
>> is_leaf: wrong item type for item *3.5*[21003 21047 0x1 IND], item_len 8,
>>item_location 2214, free_space(entry_count) 0 vs-5150: search_by_key: invalid
>> format found in block 16616. Fsck? vs-13070: reiserfs_read_inode2: i/o
> failure
>> occurred trying to find stat data of [21003 21048 0x0 SD]

> Do you see any other messages from kernel at this same time?

Nothing related to kernel, usually cron etc.

>>if I boot into a rescue disk and run reiserfsck, I get no errors at all to be
>> fixed running check only

> What reiserfsprogs version do you have?

The lastest version, I made sure I was updated.

>> Is this serious, a problem with the HD or what??

> Hard to tell right now.

I am wondering if it is my motherboard, as I have just ran badblocks on both HDs 
with nothing being reported.

Sean
... COFFEE.CUP empty - Operator shelled out to KITCHEN
--
 Message from TCOB1, Ireland's best BBS
 +353-95-43868 sometimes via tcob1.staticky.com

<-> Gateway Information.
This message originated from a Fidonet System (http://www.fidonet.org)
and was gated at TCOB1 (http://www.tcob1.net)
Please do not respond direct to this message but via the list


