From: Pierre Abbat <phma@webjockey.net>
Subject: Re: help recover filesystem corrupted by failing ide controller
Date: Sat, 15 Mar 2003 19:17:12 -0500
Message-ID: <200303151917.12807.phma@webjockey.net>
References: <200303141942.00679.phma@webjockey.net> <3E728FFB.90905@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E728FFB.90905@mb.tu-ilmenau.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

On Friday 14 March 2003 21:29, Manuel Krause wrote:
> Try the latest -pre-release
> ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.5-pre2.tar.gz
>
> that is said to have some bug fixes against the latest reiserfsprogs
> release
> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.4.tar.gz
>
> and a plus of performance and this release link is only given in case
> you believe in release numbering itself.

I just compiled the prerelease and will try it first on /var, which is equally 
corrupted (the computer was getting a lot of mail and I use Maildir). The 
glibc versions differ, so I'd like to build it statically. How do I do this?

