From: Peter van Hardenberg <pvh@uvic.ca>
Subject: More from the Weekday Warriors
Date: Wed, 09 Nov 2005 23:47:32 -0800
Message-ID: <200511092347.32743.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26842-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Project News:
-----------------
Alright, today was another good solid eight hour day of Reiser hacking. We 
finally have most of a grip on the specifics of how the pseudo-plugins work, 
how they interface with the filesystem, and so on.

Our plan has further matured: the filedir (pronounced rather like folder) 
plugin will be a regular file-type plugin, and will simply inherit most of 
its methods from file.

As the file-contents will already be monopolizing the i-node, a filedir will 
also have a pointer to a second directory inode which will contain the 
filedir's contents. All directory-related lookups will be routed through to 
that.

The rough implementation plan is as follows:

1) Attempt a trivial change to Reiser and ensure it loads. (Done.)
2) Clone an existing plugin. (In progress.)
3) Replace existing plugin's methods with pass-through methods.
4) Associate a directory (with requisite plugin) with the filedir.

Plugin Project Statistics:
------------------------------
pages of code printed: >200
hours spent reading Reiser4 code: 25
lines of code modified and compiled: 1

Where should attributes live:
------------------------------------
Hans, I like the idea that files should be (for those who want it) treatable 
indistinguishably from directories. The contained-by would get very tedious 
with deep nesting, as that is already how the / translates for me.

I propose this:

files /are/ a normal directory (for resources) and /have/ an invisible 
subdirectory (for attributes) (perhaps "fivedot"?).

The use of a seperate ontological entity for attributes is defensible: first, 
without it, the user attributes are visible in a way system attributes are 
not. More significantly, by separating the two they can be packed differently 
and the attributes could have special properties. Without too much thought 
about the consequences, I'd probably want indexing, two-way compatibility 
with xattr, compression, and perhaps something like size/format restrictions. 
I can think of about a half-dozen other attribute-specific features and 
optimizations I'd want in a perfect world, but I'll leave it at that for now.

Question for the Day:
---------------------------
What files need modification to add a new plugin which does not require inode 
extensions?

How can I set the plugins governing a file from userspace? Can it be done from 
within fourdot? My experiments were unsuccessful.

What would a "hello world" plugin look like? It would be valuable to have one 
lying around for future developers. We have discussed creating one, but I 
feel as though "plugging" and "unplugging" plugins requires a huge amount of 
work right now and that would reduce its utility. Perhaps it would make sense 
if it were distributed as a patch with a plugin developer's guide.

-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
