From: Todd Lyons <todd@mrball.net>
Subject: Re: non volatile ram devices
Date: Thu, 5 Dec 2002 08:21:28 -0800
Message-ID: <20021205162128.GC4334@mrball.net>
References: <200212042059.35300.russell@coker.com.au> <20021205093215.B20015@namesys.com> <200212050936.26846.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200212050936.26846.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: ReiserFS <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Russell Coker wanted us to know:

>It just generally isn't fast enough.  The servers in question have 4 * 72G 
>U160 SCSI disks in RAID-5 arrays on MegaRAID controllers.  They are designed 
>to handle 300,000 accounts for POP and IMAP.
>At times of high load there's 20 reads per second and 160 writes per second.

Let me ask some really stupid questions.
What kind of logging are your pop, imap, and mail services doing?  If
logging to syslog, redirect the mail logging facility to tty12 instead
of a file on the harddrive.  If syslog is logging to a network log
server, then there's not much you can do.  If logging to /dev/null, this
is a non-issue.  Is the Maildir spool on its own partition? (I can't see
how it's not since it's you, Russell).  Is /var/log on its own
partition.

What I'm getting at with all of this is that syslog can create
significant load on a machine if the machine is really busy.

Russell, if you've already tried all this, happily ignore this message
and let us know what you find.
- -- 
Blue skies...		Todd
| Get a bigger hammer!   |  Sometimes you get what you want.      |
| http://www.mrball.net  |  Sometimes you get experience.         |
| http://faq.mrball.net  |                     --unknown origin   |
   Linux kernel 2.4.19-16mdk   1 user,  load average: 0.00, 0.00, 0.00
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9730IIBT1264ScBURAr7lAJ4+19Qrj/aeWSgrOGLHKRvw7jRVqgCg5gZb
+za9M955ADOxSXxlVcOOV6Y=
=e0ai
-----END PGP SIGNATURE-----
