From: Toby Thain <toby@smartgames.ca>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 13:42:01 -0300
Message-ID: <0D658DE9-E05E-471E-A881-20F8D9B215CB@smartgames.ca>
References: <46598532.5060505@lncsa.com> <200705291215.48354.vs@namesys.com> <1138AFDD-ED08-4390-A418-807A84342AE9@smartgames.ca> <200705300825.26083.ninja@slaphack.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200705300825.26083.ninja@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


On 30-May-07, at 10:25 AM, David Masover wrote:

> On Tuesday 29 May 2007 07:36:13 Toby Thain wrote:
>
>>>> but you can't
>>>> mention using reiserfs in mixed company without someone accusing
>>>> you of
>>>> throwing your data away.
>>
>> People who repeat this rarely have any direct experience of Reiser;
>> they repeat what they've heard; like all myths and legends they are
>> transmitted orally rather than based on scientific observation.
>
> Well, there is one problem I vaguely remember that I don't think  
> has been
> addressed, I think it was one of those lets-put-it-off-till-v4  
> things. It was
> the fact that there are a limited number of inodes (or keys, or  
> whatever you
> call a unique file),

But does it cause data loss? One usually sees claims that "reiserfs  
ate my data", or "I heard reiserfs ate somebody's data", but without  
supplying a root cause - bad memory? powerfail? bad disk? etc.

> and no way of knowing how many you have left until your
> FS will suddenly, one day refuse to create another file.
>

> ... switching away from Reiser4
> means I no longer see random files (including stuff in, for  
> example, /sbin,
> that I hadn't touched in months) go up in smoke.

I only wish sanity had prevailed over  kernel inclusion, then we'd  
see it shaken down a lot quicker, like R3 was.

>
> Ordinarily I like to help debug things, but not at the risk of my  
> data. Maybe
> I'll try again later, and see if I can reproduce it in a VM or  
> somewhere
> safe...
>
> I do still follow the list, though, in case something interesting  
> happens.

Yeah, R4 is "something interesting". :) I still hope it gets finished...

--Toby

> It
> was fun while it lasted!

