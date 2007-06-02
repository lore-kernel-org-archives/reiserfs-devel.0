From: Edward Shishkin <edward@namesys.com>
Subject: Re: Filesystem corruption
Date: Sun, 03 Jun 2007 03:10:37 +0400
Message-ID: <4661F8ED.4070001@namesys.com>
References: <160382.11806.qm@web31708.mail.mud.yahoo.com> <200705301503.15105.ninja@slaphack.com> <20070531001151.GA9933@efil.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20070531001151.GA9933@efil.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ingo Bormuth <ibormuth@efil.de>
Cc: reiserfs-list@namesys.com

Ingo Bormuth wrote:

>On 2007-05-30 15:03, David Masover wrote:
>
>  
>
>>Only, recently, these fsck-a-thons started happening more and more often, and 
>>I started to lose random files. They'd just be silently truncated to 0 bytes. 
>>And not files I was writing a lot -- I'm talking about things 
>>like /bin/mount.
>>    
>>
>
>Hm, same here. I lost /bin/sleep several times.
>

Would you please describe the problem in more details?
What kernel version? What does "I lost /bin/sleep" mean?
Does it mean that:
1. /bin/sleep was truncated to 0 bytes, i.e. "ls -l /bin/sleep" shows  
something like
-rwxr-xr-x  1 root root 0 2005-04-20 18:32 /bin/sleep
2. /bin/sleep disappeared ("ls -l /bin" doesn't show this file)
3. /bin/sleep exists, but filled by zeros
etc...

Thanks,
Edward.

> I have a little script
>printing status messages to the screen, sleeping two seconds and print
>again - you name it. The probability that /bin/sleep is accessed at the
>same time the system crashes is quite high (this is _no_ write access,
>the system is even mounted noatime).
>
>How could pure execution of a file cause corruption of the file itself?
>Any idea ?
>
>Apart from that single file, I never had any serious problems with
>reiser4 on three busy systems for years - fsck.reiser4 works like charme.
>
>
>  
>

