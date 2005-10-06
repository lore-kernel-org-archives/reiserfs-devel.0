From: Lance Reed <lreed@ruckusnetwork.com>
Subject: Re: Unable to rebuild bitmap.
Date: Thu, 06 Oct 2005 12:25:55 -0400
Message-ID: <43455013.5000808@ruckusnetwork.com>
References: <4342C98D.2000901@ruckusnetwork.com> <200510051333.45061.vitaly@namesys.com> <4343ECF8.7070000@ruckusnetwork.com> <200510061216.25207.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510061216.25207.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: reiserfs-list@namesys.com

Well, the host this one is on is using kernel 2.6.4-52-smp which is a 
stock Suse 9.1 Pro kernel.

However, since this is under LVM and on an external storage array, I 
could build a new
host off of Suse Pro 9.3 which uses a stock 2.6.11.4-21.7-bigsmp kernel, 
and is advertised to be
able to mount reiserfs4 file systems.

Not sure which one would be simpler.....
If you have a patch that works with the older 2.6.4-52-smp kernel, that 
would
be the fastest for me.

Thanks for all your help and taking the time!

Lance




Vitaly Fertman wrote:

>On Wednesday 05 October 2005 19:10, Lance Reed wrote:
>  
>
>>So, is this problem fixed in Reiserfs4 ?
>>    
>>
>
>reiser4 is absolutely different fs written from the scratch,
>it is in the mm kernel only yet.
>
>regarding the reiserfs, there is a patch that solves the problem,
>not accepted though, if you tell me the kernel number you would 
>like to work with I can send it to you.
>
>  
>
>>I can build a new host and use reiserfs4 if this will solve my problem,
>>and just copy the data.  I just want to make sure I can make 16TB files
>>systems if I need to.
>>
>>Thanks so much for all your help and information!
>>
>>
>>Lance
>>
>>Vitaly Fertman wrote:
>>
>>    
>>
>>>On Wednesday 05 October 2005 01:46, Lance Reed wrote:
>>> 
>>>
>>>      
>>>
>>>>Thanks for the info!
>>>>
>>>>I have tried this.  I made the new 3.6.19 code.
>>>>Ran a --rebuild-sb, seemed better.  When I try to run a --check,
>>>>it still says that it can not read the bitmap.
>>>>So, is this problem with the reiserfs code in the kernel I am booting?
>>>>I thought that we could get up to 16 TB. 
>>>>   
>>>>
>>>>        
>>>>
>>>as I have mentioned the current code supports up to the 8Tb only. 
>>>if you need a larger fs you have to patch both kernel and progs.
>>>
>>> 
>>>
>>>      
>>>
>>>>Is there a way to force a rebuild of the superblock.
>>>>maybe delete it with dd at offset 64 ?
>>>>something like this maybe ?
>>>>
>>>>dd if=/dev/zero of=/dev/VG01/lvol0 bs=1024 seek=64 count=1
>>>>(http://lists.suse.com/archive/suse-linux-e/2003-Dec/1731.html)
>>>>
>>>>Then rebuild the bitmap?
>>>>This might be a bit crazy....?
>>>>
>>>>Anybody got any ideas?
>>>>
>>>>Thank you so much for the assistance!
>>>>
>>>>Lance
>>>>
>>>>
>>>>livestore2:~ # reiserfsck --check  /dev/VG01/lvol0
>>>>Do you want to run this program?[N/Yes] (note need to type Yes if you 
>>>>do):Yes
>>>>###########
>>>>reiserfsck --check started at Tue Oct  4 21:36:46 2005
>>>>###########
>>>>Replaying journal..
>>>>Reiserfs journal '/dev/VG01/lvol0' in blocks [18..8211]: 0 transactions 
>>>>replayed
>>>>reiserfs_open_ondisk_bitmap: wrong either bitmaps number,
>>>>count of blocks or blocksize, run with --rebuild-sb to fix it
>>>>reiserfsck: Could not open bitmap
>>>>
>>>>
>>>>livestore2:~ # reiserfsck --fix-fixable   /dev/VG01/lvol0
>>>>Do you want to run this program?[N/Yes] (note need to type Yes if you 
>>>>do):Yes
>>>>###########
>>>>reiserfsck --fix-fixable started at Tue Oct  4 21:38:34 2005
>>>>###########
>>>>Replaying journal..
>>>>Reiserfs journal '/dev/VG01/lvol0' in blocks [18..8211]: 0 transactions 
>>>>replayed
>>>>reiserfs_open_ondisk_bitmap: wrong either bitmaps number,
>>>>count of blocks or blocksize, run with --rebuild-sb to fix it
>>>>reiserfsck: Could not open bitmap
>>>>
>>>>
>>>>Vitaly Fertman wrote:
>>>>
>>>>   
>>>>
>>>>        
>>>>
>>>>>On Tuesday 04 October 2005 22:27, Lance Reed wrote:
>>>>>
>>>>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>>>I seem to be stuck in a catch 22 and can not seem to rebuild a bitmap.
>>>>>>reiserfsck --check says the bitmap is bad.
>>>>>>reiserfsck --rebuild-sb says it is ok.
>>>>>>
>>>>>>I do seem some errors but can not seem to repair them..
>>>>>>"Fs state field: 0x1:
>>>>>>       some corruptions exist."
>>>>>>
>>>>>>If I mount the filesystem and try to write to it, I get a kernel oops.
>>>>>>
>>>>>>The Filesystem has recently been increased to just under 10 TB.
>>>>>>
>>>>>>Anybody have any ideas?
>>>>>>  
>>>>>>
>>>>>>       
>>>>>>
>>>>>>            
>>>>>>
>>>>>this is a known problem revealed recently. the reiserfs has the 16 
>>>>>bits bitmap couter, so the maximum fs size is (0xffff * BlockSize * 
>>>>>8 * BlockSize) = 8T for 4k blocksize.
>>>>>
>>>>>
>>>>>
>>>>>     
>>>>>
>>>>>          
>>>>>
>>>>>>TIA.
>>>>>>
>>>>>>Lance
>>>>>>
>>>>>>2 2.6.4-52-smp #1 SMP Wed Apr 7 02:11:20 UTC 2004 i686 i686 i386 GNU/Linux
>>>>>>SuSE Linux 9.1 (i586)
>>>>>>VERSION = 9.1
>>>>>>reiserfs-3.6.13-24
>>>>>>  
>>>>>>
>>>>>>       
>>>>>>
>>>>>>            
>>>>>>
>>>>>please update the progs to the latest (3.6.19) version.
>>>>>
>>>>>
>>>>>          
>>>>>
>
>
>  
>


-- 


