From: Hans Reiser <reiser@namesys.com>
Subject: Re: Raid5, LVM and Reiserfs
Date: Mon, 21 Oct 2002 10:04:45 +0400
Message-ID: <3DB398FD.6000205@namesys.com>
References: <000701c277c9$ef8d6c70$0101a8c0@bummer> <200210210449.g9L4n50g022158@turing-police.cc.vt.edu> <3DB392F6.3000603@namesys.com> <200210210751.39155.bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11730-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <bofh@coker.com.au>
Cc: Valdis.Kletnieks@vt.edu, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Russell Coker wrote:

>On Mon, 21 Oct 2002 07:39, Hans Reiser wrote:
>  
>
>>>You may wish to verify further.  Has the hardware raid controller been
>>>identified as being slower than *software* RAID-5?  (Remember - if you do
>>>it in software, you have to do a disk write per disk).  Or is the RAID
>>>controller merely "not as fast as other hardware RAID controllers)?
>>>      
>>>
>>It would be surprising if any hardware RAID controller was as bad as
>>software RAID.  I agree that measuring is advisable.   I would be
>>curious to see numbers on something like that.
>>    
>>
>
>It's fairly common for low-end RAID hardware to have limitations of memory or 
>CPU bandwidth that limit the bulk IO rate.  Hardware RAID that can only 
>sustain 10M/s was quite common until very recently.
>
Wow.   I guess marketing folks figured out that most customers would not 
measure it.  10M/s would be amazingly useless as a controller.

>
>However such hardware RAID did well on random IO tests, so the result you get 
>depends on what exactly you do (as usual).
>
>  
>



