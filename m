From: Hans Reiser <reiser@namesys.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 01 Sep 2005 15:17:55 -0700
Message-ID: <43177E13.30006@namesys.com>
References: <20050901134604.31ddd297@SiRiUS.home>	<20050901144842.34629bcf@SiRiUS.home>	<4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25810-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431726F2.1090508@redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Staubach <staubach@redhat.com>
Cc: vs@namesys.com, reiserfs-list@namesys.com

Peter Staubach wrote:

> Hans Reiser wrote:
>
>> Research for filesystems generally says that as you get more than 85%
>> full the performance goes down, by a lot as you get close to 100%.  5%
>> is probably too little rather than too much.
>>  
>>
>
> Wow.  What is all that space used for?

Emptiness.  So that when you need a free block you don't go to the end
of the disk drive to get it.  Not for journals, metadata, just
emptiness.  Bigger journals are a completely different topic.

>   Other journalling file systems that
> I have seen have limited things like journals to a much smaller space,
> expressed in megabytes, and a much smaller number than thought
> originally.
> The bigger journals just didn't end up adding to the performance
> measurably
> and were just considered to be a waste of space that could be used more
> usefully.
>
>    Thanx...
>
>       ps
>
>

