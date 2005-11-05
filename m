From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Plugin authoring.
Date: Sat, 05 Nov 2005 00:17:20 -0800
Message-ID: <200511050017.20410.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26785-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Reiser, Hans" <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans,

We would like to spend some time and arrange a plugin that would allow all 
files to be usable as directories for arbitrary data.

Our reading suggests that this could probably be done with an object plugin 
that combines the functionality of Files and Directories. 

As for the problem of hard links, we will simply disallow them. Although they 
have their uses, file-directories have their own interesting applications 
which I believe deserve exploration regardless of the outstanding problem.

Now that we have found our course, we would appreciate some advice on getting 
started writing a plugin. I have read commentary that there is no "plugin 
author's document" and that the source code will reveal all to those willing 
to read it. Well, we are willing to read and hack, but need a few stars to 
navigate by.

What code should we read in particular? Are there relatively simple examples 
we may follow? Is there API documentation for the storage layer? If weekend 
warriors are to be able to hack on Reiser, perhaps they can learn from our 
experience. According to my limited research, there are no third-party 
plugins yet that we can learn from.

Peter

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
