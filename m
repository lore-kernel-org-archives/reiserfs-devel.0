From: Hans Reiser <reiser@namesys.com>
Subject: Re: Some general questions about Reiser4
Date: Wed, 11 Dec 2002 04:27:18 +0300
Message-ID: <3DF69476.7070601@namesys.com>
References: <20021211011332.44177.qmail@web14914.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021211011332.44177.qmail@web14914.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jon Smirl <jonsmirl@yahoo.com>
Cc: reiserfs-list@namesys.com

Jon Smirl wrote:

>After reading though all of the material on the web
>site and looking at the source code for a while, I do
>have to congratulate you on having one of the best
>documented programming projects I have seen. Here are
>still a few areas that I have questions about....
>
>1) The doc talks about doing something like "ls
>file/attrib" to see an attribute that is implemented
>as a tiny file. Does this work on Reiser4? How do I
>access it? I tried this on my Reiser4 system and
>couldn't figure it out.
>
Not yet implemented, but the infrastructure is getting there.  We 
(somewhat) adhere to the define the minimum functionality needed to 
ship, make it work, ship, then do the rest development model.

>
>2) Looking at Reiser 4 as a database, would the path
>to the file be considered a primary key?
>
The name within the directory would be considered the primary key in the 
semantic layer.

> Or is the
>primary key to the file system an unique ID and the
>path looks up the unique ID? Could I create an
>alternative index into the file system based on say
>creation date or permissions?
>
The "key" is considered the primary/only key in the storage layer.

>
>3) Has special consideration been made for parallelism
>on SMP systems? For example, common hot spots on
>databases are disk allocation, logging, and unique id
>generation. These can be implemented so that each
>processor gets it own independent copy and never has
>to lock against the other CPUs.
>
How do I put it.  Reiser4 scales perfectly in its design;-), and there 
will be a long period of running benchmarks and finding bottlenecks we 
failed to consider.

>
>4) Since Reiser4 is already SMP capable, how far is it
>from being clusterable over a SAN? 
>
About $850,000 far away.;-)  I say this without having done a real study 
of it.  We have sold licenses to reiser3 to proprietary clustering fs 
vendors.  They spend orders of magnitude more than that, but I am far 
lower in my costs than they are (no silicon valley office, etc.)

>Having GFS go
>closed source has left an opening for a new
>alternative.
>
Encourage your local government to give us a grant, and we'll do it.;-) 
 I am a bit more interested in globally distributed than SAN, but I am 
flexible.  Everybody is doing clusters, so I would prefer to go globally 
distributed and make them the smaller niche market.  NFS doesn't scale 
globally, etc., etc.

>
>
>=====
>Jon Smirl
>jonsmirl@yahoo.com
>
>__________________________________________________
>Do you Yahoo!?
>Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
>http://mailplus.yahoo.com
>
>
>  
>
Best,

Hans

