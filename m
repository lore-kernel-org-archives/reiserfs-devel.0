From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: reiser4 metas and hard links...
Date: Sun, 29 Aug 2004 12:19:26 +0200
Message-ID: <20040829121926.69d34b59.reiser4@blinkenlights.ch>
References: <1093388441.10277.6.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21045-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093388441.10277.6.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

Nikita provided a small patch for this problem on #reiser4:

--- dir.c.org   2004-08-29 11:32:40.000000000 +0200
+++ dir.c       2004-08-29 12:03:40.000000000 +0200
@@ -126,6 +126,9 @@
        data.mode = object->i_mode;
        data.id = inode_file_plugin(object)->h.id;
 
+       if (!inode_file_plugin(object)->can_add_link(object))
+               return -EPERM;
+
        reserve = common_estimate_link(parent, existing->d_inode);
        if ((__s64)reserve < 0)
            return reserve;


ulrich@fuzzy:~$ uname -r
2.6.8.1-mm4
ulrich@fuzzy:~$ ln  foo/metas/bmap bla
ln: creating hard link `bla' to `foo/metas/bmap': Operation not
 permitted

(Symlinks are still working...)

bye
