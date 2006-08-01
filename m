From: =?iso-8859-2?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled fs, looks stable to me...)
Date: Tue, 1 Aug 2006 23:12:55 +0200
Message-ID: <1692247736.20060801231255@wp.pl>
References: <20060730223755.GA14386@hermes.uziel.local> <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com>  <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost>
Reply-To: =?iso-8859-2?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29424-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1154455834.10745.21.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello Sander,

Tuesday, August 1, 2006, 8:10:34 PM, you wrote:
> Yes, and in case of gentoo there are already people maintaining an
> ebuild which pull in r4 on the wiki.
> http://gentoo-wiki.com/HOWTO_Reiser4_With_Gentoo-Sources
Debian has reiser4progs and kernel-patch-2.6-reiser4:
- stable: 20040813-6
- testing: 20050715-1
- unstable: 20050715-1

Very old patches. Also the patch descriptions says:
"WARNING: this software is to be considered usable but its deployment in
production environments is still not recommended. Use at your own risk."

I know it is very easy to create ubuntu kernel packages (I have done a few)
I might try to do one for current dapper kernel for i386. But it would have
to wait due to time my personal constraints (projects, etc.)

-- 
Best regards,
Maciej


