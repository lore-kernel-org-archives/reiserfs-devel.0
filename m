From: Eugene Teo <eugene.teo@eugeneteo.net>
Subject: Re: umount bug?
Date: Fri, 25 Mar 2005 08:43:46 +0800
Message-ID: <20050325004346.GC2310@eugeneteo.net>
References: <4241B21B.9070404@cpc.wmin.ac.uk> <424270E5.5050800@namesys.com> <20050324173021.731a10db.lists@mjh.name>
Reply-To: Eugene Teo <eugene.teo@eugeneteo.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050324173021.731a10db.lists@mjh.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milan Holz?pfel <lists@mjh.name>
Cc: reiserfs-list@namesys.com

<quote sender="Milan Holz?pfel">
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On Thu, 24 Mar 2005 10:48:53 +0300
> "E.Gryaznova" <grev@namesys.com> wrote:
> 
> > [...]
> > 
> > > I am using the latest kernel 2.6.11 with the patch available from 
> > > ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-1.gz
> > 
> > reiser4-for-2.6.11-1.gz is bugged. It is known. Wait please the next 
> > reiser4 release for 2.6.11.
> 
> I got Oopses on umounts (both on x86 and x86-64) when I used 2.6.10-2
> applied to 2.6.11, having fixed the failed hunks + readahead changes
> like they were in mm.  Reiser4 from 2.6.11-mm4 on vanilla 2.6.11 (again
> with some manual fixes) worked fine however, as does 2.6.11-1.  (These
> two used on x86-64 only.)  Therefore I'm wondering:  Are there also
> other known bugs [which might cause data corruption?] in 2.6.11-1, or is
> it only that the umount bug isn't happening to me anymore?
> (All my kernels were either gentoo-hardened-sources, or patched with
> GRSecurity, if that is of interest.)

Strange thing. I got Oopses on umount on x86 too. I thought it could
be my modifications to the fs, but it doesn't seem so. I will try to
reproduce, and mail the Oops error messages when I get it again.

using 2.6.11.5 + -mm4.

PS: I could have missed the original thread, but I am looking for a
clean reiser4 patch that gives me r4 only, instead of the entire -mm4.

Eugene

> 
> > Thanks,
> > Lena
> 
> Regards, 
> Milan
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.1 (GNU/Linux)
> 
> iD8DBQFCQusd2wyvT2WDeWYRAvlzAJ9gU3m2ova44bvJ11QYYeJgE6ZyQgCgg5Dk
> Air2vlsKfYfZ1ZxntwfVi28=
> =xIHS
> -----END PGP SIGNATURE-----
> 
> 
> 

-- 
1024D/A6D12F80 print D51D 2633 8DAC 04DB 7265  9BB8 5883 6DAA A6D1 2F80
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

