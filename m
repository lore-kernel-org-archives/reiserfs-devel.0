From: "Mike Diehl (Encrypted email preferred)" <mdiehl@diehlnet.com>
Subject: Trying to recover from bad block
Date: Mon, 6 Mar 2006 23:39:38 -0700
Message-ID: <200603062339.38609.mdiehl@diehlnet.com>
Reply-To: mdiehl@diehlnet.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28220-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all.

I've got a 860Gb Reiserfs on top of an EVMS drive link.  The drive link is 
made from /dev/hdb1, /dev/hdc1 and /dev/hda4.

Recently, /dev/hdc started to get bad sectors and before I could order a new 
drive, I got this message and I'm now longer able to mount the filesystem:

===============================================
ReiserFS: dm-7: warning: sh-2029: reiserfs read_bitmaps: bitmap block 
(#108101632) reading failed

ReiserFS: dm-7: warning: jmacd-8: reiserfs_fill_super: unable to read bitmap
===============================================

Is this a recoverable condition?  Or should I just reformat?

TIA

-- 
Mike
gpg key: http://diehlnet.com/~mdiehl/mdiehl.asc
83AD D927 758D 4BFC A800 0277 4B26 75A4 F0D1 C7EB

