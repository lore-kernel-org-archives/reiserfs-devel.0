From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsync() Performance Issue
Date: Tue, 07 May 2002 03:41:39 +0400
Message-ID: <3CD714B3.6040407@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049BF9B4@corpusmx1.us.dg.com>	<1020463205.3	 946.252.camel@tiny> 	<3CD341EC.9080906@namesys.com>	<1020517884.3947.266.camel@tiny> 	<3CD3F76D.4000708@namesys.com> <1020688827.3947.2087.camel@tiny> 	<3CD6F3D4.9050103@namesys.com> <1020725839.988.50.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:

>On Mon, 2002-05-06 at 17:21, Hans Reiser wrote:
>  
>
>>>I'd rather not put it back in because it adds yet another corner case to
>>>maintain for all time.  Most of the fsync/O_SYNC bound applications are
>>>just given their own partition anyway, so most users that need data
>>>logging need it for every write.
>>>
>>>      
>>>
>>Does mozilla's mail user agent use fsync?  Should I give it its own 
>>partition?  I bet it is fsync bound....;-)
>>    
>>
>
>[ I took Wayne off the cc list, he's probably not horribly interested ]
>
>Perhaps, but I'll also bet the fsync performance hit doesn't affect the
>performance of the system as a whole.
>
 I suspect that on my laptop, downloading emails is disk bound due to 
fsync()....  I haven't measured it, but it "feels" that way.

>
>Mostly, I feel this kind of tuning is a mistake right now.  The patch is
>young and there are so many places left to tweak...I'm still at the
>stage where much larger improvements are possible, and a better use of
>coding time.  Plus, it's monday and it's always more fun to debate than
>give in on mondays.
>
>-chris
>
>
>
>
>  
>

Needing more time to finish analyzing what is going on and what fixes it 
best is always a good reason to defer things....

Hans

