From: Filipe Almeida <filipe@rnl.ist.utl.pt>
Subject: reiser4 and swsusp (take 2)
Date: Thu, 25 Mar 2004 22:44:37 +0000
Message-ID: <200403252244.39083.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I believe I have found the issue with software suspend and the repacker.
The refrigerator() call inside prepare_repacking_session() is called regularly 
and should work as expected. The problem is that the software suspend system, 
before signaling all kernel threads, calls sys_sync() to flush the buffers 
out to disk. If sys_sync() is called while the repacker is running, it will 
only return at the end of the repacker run. So, if you start the repacker and 
call software suspend, the system will only suspend at the end of repacking, 
which could be a really long time.

Hope it helps...

Regards,
Filipe Almeida

--
Filipe Almeida <filipe@rnl.ist.utl.pt>
http://mega.ist.utl.pt/~filipe/
