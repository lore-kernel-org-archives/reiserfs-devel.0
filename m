From: Hans Reiser <reiser@namesys.com>
Subject: Re: Bugs?
Date: Sun, 17 Aug 2003 23:33:47 +0400
Message-ID: <3F3FD89B.7000107@namesys.com>
References: <01KZKIROVK1W90R3WK@EMAIL1.BYU.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15349-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <01KZKIROVK1W90R3WK@EMAIL1.BYU.EDU>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: William Jared Roberts <wjr6@email.byu.edu>
Cc: lkthomas@sml.dyndns.org, reiserfs-list@namesys.com

William Jared Roberts wrote:

>>are you meaning that remount it manually ?
>>also, I know the problem will happen during startup and shutdown, sigh...
>>
>>    
>>
>
>No.  You can have the kernel initially mount the partition read-write.  IIRC,
>you can use rdev and/or kernel command-line options to acheive this effect. 
>It's just a band-aid for the real problem though, if you really need to get into
>your box.
>
>
>
>  
>
He shouldn't be using reiser4 for anything other than bug finding and 
stress testing.  Given how extensively we warn people that, I assume 
this is just a toy installation without any real data on it for the 
purpose of seeing how fast he can crash it.....

-- 
Hans


