From: Oleg Drokin <green@namesys.com>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 18:53:41 +0400
Message-ID: <20030428145341.GA11502@namesys.com>
References: <3EAD34D5.8030108@solidcode.net> <20030428143231.GA11226@namesys.com> <200304281442.h3SEgVdA003758@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13868-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200304281442.h3SEgVdA003758@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Erik Terpstra <erik@solidcode.net>, reiserfs-list@namesys.com

Hello!

On Mon, Apr 28, 2003 at 10:42:30AM -0400, Valdis.Kletnieks@vt.edu wrote:
> > How about such a generic solution:
> > you create /incoming/.temp (or /incoming.tmp), all the files are being writte
> n
> > there. When write is complete, you just do rename(2) from tempdir to /incomin
> g
> Oleg:  A very good solution, except there are chucklehead admins at the
> remote site that refuse to make changes to their end, and this solution
> would require a change at the remote end to do a FTP rename.. ;)

Huh? No changes at remote end is needed.
FTP rename command is sent from our end (to remote server) after transfer is done.
As I understand, the sending side is under "our" control?
Well, if this assumption is wrong, then there are less reliable things to look at
(keeping in mind broken connections).
Samba and most ftp clients (though not sure about if the ftp clients do this on put)
change file's mtime to that of original file.
just compare ctime and mtime. If ctime is greater than mtime, then the transfer is finished ;)

Or just change FTP server to internally store files in /incoming/.tmp and move them to /incoming
once upload is finished. (will need some tricks to wrt upload continues after connection is broken)

Bye,
    Oleg
