From: =?utf-8?Q?Maciej_So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with filled fs, looks stable to me...)
Date: Mon, 7 Aug 2006 20:52:16 +0200
Message-ID: <961493611.20060807205216@wp.pl>
References: <20060730223755.GA14386@hermes.uziel.local> <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com> <1256888283.20060801132818@wp.pl> <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl> <916440956.20060806162316@wp.pl> <20060807092435.GA11596@zeus.uziel.local> <44D773D6.4020504@slaphack.com>
Reply-To: =?utf-8?Q?Maciej_So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44D773D6.4020504@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello David,

Monday, August 7, 2006, 7:09:42 PM, you wrote:
> I mean, having Grub support everything would be nice, but if you're
> reformatting anyway, I don't think it's that imperative.
I have come up to that conclusion too. If someone would be getting
an r4-enabled kernel on an already installed system they would not
care much for grub support unless they have only one root partition.

I have built today an r4-patched ubuntu kernel package (yes, debs!)
using edgy eft's git-based build system, which allows me to build ubuntu
kernels! Yes, with all the stuff they have in there, with all the
configuration versions they support (-386, -k7, -server, etc...)

I booted one and I will try to create an r4 partition later today.

Please note, that this is done all under virtualization
(Microsoft Virtual PC).

-- 
Best regards,
Maciej


