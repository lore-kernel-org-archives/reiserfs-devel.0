From: Edward Shushkin <edward@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Wed, 02 Apr 2003 19:11:20 +0400
Sender: edward
Message-ID: <3E8AFD98.6EA33B68@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <76105761281.20030401181632@tnonline.net> <3E89BC94.5030308@namesys.com> <200304012156.56798.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: reiserfs-list@namesys.com

Pierre Abbat wrote:
> 
> On Tuesday 01 April 2003 11:21, Hans Reiser wrote:
> > I think it is essential to the task that apps not be aware of keys.
> 
> Indeed. The reiser4-specific syscall should insert or delete a key into the
> database; to open a file you use the generic open() syscall, which passes the
> filename to reiser4, 

No, generic sys_open() should return error for encryption file pathname.

> which then asks the plugin if it has the key, and fails
> if it doesn't. The only time you should need to use a reiser4-specific call
> to open a file is when you need to read or write the ciphertext, which Bob
> needs to do when he backs up to tape (or another disk) the data which Alice
> backed up to him. This also needs special read and write calls, as you need
> to know how long each block (stored as a tail) is, because it's compressed.

All this work do reiser4 specific part of vfs's read(), write(). 
We only need special sys_open(). Other methods remain the same.

> 
> I'd also like to see some other protocols using an encrypted filesystem,
> especially ones using public key, as I don't understand why you need public
> key encryption in a filesystem.

Why not?
Maybe Bob will want to create a file so that nobody but Alice can read it..

Edward.

> 
> phma
> --
> .i toljundi do .ibabo mi'afra tu'a do
> .ibabo damba do .ibabo do jinga
> .icu'u la ma'atman.
