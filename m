From: =?utf-8?Q?Maciej_So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Subject: Re: reiser4 can now bear with filled fs, looks stable to me...
Date: Tue, 1 Aug 2006 13:28:18 +0200
Message-ID: <1256888283.20060801132818@wp.pl>
References: <20060730223755.GA14386@hermes.uziel.local> <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl> <44CE7A3A.2010503@slaphack.com>
Reply-To: =?utf-8?Q?Maciej_So=C5=82tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44CE7A3A.2010503@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-list@namesys.com

Hello David,

Monday, July 31, 2006, 11:46:34 PM, you wrote:
> You must be new here...
;-)

I wanted to point out that because:
> Options B and C are all that ever seems to happen when reiserfs-list and
> lkml collide.

and:
>   The speed of a nonworking program is irrelevant.
>   The cost-effectiveness of an impossible solution is irrelevant.

maybe the more important thing is to allow people use r4 on their own
(rpms, debs, apt/gentoo/repositories, etc.) better, than to push that hard for kernel inclusion.

Currently the r4 patch is very easy to apply, you can apply it on top
of heavily patched kernels with no or little fuzz, which is very good.

But, as Hans wrote earlier, not every user knows how to patch, but
in ubuntu for example it is fairly easy (and encouraged by the official
forums/wikis) for those users to add additional repositories using synaptic
or adept or editing /etc/apt/sources.list.

I mean, there were huge objections against FUSE too, remember? But Miklos
built a steady and growing userbase.

Maybe that is something to realize, Hans, we don't need kernel inclusion to
have a growing userbase. (or atleast a steady one)

A side note: the only time we had not reiserfs-list and lkml collide (that much)
was when Andrew Morton was commenting and when Cristoph made a list of
"things to phix" - that cost people some nerve but it nevertheles was
more productive than the usual flamewars.

-- 
Best regards,
Maciej


