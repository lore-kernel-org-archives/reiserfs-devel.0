From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 panic at fs/reiser4/lock.c:434
Date: Mon, 29 Mar 2004 05:08:16 -0800
Message-ID: <40681FC0.6010008@namesys.com>
References: <1080175834.13000.10.camel@localhost.localdomain>	 <16482.50006.976095.680498@laputa.namesys.com> <1080243714.31969.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17565-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080243714.31969.6.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Jonathan Briggs wrote:

>On Thu, 2004-03-25 at 04:32, Nikita Danilov wrote:
>  
>
>>Jonathan Briggs writes:
>> > The system is running Linux kernel 2.6.5-rc2.  It's tainted by Nvidia
>> > drivers.
>> > 
>> > The system was compiling the kernel, and Reiser4 panicked.
>>
>>Was compilation multi-threaded (make -j)?
>>    
>>
>
>No, it was just plain make.  There were other programs using the disk at
>the same time, though.  Evolution, rhythmbox, other desktop stuff.
>
>[snip]
>  
>
>>Please try following patch:
>>    
>>
>[patch snipped]
>
>I tried to apply the patch, but it must be against a newer version of
>Reiser4.  I haven't been following the internal-testing snapshots. 
>Should I have been?  I'm still using the 2004-02-25 snapshot.  What
>should I be using to apply your patch to?
>
>Thanks.
>  
>
Can you upgrade to the latest Reiser4 on our website?  We have been 
fixing about 5 bugs a week, so the latest is much more solid.

-- 
Hans


