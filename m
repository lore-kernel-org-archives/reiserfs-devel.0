From: Hans Reiser <reiser@namesys.com>
Subject: Re: Raid5, LVM and Reiserfs
Date: Mon, 21 Oct 2002 09:39:02 +0400
Message-ID: <3DB392F6.3000603@namesys.com>
References: <000701c277c9$ef8d6c70$0101a8c0@bummer> <200210210449.g9L4n50g022158@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Valdis.Kletnieks@vt.edu wrote:

>On Sun, 20 Oct 2002 07:47:50 +0800, darren <teodarren@myrealbox.com>  said:
>
>  
>
>>Due to the bad performance (or so I heard on google) of the hardware
>>raid controller, I would like to use software raid5. 
>>    
>>
>
>You may wish to verify further.  Has the hardware raid controller been
>identified as being slower than *software* RAID-5?  (Remember - if you do
>it in software, you have to do a disk write per disk).  Or is the RAID
>controller merely "not as fast as other hardware RAID controllers)?
>  
>
It would be surprising if any hardware RAID controller was as bad as 
software RAID.  I agree that measuring is advisable.   I would be 
curious to see numbers on something like that.

Hans


