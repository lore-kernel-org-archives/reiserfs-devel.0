From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Two usage examples for attribute directories.
Date: Sun, 04 Dec 2005 20:27:16 -0800
Message-ID: <200512042027.16525.pvh@uvic.ca>
References: <200511201317.12598.pvh@uvic.ca> <200512021649.54939.pvh@uvic.ca>
 <43917967.4080008@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27187-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <43917967.4080008@st-andrews.ac.uk>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi Peter F, Hans, and all,

we had a great group meeting today and I think managed to come up with some 
reasonable explanations. I will break the threading a bit to answer the 
questions coherently, but I believe this answers all questions asked, so if 
I've missed any, please let me know.

Let me begin by assuming that attributes are not in any way different from 
normal files and show how that leads to some limitations. I will imagine a 
more detailed use case.

Bundled apps. I would love to be able to distribute applications as 
single-file bundles with all their resources in them, like this:

----------------------

$ # look at the resource files contained in app/
$ ls app/
bin
lib
src
var
Makefile
icon.png
install.sh

$ # run app
$ ./app
This version of app is not built for your platform.
Please run "cd app/; ./configure; make;" to update the build for your 
platform.

$ # okay, we'll recompile app for our system
$ cd app/; ./configure; make;
Compiling app...
Done.

$ # let's see if it works
$ ./app
Starting app...

$ # yep, looks good! let's install it.
$ sudo app/install.sh --prefix=/usr/local
Installing app into /usr/local...

# Note that app is now installed so the ./ is no longer needed.
$ app 
Starting app...

$ # done.

----------------------

That demonstrated using file-directories to contain resources. Any file-dir 
application would add itself to its own path on startup. This would be 
supremely useful for projects like Klik, and implements (I would say) ideally 
the things that OS X is currently emulating with their "prog.app" 
directories. 

Still, say we'd like to be able to also specify some attributes for app, let's 
say "author", "version", "name", "description", "contact", "category" -- 
things that would be useful for creating a menu entry.

Now the directory begins to get ugly...

$ ls app/
author
bin
category
contact
description
lib
name
src
var
version
Makefile
icon.png
install.sh

But which are attributes? If only our namespace provided us a way to seperate 
one group of files from another... Aha! Why not a directory?

$ ls app/@/
author
category
contact
description
name
version
$ ls app/
bin
lib
src
var
Makefile
icon.png
install.sh

Ahh, much better. It also ensures we can preserve Hans' goal of not enforcing 
unnatural structure.  What if I want to find all the files Hans is in any way 
associated with, whether it is as "author", "contact", "inspiration", 
whatever.

I don't want to look into EVERY file on the disk if I don't have to. Instead, 
I can just 

$ grep "Hans Reiser" */@/* 

without having to grep through gig upon gig of other data. Of course, if 
that's what I want to do, the option is still there...

SO! Why privilege the @ directory with its own plugin? Why not just use it as 
a convention?

Efficiency. Files governed by the @ plug-in could have size restrictions, and 
should be packed tightly with their parents. They might have special format 
to fit more into a single disk read. They could be indexed by the operating 
system to make searching for particular values fast.

Control. They might have strict data types or controlled grammars. The @ 
directory might not actually be displayed in a standard "ls" of the directory 
(like "...." isn't). 

Compatibility. The @ directory plugin should definitely have compatibility 
with xattr syntax so that existing software would be able to use Reiser 
attributes "out of the box" without any source changes. That would be a big 
win for driving adoption.

Thus, I conclude that while file-directories are valuable and closely related 
to attribute directories, but the two serve different roles and have 
different design goals, so should be served by different plugins.

On December 3, 2005 02:54 am, Peter Foldiak wrote:
> Are you sure the simple "/" is not a more elegant and simple way to do
> all this.    Peter

No, I'm not sure, but I'm hoping we'll find one by talking about it.

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
