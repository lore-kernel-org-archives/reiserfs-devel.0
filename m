From: Hans Reiser <reiser@namesys.com>
Subject: Re: 'let the hdd remap the bad blocks'
Date: Mon, 19 Aug 2002 23:18:15 +0400
Message-ID: <3D614477.8050500@namesys.com>
References: <5.1.1.6.2.20020819155611.01ff7af0@pop.tvnet.hu> <20020819195906.A19984@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Newsmail <newsmail@satimex.tvnet.hu>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>   Basically uyou'd better search for this on HDD vendors sites.
>   What's going on is simply can be described this way:
>   You write some block to HDD, if HDD decides the block is bad for some reason
>   and remapping is allowed (usually by tiurning on SMART), block is written to
>   different on-platter location and drive adds one more entry to its
>   remaped-blocks list. Next time you read this block, drive consults its
>   remapped blocks list and if block is remapped, reads it from new location
>   with correct content.
>   Described mechanism works for writing.
>   Actually I've seen something that looks like remapping on read, though 
>   I have no meaningful explanation for that (except that they may have some
>   extra redundant info stored when you write data to disk, so that if sector
>   cannot be read, its content is restored with that redundant information and
>   sector is then remapped.). And this process takes a lot of time.
>
>Bye,
>    Oleg
>On Mon, Aug 19, 2002 at 03:58:30PM +0100, Newsmail wrote:
>  
>
>>Hello Hans and Oleg,
>>maybe its an offtopic question, but Hans always talks about leaving the 
>>hard disk to remap the bad blocks by itself. could you explain it in some 
>>words, how all this works, what happens after, and since when it exists, or 
>>do you have any special URL explaining this?
>>thx in advance,
>>greg
>>
>>
>>
>>    
>>
>
>
>  
>
Just taking a guess, many hard drives have difficult and time-consuming 
procedures that they can go through to read a troublesome block.  These 
can take 20-30 seconds.  Probably if they have to go through these 
procedures, once they finally succeed the smart vendors remap the block.

Hans


