From: Oleg Drokin <green@namesys.com>
Subject: Re: File corruption with 2.4.20pre6
Date: Wed, 11 Sep 2002 17:46:41 +0400
Message-ID: <20020911174641.A10234@namesys.com>
References: <200209111041.g8BAfP230329@chekov.ricardo.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11416-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200209111041.g8BAfP230329@chekov.ricardo.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joachim Bremer <joachim.bremer@ricardo.de>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Sep 11, 2002 at 12:41:25PM +0200, Joachim Bremer wrote:

> I've got an easy to produce file corruption with
> linux-2.4.20pre6 and then tested with the file-write
> patch on pre4. I verified the problem on 2 different machines -
> 1. Uniprozessor with an Athlon XP1600+
> 2. Dualprozessor with 2 Athlon MP2000+

Thanks a lot for your report!

This is my stupid bug and I am starting to wonder how did it passed through
my tests...

This trivial patch below should take care of it. Can you try it? 
Thank you.


===== fs/reiserfs/file.c 1.10 vs edited =====
--- 1.10/fs/reiserfs/file.c	Tue Sep 10 16:06:23 2002
+++ edited/fs/reiserfs/file.c	Wed Sep 11 17:43:48 2002
@@ -1189,7 +1189,7 @@
 
 	already_written += write_bytes;
 	buf += write_bytes;
-	pos = *ppos += write_bytes;
+	*ppos = pos += write_bytes;
 	count -= write_bytes;
     }
 

Bye,
    Oleg
