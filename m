From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: space grabbing fixes.
Date: Sun, 14 Dec 2014 00:41:36 +0100
Message-ID: <548CCEB0.2000602@gmail.com>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com> <2450127.6MNmFpgyTD@intelfx-laptop> <5488C06D.4070401@gmail.com> <2158963.qP6uLQDbWK@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=2XK9dPsBMwaRhlps4bU0YZrHR2wsW2+kH2iBOVIYhew=;
        b=FO6WEGRbF139O8IzTZsjEIxsKtU/aR6W1ODv2fc9qqUuIUblGxi25kydTEa4LMOFDL
         GJIH8+zmRjspVFGZWKw0pcJPhnTMOIWm6TEd3UZHyCGjU8S1KB29cQZo0snU0/Hhcr0V
         nNglbuGjbcHw/gMO3ux7I0HhWWacHj3g2aUrrELEvkEc1Ysv8BrgAifsYElH48OQagYO
         rj6fGmMXWtn/6gl3+bI+1YZ0W7ZxYp3bfjCxmbpwK2DJpBgJzQdYN5LC/IwFcht6QLN1
         xQCxopDz+2S4RnhSOxMG0cs1EbiiIBSxa9tG4FJoueH6hi9xwhilFh5GGduYAxVHrIcg
         YPsw==
In-Reply-To: <2158963.qP6uLQDbWK@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 12/12/2014 11:19 PM, Ivan Shapovalov wrote:
> On Wednesday 10 December 2014 at 22:51:41, Edward Shishkin wrote:	
>> On 12/10/2014 02:30 PM, Ivan Shapovalov wrote:
>>> On Wednesday 10 December 2014 at 13:52:08, Edward Shishkin wrote:	
>>>> On 12/10/2014 01:27 PM, Ivan Shapovalov wrote:
>>>>> [...]
>>>>> ping, what's the status?
>>>> This is in "upstream" already.
>>> Hm.. I didn't see it..
>>>
>>> Well, then a follow-up fix should be applied, as described in one of previous
>>> messages, or this should be reverted.
>>
>> With that patch things looked better and you promised
>> "equivalent transform". OK, I'll roll it back then.
> Yes, that was a mistake. It's actually not an equivalent transformation.
> And I need to think what to do with this, because current code looks messy,
> but things are apparently so fragile...
>
> Are there any documentation on the "space grabbing" subsystem?


Nop.
I think that you grasped the basic idea of the reservation
subsystem perfectly.


>   For example,
> there's some flush code which grabs reserved space _without_ taking the mutex..


Most likely it is not needed for some subtle reasons,
which nobody remembers.

Edward.
