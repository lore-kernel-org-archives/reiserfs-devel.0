From: Christian Kujau <evil@g-house.de>
Subject: Re: Read only rootfs after reiserfsck
Date: Thu, 13 Nov 2003 14:26:53 +0100
Message-ID: <3FB3869D.5090203@g-house.de>
References: <000001c3a707$58db90e0$7dea1d97@delta> <3FAEA7CA.4000301@gmx.net> <011b01c3a89d$28e03520$0100007f@delta> <3FB19C6E.7030109@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16074-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FB19C6E.7030109@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: paoloazzaroli@libero.it, reiserfs-list@namesys.com

> Paolo Azzaroli wrote:
 >
>>>Delete all lines in /etc/mtab which reference filesystems other than
>>>your root partition. That should fix it.
> 
>>Dear Sir:, I apreciated Your suggestion, I tried it,  but it doesn't
>>fix my problem.

please try to post your issued commands here, say

$ mount /proc
$ rm /etc/mtab
$ cat /proc/mounts
$ $MOUNT-COMMANDS....

...and error messages, partition tables.

Christian.

-- 
BOFH excuse #185:

system consumed all the paper for paging

