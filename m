From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs/emacs incompatibility/bug ?
Date: Mon, 30 Sep 2002 17:51:30 +0400
Message-ID: <20020930175130.A3400@namesys.com>
References: <H3938O$1651F1A2E7EBD11F645B688E4B6E88D8@voila.fr>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11575-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <H3938O$1651F1A2E7EBD11F645B688E4B6E88D8@voila.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "arthur.chereau" <arthur.chereau@voila.fr>
Cc: reiserfs-list@namesys.com

Hello!
On Mon, Sep 30, 2002 at 02:12:24PM +0200, arthur.chereau wrote:

> > Can you please capture strace output from such a session where
> > inode numbers are not in right order and original permissions are lost
> > and send it to me?
> Here is a tar.gz containing the strace, the output and the minimal .emacs file.
> I use a 2.4.19 kernel with emacs 21.2.
> Emacs was compiled with
> --with-x --with-x-toolkit=motif --without-jpeg --without-tiff --without-gif
> --without-png --without-sound --without-xim --without-pop
> Tell me if  you need more details.

Yes, I do. In all the cases no permissions information were lost.
Can you please capture strace where you do have file with 755 permissions
and after editing you get a file with 644 permissions?

(And yes, I have explanation for why you have different inode numbers.
This is because new files are created meanwhile and since in reiserfs
inode number is object id, that are allocated sequentionally,that's
the sequence:
open("/home/arthur/test~", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0666) = 5
utime("/home/arthur/test~", [2002/09/30-13:58:20, 2002/09/30-13:58:17]) = 0
chmod("/home/arthur/test~", 0644)         = 0
rename("/home/arthur/test", "/home/arthur/trash/test[14]") = 0
open("/home/arthur/test", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0666) = 3

Now /home/arthur/test is created after /home/arthur/test~ and therefore it
get larger OID. 
)

BTW, note how umode/utime was restored for test~, but was not for test
(but may be that is because mode is the same as it should be).

Bye,
    Oleg
