From: Jon Smirl <jonsmirl@yahoo.com>
Subject: Debugging Reiser4 with UML in 2.5
Date: Tue, 10 Dec 2002 13:52:37 -0800 (PST)
Message-ID: <20021210215237.43081.qmail@web14905.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I'm trying to give the new Reiser4 a whirl with UML in
a 2.5 kernel. I can't seem to figure out how to make
gdb work right in this setup. I've heard that UML is
being used to develop Reiser4 so maybe you can give me
some pointers.

I have the 2.4.59 kernel built with UML and Reiser4 in
it. I can boot and come to a prompt. I can mount my
reiser4 volume and make files on it, etc..

Now I start up ddd on the host and attach to the
tracing thread for UML. I add a "br reiser4_read" and
continue.

From the UML prompt I cat a file. My UML console
prints out "Trace/breakpoint trap" and continues.

How do I get a gdb hooked to the right process so that
it will catch the breakpoint?


=====
Jon Smirl
jonsmirl@yahoo.com

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
