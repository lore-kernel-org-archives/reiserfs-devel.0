From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Regular Plugin
Date: Wed, 16 Nov 2005 10:04:51 -0800
Message-ID: <200511161004.51277.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

The notion of the regular plugin seems odd to me. It is a seperate plugin type 
with distinct plugins that only serve to refer to "file" plugins (which are 
found in plugin/object.c, not in plugin/file/*.c).

So when I create a new "file" plugin, I cannot use it unless I also create a 
"regular" plugin which serves no purpose except to allow me to create those 
"file"s by storing their ID.

A few words explaining why the "regular" plugin field couldn't have somehow 
storeda "file" plugin would be educational. Also, regular is a rather unclear 
name. Something like "defaultfileplugin" might be easier to deduce, or even 
"defaultchild".

-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
