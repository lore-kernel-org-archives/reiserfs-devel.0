From: Yiannis Mavroukakis <jander@darthvader.us>
Subject: Re: Reiser4 file recovery
Date: Mon, 10 Oct 2005 16:19:00 +0100
Message-ID: <434A8664.2060208@darthvader.us>
References: <434A633C.6030507@darthvader.us> <b14e81f00510100806p7a337ebemec0d193dee57df52@mail.gmail.com> <200510101714.35937.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26450-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510101714.35937.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Christian Iversen wrote:

>On Monday 10 October 2005 17:06, michael chang wrote:
>  
>
>>On 10/10/05, Yiannis Mavroukakis <jander@darthvader.us> wrote:
>>    
>>
>>>Hello :-)
>>>
>>>I had an LVM setup of three disks, and one of them went belly
>>>up..Obvious thought is, use some
>>>distro like R.I.P to reduce the volume to two disks and try and salvage
>>>what I could ..unfortunately reiser4 fsck could not find a superblock
>>>(surprise surprise the disk that died had it) nor could it build the FS
>>>because it cannot find the metadata..Under normal circumstances, I would
>>>not bother but my wife's mp3's are in those disks and she will have my
>>>head if I don't figure out some way to restore them :) Any suggestions?
>>>      
>>>
>>Maybe you want to use RAID 5 or something instead of LVM, because of
>>parity, in the future.
>>
>>I suggest you run Spinrite (grc.com, ~$50 IIRC) on the bad disk from a
>>floppy or CD-ROM in DOS (the program makes images for you in Windows,
>>if you have a working partition, or you can get images from the site
>>IIRC once you've bought a copy) and see how much is recovered
>>(assuming it's just bad sectors or something).  Re-add it to the LVM,
>>recover to a seperate media, and then convert the whole thing to a
>>RAID (maybe via tar?).  I know it's not a free solution, but data
>>recovery is nearly impossible w/o paying in one way, shape, or form.
>>It's easier to have backups.
>>    
>>
>
>As usually, Gibson "Research" is skimpy on details, so I'm not entirely sure 
>if spinrite is anything more than a disk imager. If not, just use the free 
>(gratis && libre) dd_rescue program instead. It will save you $50.
>
>  
>
Thanks for the suggestions guys...however I should have clarified that I 
no longer have the dead disk (long story...) so I am kind of stuck with 
what I have...Am I stuffed ?

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
