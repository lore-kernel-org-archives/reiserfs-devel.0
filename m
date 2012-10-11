From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Fwd: [PATCH] dont run ldconfig when installing with DESTDIR
Date: Thu, 11 Oct 2012 11:55:11 -0400
Message-ID: <5076EBDF.80901@suse.com>
References: <1234203624-19238-1-git-send-email-vapier@gentoo.org> <507595FA.10406@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <507595FA.10406@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/10/12 11:36 AM, Edward Shishkin wrote:
> 
> 
> 
> -------- Original Message -------- Subject: 	[PATCH] dont run
> ldconfig when installing with DESTDIR Date: 	Mon, 9 Feb 2009
> 13:20:24 -0500 From: 	Mike Frysinger <vapier@gentoo.org> To:
> reiserfs-devel@vger.kernel.org
> 
> 
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org> --- run-ldconfig
> |    5 +++++ 1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/run-ldconfig b/run-ldconfig index 227f126..e4b1b93
> 100755 --- a/run-ldconfig +++ b/run-ldconfig @@ -1,5 +1,10 @@ 
> #!/bin/bash
> 
> +if [ -n "$DESTDIR" ] ; then +	echo "Skipping ldconfig due to
> installing into temp root (DESTDIR)" +	exit 0 +fi + ldc=""; if [ -x
> /sbin/ldconfig ]; then ldc="/sbin/ldconfig"; -- 1.6.1.2

This one seems to be gentoo-specific, or at least against a file that
doesn't exist in the actual reiserfsprogs tarball.

- -Jeff


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQduvfAAoJEB57S2MheeWy0ZgP/2hj0hMROmK4sPMyy6IVhkFm
cQFG17qsT+liC+rBAnJ3KgwK1yy59yWv+ldKvDvD5oCcpzTW5yap4U2uIw31XA96
v3mcHPbCVRP3kFAVYN7/IOH+0rOUlm78aI9Nk9GwyblFFBg+8WOLHOwQPRgwNy4+
1FDKNb/xB4dd/j5OQ5jIlQlMSorau6jftMrYdklInYesLd9CmND1h9BqrzCPDHb3
H1zfQzDT6p4ZQZYMiVmbtkQhsEAMJuyAa3hY6isapIzCjDGNUHdqvXPYLWtNeaH5
NC59Zd2BCQJhfpHCw/DZ+w6nCojeCmFjQ6SHF/bYVtnITleZ/ED48HRwQzu6xHKY
vmzoMH6Yl6IRuqkbIAjapXR6D3lAS1a92uPNwBCTGcVElRwkRdYpnbyWN99xAZkF
gOenVv1ZbPXbs9vHPiefoA3cvV3Dlo/OwuJTne5eJg9SrVB1amEtPQH0O1UbT8/8
zH4j/V/WtR2x0iCUQthKJrPIyalNCaLbjeDM0TEutmTT3fjW9l+LZnGIKQ980hyM
G1zUUmMt5/s+GP5o7t7kb+pZwBd76aut1ur67jEY6X1P/3WrlsmzMQpEbXwGe9k/
0PHAk7btEsg8TnOE6rSjAL+MEV1RPZkcAvID3gQx0WLd+FQLUkPKASVN1kQ4EN3O
cWOIqXEBn1bmBO7zcbmB
=wZO/
-----END PGP SIGNATURE-----
