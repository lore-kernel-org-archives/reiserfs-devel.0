From: "Jedi Ninja" <jedi@ninja.dynup.net>
Subject: Re: fsck.reiser4 errors
Date: Sat, 20 Dec 2003 11:24:13 -0600
Message-ID: <20031220172413.17197.qmail@ninja.dynup.net>
References: <20031213180246.3042.qmail@ninja.dynup.net>
            <200312151635.53344.vitaly@namesys.com>
            <200312151657.58459.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16359-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312151657.58459.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: reiserfs-list@namesys.com

I recently reproduced the same bug, once in /tmp, and later in /home (ack).  
I have time to (try to) debug it now.  It's possible that I have some bad 
blocks, though.  How do I check for that? 

As of this writing, reiser4progs won't compile. 

If I configure without --disable-Werror (as in, -Werror is enabled), I get 
warnings that become errors about implicit, redundant, and then previous 
definitions of aal_exception_error. 

If I configure with --disable-Werror, make gives me errors about 
EXCEPTION_FATAL, EXCEPTION_YESNO, and EXCEPTION_NO being undefined in 
format40_repair.c 

I can't paste the exact errors just now, as I am writing this from lynx (my 
/home was blown away). 

This is depressing.  I'm off to the PS2 for a day or so, then I'll re-clone 
and try again. 

(I'm new to bk, so I guessed:  bk clone bk://somewhere?) 

Vitaly Fertman writes: 

> On Monday 15 December 2003 16:35, Vitaly Fertman wrote:
>> Hello, 
>>
>> On Saturday 13 December 2003 21:02, Jedi Ninja wrote:
>> > trinity root # fsck.reiser4 /dev/hda8
>> >  *** note about $25 support ***
>> >
>> > Fscking the /dev/hda8 block device.
>> > Will check the consistency of the Reiser4 SuperBlock.
>> > Will check the consistency of the Reiser4 FileSystem.
>> > Will use (default) params.
>> > Continue?
>> > (Yes/No): Yes
>> > Fatal: Device operation "read" isn't implemented.
>> > Fatal: Can't read master super block.
>> > Fatal: Failed to open teh master super block.
>> > Fatal: Cannot open the FileSystem on (/dev/hda8).
>> > Segmentation fault 
>>
>> hm, this is strange. what reiser4progs do you use?
>> there are a lot of fixes have been made recently, I will send
>> you the uptodate code in the next email, you should try it first.
> 
> ah, would you clone our  bk://bk.namesys.com/bk/reiser4progs
> and  bk://bk.namesys.com/bk/libaal repositories? The code is 
> much better than in the last snapshot. 
> 
> you will need to run the following for the libaal:
> ./prepare
> ./configure
> make
> make install
> ldconfig 
> 
> and 
> ./prepare
> ./configure
> make 
> 
> for the reiser4progs 
> 
> clean the previously installed libaal version first. 
> 
> email me about the results please. 
> 
> -- 
> Thanks,
> Vitaly Fertman
 

