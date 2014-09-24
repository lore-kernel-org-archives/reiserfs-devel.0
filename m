From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Non-deleted directories (Was Re: reiser4 (ccreg40)...)
Date: Wed, 24 Sep 2014 21:51:53 +0200
Message-ID: <542320D9.8050601@gmail.com>
References: <1466481.l6KPymqJEh@intelfx-laptop> <5410B1CB.3080705@gmail.com> <4194447.EgbZsqfSzA@intelfx-laptop> <5411D8F8.2070603@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=9eXXH8yw/yBWbpU0tNNLhytMZ6zXWKc2ICRjkZ3Y7nw=;
        b=hqtPkDneMCB+wohdYZBfIa/xADBsP1Z/FEOMLG+nIu3jJUDfksJMkAGjTNImCIq6rd
         yAQ6gz1+EJI5/wBaq4WDYpbuqFjllf9hYYtqAH6K/vs+OyNN+X0A3BFH2VWqL7BP0SSW
         jt4tt6K8p2XTK2PN6nL9nMVzR//07P0GGPkHvCJ5UWwqN+b9h54OCl1UT08kJlALnAXH
         mhzyH5+JpSgG0/tPnCO2u2oKrICQmkfSyYuB5aP1eahZtamovcEKhEoKRQ9Wshmyleqe
         GmDcIFm/7ndC4RY8zDdaMkXwvyFazNneqUowluDd7yKw1i6DeHHrlGVpBiKcgzhQTQ5H
         xDGw==
In-Reply-To: <5411D8F8.2070603@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

On 09/11/2014 07:16 PM, Edward Shishkin wrote:
>
> On 09/10/2014 11:39 PM, Ivan Shapovalov wrote:
>

[...]

>>>> 3a. I can reproduce the "directory not empty" bug :) Interestingly, 
>>>> it is
>>>> always the same directory under the aforementioned huge hierarchy. 
>>>> (I've
>>>> done the unpack-remove cycle a few times.)
>>> I've made a conclusion that this is caused by unexpected disappearing
>>> of a record, which represents a directory entry in the directory item
>>> (currently directory items are managed by cde ITEM plugin, aka 
>>> "compound
>>> directory entries"). In the error path (ENOENT) the size of the 
>>> directory is
>>> not decremented, which makes the directory undeletable. I still 
>>> don't know
>>> who kills the entries. Special debugging info is needed to find/fix it.
>> What kind of information is needed?
>
>
> We need to find all places, where the records are created / killed
> and insert a hook, which prints such events for the entry which
> unexpectedly disappears. This will get us a chance to find the culprit.
> I have to say: this is not a big fun...


Ughhh, parse_cut (node40.c) is the culprit.
If region to cut contains objects with non-unique keys (the case of
hash collisions), then this function evaluates the cut mode incorrectly.

I think that this bug has been introduced implicitly ~11 years ago
after the design change in reiser4 (introducing non-unique keys).

I'll provide the fixup later..

Edward.
