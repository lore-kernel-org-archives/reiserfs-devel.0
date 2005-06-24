From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 14:42:54 -0400
Message-ID: <874qbnh9zl.fsf@evinrude.uhoreg.ca>
References: <ninja@slaphack.com> <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24558-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org

On Thu, 23 Jun 2005 22:41:01 -0400, Horst von Brand <vonbrand@inf.utfsm.cl> said:

> David Masover <ninja@slaphack.com> wrote:
>> I, for one, would like to use a pendrive and have certain files be
>> encrypted transparently, only for use on Linux, but others be ready
>> to transfer to a Windows box.

> And that would surely break Windows compatibility (because you have to
> keep the data on what to encrypt one the filesystem itself).

Easily solved, using the same method OS/2 added Extended Attribute
support to FAT.  Of course, things may break if you try to manipulate
the encrypted file under Windows (e.g. deleting those files would leave
some garbage blocks behind), but breakage should be minor and relatively
easy to fix.

> Besides, having pgp, or gpg, or crypt, or my own whacky encryption
> proggie do the job in /userland/, and not shoving into the kernel and
> so down the next user's throat, is in the end a largeish part of what
> Unix is all about for me.

Meh.  It's nice to have encrypting to be transparent.  Unless your
editor supports gpg/crypt/etc., you'll need to decrypt the file to a
temporary area, edit the file, and then re-encrypt.  Much easier to make
a mistake and lose data, or leave traces of the cleartext data.

Besides, the encryption would be optional, and hence not being shoved
down the user's throat.  If you don't like it, don't use it.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

