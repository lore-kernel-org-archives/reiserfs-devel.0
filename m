From: Chris Mason <mason@suse.com>
Subject: new v3 2.6.4  logging/xattr patches
Date: Fri, 19 Mar 2004 01:58:59 -0500
Message-ID: <1079679539.11055.101.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

I've just uploaded all the reiserfs patches from the suse 2.6 kernel to:

ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.4

(they should also apply to 2.6.5-rc1 and 2.6.5-rc1-mm2)

These include:
Latency fixes
Logging performance fixes
data=ordered support
quota support
xattrs and acls from Jeff Mahoney

and a few random bug fixes.  There's a README file in the directory with
a some more details.

The names of the files no longer start with numbers to help you figure
out the order the patches get applied.  The directory includes a file
called series that has a list of all the patches in the proper order.

There are various shell tricks to apply things in order.  Or a few
different patch management tools that understand a series file.  I use
quilt (http://savannah.nongnu.org/projects/quilt/) which is very nice.

-chris




