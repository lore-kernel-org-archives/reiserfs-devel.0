From: Anders Widman <andewid@tnonline.net>
Subject: Power loss vs. Resizing
Date: Sun, 9 Mar 2003 12:59:01 +0100
Message-ID: <14546312125.20030309125901@tnonline.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


   hat happens if there is a power loss during resize. Will everything
   be as normal, or would the FS get totally corrupted?

   It  would  seem  as  a  good  idea to have a flag or something that
   markes  the  FS  as "beening resized" and keep a log/journal of the
   resizing on another fs/volume.

   How is it handled now?
   
   //Anders


--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

