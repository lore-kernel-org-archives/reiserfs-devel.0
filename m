From: dannym <danny.milo@gmx.net>
Subject: reiser4: writing plugins
Date: Fri, 16 Dec 2005 20:58:48 +0100
Message-ID: <1134763128.18089.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27409-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

So I want to start writing a small plugin to get a feel for the
architecture...

I wonder how to do that?

I read that in order to write plugins, one has to recompile the
kernel... which is ok, but that also means that it will affect
everything and when I make a mistake, everything goes bad :)

So I wondered if all you reiser4 developers have some kind of sandbox
thing that just does the same with a library (without the kernel) and on
an image file?

Or do you use a virtual machine for that kind of stuff? 

As for what I thought would be a nice intro thing for me to write is:

Adds a pseudo file "tree-contents-size" for directories.
Pseudo file contains the "du" starting from this directory.

What it should do is cache some kind of "du"-like value per directory.
When you change a file size (or delete a file, add a file, ...) in the
dir or one of it's subdirs, it shall set a dirty flag on the value.
When the pseudo file is accessed, it shall calculate it anew, also
updating the subdirs' pseudo files if so needed, and store it actually
on disk...
(could also be updated periodically without anyone requesting it, but
that's just a detail)

What do you think? Useful? Bad Thing? Already done? Too hard for a first
try?

cheers,
  Danny


