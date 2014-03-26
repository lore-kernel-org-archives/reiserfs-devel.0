From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: ACL support.
Date: Wed, 26 Mar 2014 17:01:45 +0100
Message-ID: <5332F9E9.5050905@gmail.com>
References: <5332645E.4070600@gmail.com> <5332AD40.1020308@gmail.com> <5332F56A.2030506@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=BMYcKU/yc9uJpG/OuK3aXSssr9pKPCZzdp/otfrJFPw=;
        b=LVqm7y9pQ7C9Del8fDBwKpf6PWhv+voZEX9aKf/mKS6hjrjcfZMs/Rk/vgRfahj68l
         QYDbjnPseg7oR5+aY1O56vk5y/DBIIeObbTdWY10umqMq73/FGrGYwuhV8CfKm7rUyiB
         fKUdpiJjmaWg1eeSNAGTLtqo0Dtdx/0LlFt888wsZ0PON71zyS5MAcXBNau1vJraz6/H
         62dBe1fpbSNr2AZQGBfCOfDrL1xhHKz5h8J0R8jcZdbdZDtvKiGQ2N/41UcTr+kuGHb4
         dNpKpgbjdpzv6F1m8zVFsCjQKcfvtz0rv0xw3er+0NOOEpyj1mGU/wP4EMBQDnfvDw72
         eUPQ==
In-Reply-To: <5332F56A.2030506@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 03/26/2014 04:42 PM, dE wrote:
> On 03/26/14 16:04, Edward Shishkin wrote:
>> On 03/26/2014 06:23 AM, dE wrote:
>>> Does reiser4 support ACL?
>>
>> Nope for historical reasons.
>> I'll provide hints how to implement this, if someone wants..
>>
>> Edward.
>
> Thanks for the response.
>
> I was just asking for educational purposes (my home dir recedes on 
> reiser4).
>
> And yes -- I got a major bug to report which cause FF to crash. 
> Duplicating ~/.firefox solved the problem. I've the bad ~/.firefox.
>
> What do I have to do to report the problem?

1) "bad" means what?
2) any kernel complaints?
3) results of checking the partition with fsck.reiser4
4) Is it possible to reproduce the problem?

Thanks,
Edward.
