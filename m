From: Hans Reiser <reiser@namesys.com>
Subject: Re: Debugging Reiser4 with UML in 2.5
Date: Wed, 11 Dec 2002 01:09:40 +0300
Message-ID: <3DF66624.7070203@namesys.com>
References: <20021210215237.43081.qmail@web14905.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021210215237.43081.qmail@web14905.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jon Smirl <jonsmirl@yahoo.com>
Cc: reiserfs-list@namesys.com, Oleg Drokin <green@namesys.com>

Jon Smirl wrote:

>I'm trying to give the new Reiser4 a whirl with UML in
>a 2.5 kernel. I can't seem to figure out how to make
>gdb work right in this setup. I've heard that UML is
>being used to develop Reiser4 so maybe you can give me
>some pointers.
>
>I have the 2.4.59 kernel built with UML and Reiser4 in
>it. I can boot and come to a prompt. I can mount my
>reiser4 volume and make files on it, etc..
>
>Now I start up ddd on the host and attach to the
>tracing thread for UML. I add a "br reiser4_read" and
>continue.
>
>>From the UML prompt I cat a file. My UML console
>prints out "Trace/breakpoint trap" and continues.
>
>How do I get a gdb hooked to the right process so that
>it will catch the breakpoint?
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
Oleg will answer your questions in 9 hours (we are in Moscow)....

