From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.0-test6 crash while reading files in /proc/fs/reiserfs/sda1
Date: Tue, 30 Sep 2003 23:18:55 +0400
Message-ID: <3F79D71F.2020901@namesys.com>
References: <1064936688.4222.14.camel@localhost.localdomain> <200309302006.32584.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200309302006.32584.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Zan Lynx <zlynx@acm.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, nikita@namesys.com

Vitaly Fertman wrote:

>Hi
>
>On Tuesday 30 September 2003 19:44, Zan Lynx wrote:
>  
>
>>I was interested in the contents of the files in /proc/fs/reiserfs/sda1,
>>so I did these commands:
>>
>>cd /proc/fs/reiserfs/sda1
>>grep . *
>>
>>(I like using the grep . * because it labels the contents of each file
>>with the filename.)
>>
>>I did this as a regular user and also as root.  Both times the system
>>crashed and immediately rebooted.  I tried it again as root and the
>>system froze instead.
>>    
>>
>
>which kernel do you use? some patches? could you look into syslog and
>send us all relevant information.
>
>would you also run cat on all files there separately to detect the fault one.
>
>  
>
>>The system is basically RedHat 9.  The kernel was compiled with GCC
>>3.2.2.  I attached a compressed lsmod and kernel configuration to this
>>message.
>>    
>>
>
>no you do not.
>
>  
>
>>The CPU is an Athlon XP 2000+, the SCSI adapter is a LSI Logic 53c1010
>>Ultra3 64 bit adapter running on a 32 bit bus.  (lspci output is also
>>attached.)  The SCSI drive is a Seagate X15.3.
>>
>>Thanks for looking at this.
>>    
>>
>
>  
>
nikita, if vitaly doesn't solve it before you get in, it is yours to solve.

Vitaly, what configuration did you fail to replicate it using (I hope 
you attempted it on your machine before asking the user all this)?

-- 
Hans


