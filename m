From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: A best approach to get a summary of r4-conflicting kernel changes
 from 2.6.39
Date: Tue, 11 Sep 2012 00:07:28 +0200
Message-ID: <504E64A0.6050307@gmail.com>
References: <5669697.fA5P36S773@intelfx-laptop> <504769CD.8070302@gmail.com> <504BD545.3020908@gmail.com> <29939407.LWCMkzCiDx@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=0O6lrxraSQP5K8Gar5uWLEdRy1H5jCg0zpITEJ2g7RA=;
        b=iGeEUvXi2GLOMeoGL4NK9ggSnNdvcsU/zEBHy8SHbGYmjfaKub3OPnwTRuOBrlcKAe
         Ui2KnW7vcdvhXMpbwRc9uHoRhe+d5Mykvi6kGpAeuOkDCv02p1uB224ryZkDgh1QOfl5
         pKIa9RIfkrFtE+KQXk1r4mmmKXg84HAzO1om1WZfn8jA8MjQ2kgmA1lrVAlipu/ceGSM
         UeC8HMY777k+g8btuBQuC3Yc2Bx9fx6nHgzlX/vChJeENUCLmoEB8Ghb+azPqfBIeeZJ
         yrH/Y9j/5W5l5p94Y4J0N3ytVpP4Ic6PILS5/xLj9t5vKbn7e+Qj4HEiysBTz08Q7W+D
         Jnsw==
In-Reply-To: <29939407.LWCMkzCiDx@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 09/09/2012 08:40 AM, Ivan Shapovalov wrote:
> On Sunday 09 September 2012 01:31:17 Edward Shishkin wrote:

[...]

>>> There is a less difficult problem. Reiser4 (in both file plugins)
>>> doesn't release a longterm lock when locking a page in ->readpages()
>>> and this violates reiser4 locking policy. Moreover, I am able to get
>>> the deadlock in practice in 4-5 hours of working under high workload.
>>>
>>> We need to release the longterm lock before acquiring a page lock,
>>
>> It seems I was wrong here:
>> I just looked at reiser4 locking policy: the longterm lock has
>> more higher priority than page lock, so we don't need to release it..
>> Sorry for the false alarm!
> No problem. (But why the deadlock occurs then?)


Interesting question. No ideas so far. Dump of processes is needed
to understand what they are waiting for..


>
> BTW, as far as I can see, there (in readpage_unix_file(), if I initially
> understood you correctly) is an inconsistency with VFS guidelines
> (Documentation/filesystems/vfs.txt). If we unlock page for some reasons - and
> we do that before calling find_file_item() - we shall not try to relock and then
> check if the page is still OK; instead, we shall return AOP_TRUNCATED_PAGE and
> we'll be called again with page relocked and intact.
> Is there any specific reason why we do not use this mechanism?


Also take a look at the comment to AOP_TRUNCATED_PAGE definition
(./include/linux/fs.h).

They (VFS folks) believe that unlocked page will be truncated by
another process. However, this is not necessarily, and it won't be
so in reiser4 because concurrent processes acquire (non)exclusive
access to a file (see get_[non]exclusive_access()):

->read(), which calls ->readpage(), takes non-exclusive access;
->write(), which calls ->readpage() for partial writes, takes
   exclusive access;
->mmap (which calls ->readpage()) takes exclusive access;
->truncate(), (which may truncate the page) takes exclusive access;
etc.

I think that this ancient documentation (vfs.txt) has been created
long time ago when file systems were primitive (minix, ext2, etc).
Nowadays modern file systems (like reiserfs, reiser4) perform
on-the-fly file conversions, which require additional locks held: we
need to make/implement decisions about the best form of data storage
basing on internal polymorphisms inherent to properly designed file
systems.

Thanks,
Edward.
