From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Plugins: Pseudo-fun.
Date: Wed, 09 Nov 2005 03:20:32 -0800
Message-ID: <200511090320.33063.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Project update:
-------------------
Well, we have wallpapered one of the labs here at UVic with Reiser4 code, 
printing page after page and taping them together, hanging them on the walls 
and highlighting them. This was the first time in years that I missed having 
a dot-matrix tractor-feed printer around. 

Tracing the execution down through the various chains of plugin methods into 
the plugin set and then into pseudo.c. Pseudo.c is a much better example file 
than dirc or file.c, the comments are superior and there are many small 
examples of plugins. Here we had our insights and our inspiration:

Although the overall goal remains elusive, we think we should be able to 
implement a new Reiser4 pseudo directory in 4dot (/..../). This directory, 
called "user" will contain per-file user-defined attributes. These will be 
(if I am using the terminology correctly) grandparent-locality-packed and 
will be, by convention, very small. (Perhaps the user attributes should be 
somewhere else? ...attributes vs ...system? I know this is one of those 
ongoing debates.)

Playing nice with xattr:
----------------------------
It is my opinion that xattr support could be added to provide an alternate 
interface to the same mechanism, thus applications expecting xattr would be 
able to both read and operate on reiser file-style attributes, a major win 
for interoperability. Gotta read more.

Big Question of the Day:
--------------------------
One big question that follows from today's discoveries and plans: What would 
be the best method to store these small attribute files? I see no need to 
reinvent the wheel -- this is a directory -- but how/where do we store the 
data? Suggestions welcome.

Odd Behavior:
------------------

Regression problems immediately spring to mind:
pvh@arroyo:~/reiser/test $ cd ....
pvh@arroyo:~/reiser/test/.... $ cd ....
pvh@arroyo:~/reiser/test/..../.... $ cd ....
pvh@arroyo:~/reiser/test/..../..../.... $ cd ....
pvh@arroyo:~/reiser/test/..../..../..../.... $ cd ....
pvh@arroyo:~/reiser/test/..../..../..../..../.... $ cd ....
pvh@arroyo:~/reiser/test/..../..../..../..../..../.... $ cd ....
pvh@arroyo:~/reiser/test/..../..../..../..../..../..../.... $ cd ..
pvh@arroyo:~/reiser/test/..../..../..../..../..../.... $ cd ..
pvh@arroyo:~/reiser/test/..../..../..../..../.... $ cd ..
pvh@arroyo:~/reiser/test/..../..../..../.... $ cd ..
pvh@arroyo:~/reiser/test/..../..../.... $ cd ..
pvh@arroyo:~/reiser/test/..../.... $ cd ..
pvh@arroyo:~/reiser/test/.... $
Sure, it's right (.... is of type pseudo directory), but I wouldn't want my 
directory tree traversal to ever end up in the bottomless pit of 4dot-doom by 
mistake. 

Crashing and glitching:
pvh@arroyo:~/reiser/ $ cd A2.mp3/...<tab>
freezes the console. I think regular files, when pseudo data is enabled, need 
to provide some basic directory functionality so that users don't 
accidentally blow things up. 

pvh@arroyo:~/reiser/A2.mp3/ $ ls
ls: reading directory .: Not a directory

How would you recommend we implement this so that these errors go away?

Neat stuff:

pvh@arroyo:~/reiser/test/.... $ ls ..
A2.mp3  boo  test
pvh@arroyo:~/reiser/test/.... $ perl
open(N, '>>', 'new'); print(N "newfile"); close(N);
pvh@arroyo:~/reiser/test/.... $ ls ..
A2.mp3  boo  newfile  test
pvh@arroyo:~/reiser/test/.... $    

But what's it for? I was hoping to be able to actually create new attributes 
on a normal file with this, but no dice. It only works for directories.

That's probably more than enough for one night, but we had a real marathon 
session today and have another planned for tomorrow starting in the early 
afternoon. 

Hope people are finding these interesting,
-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
