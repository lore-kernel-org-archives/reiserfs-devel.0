From: <doiggl@velocitynet.com.au>
Subject: Re: reiser4progs revision.
Date: Fri, 29 Aug 2014 12:16:32 +1000
Message-ID: <30cfa4f297251197e8b5fa1c669d13c9@mail.velocitynet.com.au>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop> <458361e3164a300c930420b3dd9e5b43@mail.velocitynet.com.au> <53FDD565.6030500@gmail.com> <4a7ae00218566234cc327500710d1a61@mail.velocitynet.com.au> <53FF26A2.2060300@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <53FF26A2.2060300@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


>>> This is a bug in fsck: it jumps to wrong branch for some reasons.
>>> Not yet fixed.
>>>
>>> Edward.
>> Hello,
> 
> Hello.
> 
>> Some questions:
>>
>>   - Can fsck be fixed so it jumps to "correct" branch branch. ?
> 
> Yes, it can.
> 
>>   - It would be useful to display a message when a Node or key is
fixed.
> 
> Why?
> 
> 
> Thanks,

Hello,

Can you send me the .patch file so it jumps to "correct" branch branch. ?

I can apply patch to the spec file and retest using # fsck.reiser4
--build-fs /dev/sdb

[1] spec file locations
I can do a test with:
https://build.opensuse.org/package/view_file/home:doiggl:branches:filesystems/reiser4progs/reiser4progs.spec?expand=1
https://build.opensuse.org/package/show/home:doiggl:branches:filesystems/reiser4progs

##

RE:
- It would be useful to display a message when a Node or key is fixed.
Why?

Thanks,
Edward.

Reason for asking:
Would be nice to know if a Node or key is fixed.

Thanks for the time and effort.
Cheers Glenn

