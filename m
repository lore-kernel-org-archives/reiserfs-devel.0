From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Fri, 9 Oct 2015 16:55:25 +0200
Message-ID: <5617D55D.2040908@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=DDCjcmHX4Y/M9KfM9rboSDi2/jyQ9hJ3fuiVxQGE/fY=;
        b=W6TWayx1fRAYsz1l6G46t6SKFK30hi/oPqg8aGfJ1nuevlZH4JDAH3M/nDtNrwJUKd
         dEUiPOtVTs5xqxMZtt5WkluZAnUcWyfn3ZGQb0337m1hc06Ta76LQX5YEvpavws3wiks
         0swx00cMLf9J/5Frcc9SoBbDg71AEaieFQNznBJNKdmj+9Kr7NuygpBX7WLAZfqNv86T
         o71FALO7yyL+QqkrwdvUIBNr5ZnPyBKfYa2z+Oz8OoTRPsCL4XqGSOcHWiMvvHrsnzZG
         a63ptrLYi0wdFgg3nLkboe1ON9Xla+O241pWdMPNIaMJTdzAHTK01RCGSOKPZ0d416DL
         ne9w==
In-Reply-To: <1444398642.6030.3.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: Oleg Drokin <green@linuxhacker.ru>



On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:
> On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
>> Hi Ivan,
>>
>> On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
>>> Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sourcef
>>> orge.net/msg02745.html
>> Do you have a stack trace for reiser4?
>> How to reproduce it?
> I'll rebuild the kernel without the fix and provide you with the oops'
> stacktrace asap.
>
> I guess that it's tied to the config. In my case, it is reproducible on
> each boot, just as the DE starts up and something issues the first
> fsync().


Yes, let's try to find the culprit who doesn't set i_wb...


>
>>> Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
>>> ---
>>>
>>> Lustre seemed to encounter the same oops and fixed it in a
>>> different way, removing
>>> set_page_writeback() altogether:
>>> https://lkml.org/lkml/2015/7/30/806
>>>
>>> We cannot just remove the call to set_page_writeback() at least
>>> because later
>>> we wait on PG_Writeback flag of that page (in jwait_io())... What
>>> is meant by
>>> "synchronous write" in that Lustre patch? Is our write
>>> "synchronous" in the
>>> same sense?
>>
>> Nop.
>> This is a generic function, it doesn't differentiate the writes.
> Well, that lustre vvp_page_prep_write() is generic as well, and that
> patch adds a conditional to differentiate sync/async writes. What is
> meant by "sync" in that context? sync == page is locked until I/O ends?
> Or something else?


Why do you need this?
Reiser4 doesn't lock pages for IO ;)
At least, for formatted nodes..

Edward.
