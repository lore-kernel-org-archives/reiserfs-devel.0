From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Another panic!
Date: Tue, 23 Nov 2004 18:00:52 +0200
Message-ID: <20041123160052.GE26192@nysv.org>
References: <20041121163755.GV26192@nysv.org> <20041121172031.GW26192@nysv.org> <41A1FDAD.9040903@namesys.com> <20041122160122.GZ26192@nysv.org> <41A21DF9.7060907@namesys.com> <41A21EE4.9090602@namesys.com> <20041122165902.GA26192@nysv.org> <20041122185228.GB26192@nysv.org> <1101210439.2151.52.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1101210439.2151.52.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com, Cal <hihone@bigpond.net.au>

On Tue, Nov 23, 2004 at 02:47:19PM +0300, Vladimir Saveliev wrote:
>
>The attached should fix a problem #01.

Thank you!

It did, well, at least I tried it once and it did :)

I'm recompiling now without as much debug in it.

I also checked with patch --dry-run that it would apply on
-rc2-mm2, is it possible that it fixes those issues as well?

I assume it'll be in -rc2-mm4?

Thanks again!

-- 
mjt

