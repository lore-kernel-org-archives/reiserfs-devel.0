From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiserfs and nfs.
Date: Mon, 25 Nov 2002 18:48:18 +0300
Message-ID: <15842.17986.416305.106123@laputa.namesys.com>
References: <E18GKCG-0003cp-00@aqualene.uio.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12043-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <E18GKCG-0003cp-00@aqualene.uio.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Terje Malmedal <terje.malmedal@usit.uio.no>
Cc: linux-kernel@vger.kernel.org, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Terje Malmedal writes:
 > 
 > Hi, 
 > 
 > I'm nfs-exporting a reiserfs filesystem, the problem is that the
 > inode-number as seen from the client seems to change from time to
 > time. This confuses a number of programs, for instance Emacs believes
 > that the file changed under it when this happens.

This problem is not known. What version of reiserfs (3.5 or 3.6) and
kernel are you using? Is there any way to reproduce this problem?

 > 
 > Is this a known problem? Any known fix? I found a number of old
 > messages about problems with reiser and nfs, but not this
 > specifically.
 > 
 > -- 
 >  - Terje
 > malmedal@usit.uio.no

Nikita.

