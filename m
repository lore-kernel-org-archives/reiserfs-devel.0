From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Implementing an attribute directory.
Date: Sun, 20 Nov 2005 13:17:12 -0800
Message-ID: <200511201317.12598.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27038-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

We have an implementation plan for the attribute plugin. We plan to base it 
around the plugin.c so that it can be available for all files, directory or 
otherwise.

Every file which has a pseudo will gain a new user-attributes pseudofile. This 
pseudofile will essentially wrap a standard directory. In order to provide 
support for this directory, this plugin will include a new field on the inode 
which points to a standard dir_file.

When a new file is created, this inode will be created as well, and when a 
file is deleted, this one must be removed (with children) as well. Future 
versions should provide the optimization of only creating the inode once it 
becomes needed and otherwise simulating an empty directory.

Namesys folks, does this seem like a good course of action?

-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
