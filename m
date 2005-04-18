From: "Mahmoud Al Gammal" <mahmoudfg@gawab.com>
Subject: Re: Bad superblock
Date: Mon, 18 Apr 2005 13:11:19 GMT
Message-ID: <20050418131119.9868.qmail@gawab.com>
References: <20050416191336.14054.qmail@gawab.com>
            <1113815304.3781.42.camel@tribesman.namesys.com>
            <1113816139.3975.51.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1113816139.3975.51.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


This actually helped..thanks a ot.
But wouldn't it be useful to keep replicas of the superblock?
IIRC, ext3 does that.

Vladimir Saveliev writes:

> Hello
> 
> On Mon, 2005-04-18 at 13:08, Vladimir Saveliev wrote:
>> Hello
>> 
>> On Sat, 2005-04-16 at 23:13, Mahmoud Al Gammal wrote:
>> > Hello,
>> > I'm using ReiserFS 3.6.19 on a partition whose superblock has
>> > been swept away due to a sudden attack of bad sectors. I'm
>> > wondering if ReiserFS keeps backup copies of the superblock...If
>> > yes, then where?
>> 
>> no, it does not
>> 
>> >  Or is there some other means to retrieve the
>> > data?
>> > 
>> 
>> copy partition with bad blocks to a good one with dd_rescue
>> 
>> reiserfsck --build-sb /dev/good-partition (use default answers if you
>> did not do anything specific with that filesystem like converting 3.5 to
>> 3.6, journal relocation, etc)
> 
> There can be a problem with number of blocks. reiserfsck --build-sb will
> ask for that, I think.
> You should be able to calculate number of blocks in broken filesystem
> with mkreiserfs /dev/bad-partition. It will report you something like
> Count of blocks on the device: 4096560 
> among other lines and ask to continue.
> DO NOT LET IT TO CONTINUE. Use this block number in answers to
> reiserfsck --build-sb.
> 
>> reiserfsck --rebuild-tree /dev/good-partition
>> 
>> If this helps you - you may take a look at namesys.com/support.html
>> 
>> 
> 

