From: Oleg Drokin <green@namesys.com>
Subject: Re: Permission denied on access to files; even as root
Date: Sun, 16 Jun 2002 22:20:11 +0400
Message-ID: <20020616222011.A15910@namesys.com>
References: <1024353028.26879.10577.camel@xserver> <3D0CC8F8.9090206@namesys.com> <1024354235.21004.10629.camel@xserver>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1024354235.21004.10629.camel@xserver>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Worley <chrisw@lnxi.com>
Cc: reiserfs-list@namesys.com

Hello!


On Mon, Jun 17, 2002 at 04:50:33PM -0600, Chris Worley wrote:

> I'm Running Linux 2.4.10-4GB on SuSE 7.3 with reiserfsprogs-3.x.0j-1

Consider upgrading your server otherwise problem will repeat itself.
SuSE update kernel 2.4.16 would be fine for you.

> The problem is progressive.  I.e. "/bin/hostname" can't be executed
> today, and it was fine after trying the "conv".

Yes, newly created files occupy OIDs of already existing ones.

Upgrade kernel and fsck, then run reiserfsck and it will fix the problems.
3.x.1b version of reiserfsprogs would be fine for you.

Bye,
    Oleg
