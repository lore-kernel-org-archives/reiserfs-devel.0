From: Edward Shushkin <edward@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Sat, 29 Mar 2003 19:46:39 +0300
Sender: edward
Message-ID: <3E85CDEF.7B6BD323@namesys.com>
References: <200303282026.23543.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13434-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com

Pierre Abbat wrote:
> 
> Each file has a four-byte key ID in its inode and is encrypted with a longer
> key. (One way to make these keys is to hash a passphrase with SHA1 and use
> four bytes for the key ID and the rest for the key.) Each process may hold
> any number of credentials consisting of the key ID and the key. When a
> process attempts to open an encrypted file, the kernel checks whether it or
> any of its ancestors has a credential that matches the file's key ID.

Never trust 4-byte ID. The first collision that provides any assigned 4 bytes 
in SHA1 output can be found very easy..

Edward.

> 
> A utility called reiserkey is used to set and unset these keys. It can set or
> unset the key in itself or any of its ancestors running under the same uid,
> or if it's running as root, in any of its ancestors. reiserkey -a n sets the
> key in the nth ancestor; reiserkey -p n sets the key in process n. The
> default is -a 1; if reiserkey is run from a shell script, this sets the key
> in the shell script. To set it system-wide, use -p 1.
> 
> phma
> --
> .i toljundi do .ibabo mi'afra tu'a do
> .ibabo damba do .ibabo do jinga
> .icu'u la ma'atman.
