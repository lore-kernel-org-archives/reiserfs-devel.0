From: Jake Maciejewski <maciejej@msoe.edu>
Subject: stale dk warning
Date: Fri, 20 Jan 2006 14:28:39 -0600
Message-ID: <1137788919.22212.7.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

In addition to the disable write barrier warning reported by Louis-David
Mitterrand on January 10th, with 2.6.15-1 I'm getting:
        
        <4>reiser4[dd(25448)]: update_stale_dk (fs/reiser4/search.c:1363)[nikita-38210]:
        WARNING: stale dk
        
The process varies. I've also seen the stale dk warning triggered by rsync and rm.

-- 
Jake Maciejewski <maciejej@msoe.edu>

