From: Jon Smirl <jonsmirl@yahoo.com>
Subject: Some general questions about Reiser4
Date: Tue, 10 Dec 2002 17:13:31 -0800 (PST)
Message-ID: <20021211011332.44177.qmail@web14914.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

After reading though all of the material on the web
site and looking at the source code for a while, I do
have to congratulate you on having one of the best
documented programming projects I have seen. Here are
still a few areas that I have questions about....

1) The doc talks about doing something like "ls
file/attrib" to see an attribute that is implemented
as a tiny file. Does this work on Reiser4? How do I
access it? I tried this on my Reiser4 system and
couldn't figure it out.

2) Looking at Reiser 4 as a database, would the path
to the file be considered a primary key? Or is the
primary key to the file system an unique ID and the
path looks up the unique ID? Could I create an
alternative index into the file system based on say
creation date or permissions?

3) Has special consideration been made for parallelism
on SMP systems? For example, common hot spots on
databases are disk allocation, logging, and unique id
generation. These can be implemented so that each
processor gets it own independent copy and never has
to lock against the other CPUs.

4) Since Reiser4 is already SMP capable, how far is it
from being clusterable over a SAN? Having GFS go
closed source has left an opening for a new
alternative.


=====
Jon Smirl
jonsmirl@yahoo.com

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
