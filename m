From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard support
Date: Tue, 06 May 2014 10:58:53 +0200
Message-ID: <5368A44D.5090607@gmail.com>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <1461643.AZxFf0Q2dH@intelfx-laptop> <53654FE6.7030408@gmail.com> <2562062.LWrRe7vaEB@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=/y13deGlwwFzDVcvBruUajntUgWnBE4ry2le35ODFsY=;
        b=WGBY4dMDh508356t91COiX8xcJMErA7y3QCp1+AzbJqMj0kdR/JvtjmGlqUFqQtP15
         OgiHCOrWBRrRBwWeGA8bRbmZ/9YeMwWDyRImrTmlX1H1aIygl+I6Ssu5SoOpcMgaY5ml
         Bj2epx5SygeVy9Wj+1MAbZcw8EqruTOS43Om5+UPf8eY1aQ7ZdRMpnsMxuQpxPI+6+7n
         Oi9vxDZpawmh6fVKUHv7NGnGwtww/X5RZHWEHyRQOmLASLQnNfP+ZNy7wT4Nfz11ZuDw
         A5Mqdd04Xk/3nPy0scIIiTKEKEC2QG4bOcSA3XPGrr7LQ0OHv6UD71JntzSV+LvLybtH
         IzPg==
In-Reply-To: <2562062.LWrRe7vaEB@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/03/2014 10:32 PM, Ivan Shapovalov wrote:
> On Saturday 03 May 2014 at 22:21:58, Edward Shishkin wrote:	
>
> TBH, I have never looked at the deallocation paths in reiser4: everything
> worked fine there.. BTW, why not to use atom's delete_set to discard
> things? Could you please take a look?
[...]
>>> Blocks used for the journal (wander.c) are deallocated without BA_DEFER
>>> set
>>> and thus they never hit delete_set. However, we want to discard these.
>> This happens in error paths. Don't be so scrupulous ;)
> I don't think so:
> - wander.c:485
>    dealloc_tx_list() <- reiser4_write_logs()
> - wander.c:505
>    dealloc_wmap_actor() <- dealloc_wmap() <- reiser4_write_logs()


Yep, indeed.
I don't completely understand this special case of wandered blocks.
Also I don't see where wandered blocks are deallocated after journal
replay (as journal is not needed any more): it can be a possible leak
of disk space after system crashes..
Once we understand it, I think we'll able to re-use the delete_set for
discard needs.

Edward.


>
>> Also users will use copy-on-write transaction model for their SSDs(*),
>> and in this mode journals are tiny: they contain only system blocks.
>> In short, there is nothing to discard..
>>
>> (*) http://marc.info/?l=reiserfs-devel&m=139449965000686&w=2
>>

