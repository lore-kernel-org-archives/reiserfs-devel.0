From: Hans Reiser <reiser@namesys.com>
Subject: Re: new reiser4 snapshot
Date: Tue, 28 Oct 2003 00:28:16 +0300
Message-ID: <3F9D8DF0.5000302@namesys.com>
References: <Pine.LNX.4.44.0310191956060.15715-100000@poorvi.cse.iitd.ernet.in> <3F92D35D.3090806@namesys.com> <3F93132D.70206@gmx.net> <16275.44662.847152.412738@laputa.namesys.com> <20031027202556.GI4511@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15908-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031027202556.GI4511@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, Nishant Sharma <nishantt@cse.iitd.ernet.in>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Mike Fedyk wrote:

>On Mon, Oct 20, 2003 at 01:44:22PM +0400, Nikita Danilov wrote:
>  
>
>>Carl-Daniel Hailfinger writes:
>> > I thought CONFIG_REISER4_LARGE_KEY was force-enabled by now?
>>
>>No. But:
>>
>>1. one has to use -o key=key_short option for mkfs.reiser4 to create
>>file system with small keys.
>>
>>2. lately we mostly test/care about large keys performance and
>>stability.
>>    
>>
>
>So why would one want short keys in the first place then?
>
>
>  
>
If you are going to access your files in the order that you wrote them 
rather than in readdir order, use short keys.  You are unlikely to want 
to use short keys.  large keys were a controversial design decision that 
worked.  Someday we will write something to allow readdir order to be 
creation time order (at the cost of directories not being able to scale 
to large sizes effectively), and then short keys will be useful again 
for a more significant fraction of users.

maybe config help needs to say that....  nikita, please fix....

-- 
Hans


