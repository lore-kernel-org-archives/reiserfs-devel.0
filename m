From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Wed, 05 Jun 2002 01:20:50 +0400
Message-ID: <3CFD2F32.7070701@namesys.com>
References: <1023076301.22608.1778.camel@tiny>	<3CFC1CB5.8040102@mb.tu-ilmenau.de> <1023159462.31682.54.camel@tiny> 	<3CFC3F0B.6060707@mb.tu-ilmenau.de> <1023197656.31475.101.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, reiserfs-list <reiserfs-list@namesys.com>

Chris Mason wrote:

>On Tue, 2002-06-04 at 00:16, Manuel Krause wrote:
>
>  
>
>>P.S.: Please, keep me informed, as Namesys seems to need a pushup for 
>>2.4. kernels... ;-) Sorry, Hans! ;-)
>>    
>>
>
>BTW, for general usage, the most important speedup in these patches is
>the commit_super patch.  The namesys guys already have that in the queue
>of stuff to send for 2.4.20-pre.
>
You will see substantial performance increases in 2.4.20

Oleg is doing a complete rewrite of our write function, and is seeing 
large file performance increases of 25%.

We are currently doing a complete analysis of our layout algorithms, and 
I expect some results from that.

Finally, there is V4 which is almost ready to work now.....

Hans


