From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Thu, 10 Oct 2002 13:25:09 +0200
Message-ID: <20021010112509.GA10277@merlin.emma.line.org>
References: <20021009121811.A22948@namesys.com> <20021009094215.B11954@namesys.com> <Pine.LNX.4.44.0210091041350.880-100000@fii.fi.tartu.ee> <20021009121811.A22948@namesys.com> <5.1.1.6.2.20021010125534.01dd2cc8@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11641-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.1.1.6.2.20021010125534.01dd2cc8@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, 10 Oct 2002, Newsmail wrote:

> What are those write barrier patches? and where can I find them? I was also 

I don't know. Some vendor kernels have them (SuSE), but I'm not sure
where they are available ATM.

> hurted by several 'cross linked' files, described in here. is there a way 
> to deactivate write caching for just one filesystem?

No. You can only disable it per drive.

> ps: please somebody let me know where I can find documentation about those 
> chris mason patches, or at least what is dara=ordered or data=journal 
> options. everybody talks about it, nobody explains. or did I miss something?

You can safely consult ext3 documentation on these options, reiserfs
should behave the same in respect to these options.

-- 
Matthias Andree
