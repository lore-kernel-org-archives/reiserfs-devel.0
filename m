From: David Masover <ninja@slaphack.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 01 Sep 2005 12:03:31 -0500
Message-ID: <43173463.40302@slaphack.com>
References: <20050901134604.31ddd297@SiRiUS.home>	<20050901144842.34629bcf@SiRiUS.home>	<4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25798-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431726F2.1090508@redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Staubach <staubach@redhat.com>
Cc: Hans Reiser <reiser@namesys.com>, vs@namesys.com, reiserfs-list@namesys.com

Peter Staubach wrote:
> Hans Reiser wrote:
> 
>> Research for filesystems generally says that as you get more than 85%
>> full the performance goes down, by a lot as you get close to 100%.  5%
>> is probably too little rather than too much.
>>  
>>
> 
> Wow.  What is all that space used for?  Other journalling file systems that
> I have seen have limited things like journals to a much smaller space,

I thought that it wasn't just for the journal, but rather, for the 
journal, metadata, and to make things saner when you fill up your drive.

Because of lazy allocation and the way things are packed, for a given 
write on an almost-full disk, the FS doesn't know at the time your 
write(2) call returns whether or not it succeeded or ran out of space. 
So, you want to have somewhat more space available than you have RAM.

But, like the decision to keep bitmaps locked in RAM, it seems very much 
overkill, and should definitely be tunable, at least.  Terabytes aren't 
just for the enterprise anymore.
