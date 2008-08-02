From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: iozone results
Date: Sat, 02 Aug 2008 13:48:44 +0400
Message-ID: <48942D7C.7090302@gmail.com>
References: <13479.202.168.22.19.1217597929.squirrel@webmail.vel.net.au>    <4893169C.8010000@gmail.com> <25030.202.168.22.19.1217662279.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <25030.202.168.22.19.1217662279.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

doiggl@velocitynet.com.au wrote:
> Questions for Edward:
> 1. What are  good tests/or scripts you use (which is available and are
> valid)  to measure throughput on a reiser4 partition ?
> 2. Do you have an example I can use, or try ?
>   

If you want to play with compressed data, then I don't know
such tests: transparent compression is rather new feature for
a file system and all existing public benchmarks are old.

There is a namesys corporative benchmark (mongo.pl).
It also doesn't take care about file content. However, it is
possible to add an option so that mongo will use a content of
specified file (in ramfs). If it seems interesting for you, then let
me know and I'll send you the stuff.

Edward.

> Thank you
> Glenn.
>
>   
>> Edward wrote:
>> I am sorry, but iozone doesn't take care of file content and writes
>> something like well compressible zeros. So the results above are
>> meaningless.
>>
>> Thanks,
>> Edward.
>>     
>
>
>
>   

