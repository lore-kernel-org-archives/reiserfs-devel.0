From: Russell Coker <russell@coker.com.au>
Subject: Re: Huffman packing Permissions
Date: Mon, 17 Feb 2003 14:22:50 +0100
Message-ID: <200302171422.50712.russell@coker.com.au>
References: <200302171122.h1HBMj701370@linux1.futureware.at>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12785-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302171122.h1HBMj701370@linux1.futureware.at>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: p.guehring@futureware.at, reiserfs-list@namesys.com

On Mon, 17 Feb 2003 12:22, Philipp G=FChring wrote:
> But what about Huffman-packing all the File/Directory Permission?
> They are extremely redundant on normal installations:
>
> 0644
> 0600
> 0755
> 0777
> 0700
>
> are 99% of all files

The standard permissions take 12 bits.  Huffman encoding could allow saving=
=20
one byte per file.  However you have to manage the Huffman table, if you=20
change the default umask then over time the most common values will change =

and the Huffman table needs to be recalculated (which will be extremely=20
painful as the meta-data for large numbers of files needs to be changed).

If you have a large file system of 1,000,000 files you could potentially sa=
ve=20
1meg of disk space through this method.  Now consider that tails allow savi=
ng=20
maybe 2G of disk space for the same 1,000,000 files but some people turn th=
em=20
off to improve performance.

Much more disk space could be saved with much less of a performance hit for=
 IO=20
starved machines by using compression.  We already have gzip code in the=20
kernel which could be used for this purpose.

I think that for the mail servers I run the use of gzip compression inside =
the=20
file system would improve the performance!  The mail servers have heaps of =

CPU capacity that's idle (2 * 1.8GHz Hyper-threaded Xeon CPUs with less tha=
n=20
10% CPU time in use) and are blocked on disk access 24*7.  I think that=20
data=3Djournal and journalling the data after the FS code has compressed it=
=20
would work really well for a big mail server.

If we're going to save disk space used for Unix attributes then a viable=20
option could be to make the attributes a mount option.  Mail, news, and Squ=
id=20
spools all don't need any special permissions, they could have every file=20
mode 660 and every directory mode 770 with suitable UID and GID values.

If you remove the Unix permissions from the meta-data entirely you save at =

least 9 bytes per file.

--=20
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

