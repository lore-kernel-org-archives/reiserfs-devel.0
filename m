From: John <geearf@free.fr>
Subject: Re: Reiser4 resize
Date: Mon, 3 Mar 2008 21:59:59 +0100
Message-ID: <0f5c92f3901a9fee53965e43e4bca960@free.fr>
References: <b8d16a880803021439m58cb9251uabe3b57c1c57f971@mail.gmail.com>
Reply-To: geearf@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <b8d16a880803021439m58cb9251uabe3b57c1c57f971@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


Edward Shishkin wrote:
>Oleg Osovitskiy wrote:

>>Hello!
>>  
>>

>Hi

>>  Does Reiser4 fs support resize as reiserfs ?
>>  
>>

>nop, sorry..

>>If yes which tool I have to use to enlarge my reiser4 fs ?
>>
>>---
>>Best regards, Oleg O. Osovitskiy
>>mailto:o.osovitskiy@rambler.ru, icq# 33366588


Hi there,

While playing with LVM today I was wondering about that too.
How hard would that be?
(What will follow are just assumptions from my memories of writing FS, so sorry if I'm way off with R4)

- Growing should not be too hard as only the main table would need to be changed no?
- As for shrinking I see 2 cases:
   a- There is no data beyond my desired new end, it looks like I only need to modify the table
   b- There is some data bothering us, now we need to pull it the same way as a repacker would do I believe.


The first 2 cases look easy. For the last it would need something close to a defrag.

So again, how hard would it be to write a dirty resizer? I have no Linux or R4 dev knowledge, but I have a lot spare time and I'm willing to put some of my data at risk. C is not an issue either. Do you think I can try something if you give me some pointers or am I just day-dreaming?

Thanks,

John

