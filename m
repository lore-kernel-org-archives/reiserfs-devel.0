From: dE <de.techno@gmail.com>
Subject: Re: ACL support.
Date: Wed, 26 Mar 2014 22:14:28 +0530
Message-ID: <533303EC.6020100@gmail.com>
References: <5332645E.4070600@gmail.com> <5332AD40.1020308@gmail.com> <5332F56A.2030506@gmail.com> <5332F9E9.5050905@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=4qbHHbAJEMGXE2X5aSqEfOD4PIoQGJxGBGoYzvl9/S8=;
        b=yFgdcn52Eoxw0JLTk0ID3YjWbSFSXIPEM3aQbbApK5BjJnbqHnWcNaQkeqVL7gJAX3
         d8OfVZpNaZar3GXNnh++ZbD3XCNXSXtraaIIrmKIV6qzGyz1ZJ79P24NeVy1lIRlGX35
         mzNz4ENNlAESF1lImud7Xc4d/XHVqpDEd9ZpOK75PXV0UL2UmWTGBXBPsNVLZlDfxYWU
         BnFqxMld3nhZ9sHlGhyhDBGhRJRtulwnDBnbJpyy15Jx+6I2QgdbU535n1UIbnjStDp8
         MtYTigKJSDCg022fHJgkP8j81jUi8P9gu1H15jQLoJo8g0tzRj4KMuYJbjMm/kUThUYE
         o+9w==
In-Reply-To: <5332F9E9.5050905@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 03/26/14 21:31, Edward Shishkin wrote:
> On 03/26/2014 04:42 PM, dE wrote:
>> On 03/26/14 16:04, Edward Shishkin wrote:
>>> On 03/26/2014 06:23 AM, dE wrote:
>>>> Does reiser4 support ACL?
>>>
>>> Nope for historical reasons.
>>> I'll provide hints how to implement this, if someone wants..
>>>
>>> Edward.
>>
>> Thanks for the response.
>>
>> I was just asking for educational purposes (my home dir recedes on 
>> reiser4).
>>
>> And yes -- I got a major bug to report which cause FF to crash. 
>> Duplicating ~/.firefox solved the problem. I've the bad ~/.firefox.
>>
>> What do I have to do to report the problem?
>
> 1) "bad" means what?
> 2) any kernel complaints?
> 3) results of checking the partition with fsck.reiser4
> 4) Is it possible to reproduce the problem?
>
> Thanks,
> Edward.

I started having problems with FF which was diagnosed to contents of 
~/.firefox. So renamed it to ~/.firefox_bad and copied ~/.firefox_bad to 
~/.firefox to solve the problem.

So I still have ~/.firefox_bad; this problem occurred twice, and I have 
both of the ~/.firefox_bad

Yes -- the kernel showed a backtrace from some reiser4 sources.

fsck.reiser4 was done -- nothing was wrong.

Yes -- I have the ~/.firefox_bad just for the purpose of bug reporting.
