From: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Sun, 11 Apr 2004 02:11:22 +0200
Message-ID: <40788D2A.9080209@edsons.demon.nl>
References: <Pine.GSO.4.55L.0404101549560.18241@ohmmjbeq-ovatb.zvg.rqh> <40787606.40306@edsons.demon.nl> <Pine.GSO.4.55L.0404101913080.3352@fpehoovat-ohooyrf.zvg.rqh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.55L.0404101913080.3352@fpehoovat-ohooyrf.zvg.rqh>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Chu <alanchu@MIT.EDU>
Cc: reiserfs-list@namesys.com

Alan Chu wrote:

>On Sun, 11 Apr 2004, Rudy L. Zijlstra wrote:
>
>  
>
>>Alan Chu wrote:
>>    
>>
>>>So I used the Linux "Recovery is Possible 6.9" boot disk, and ran
>>>"reiserfsck --check" on my /dev/hda9, which is my / partition. The output
>>>was the following:
>>>
>>>
>>>
>>>      
>>>
>>Which version?
>>    
>>
>
>The version of the boot cd "Linux Recovery is Possible" is 6.9.  I did a
>"reiserfsck -V" and the version of reiserfsck is 3.6.12-pre1 (2003
>www.namesys.com).
>
>Any suggestions? Help?
>
>Alan
>  
>
Latest version of reiserfsck is 3.6.14. Try that. Though i am afraid you 
will keep trouble. I do hope you made a backup of the parition on a 
spare disk/empty partition?

Also try reiserfsck --rebuild-sb because your superblock seems to have 
left for bit-heaven.

Good luck,

Rudy
