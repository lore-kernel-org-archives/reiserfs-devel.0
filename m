From: alftheo potgieter <alftheo@telkomsa.net>
Subject: rebuild-tree does not complete: filesystem full
Date: Tue, 21 Mar 2006 00:44:42 +0200
Message-ID: <441F305A.20809@telkomsa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28301-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi
I'm using the latest reiserfsck (3.6.19),,
My filesystem got corrupted by an unexpected power loss. Initially, I 
could mount the filesystem read-only with minor problems. As I had 
nowhere to back it up, I ran reiserfsck --rebuild-tree, which could not 
complete, as the filesystem was full.

Now it is flagged as unmountable "to prevent further corruption". Is 
there any way to restore the filesytem to the previous mountable but 
corrupted state (which would be infinitely more useful)? I imagine 
either finding the root node again or somehow growing the filesystem (as 
I have since found enough space to grow it)

Any help would be useful.

alf
