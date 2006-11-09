From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Thu, 9 Nov 2006 19:19:54 +0100
Message-ID: <194f62550611091019j181933dfn50f6c047096007fa@mail.gmail.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>
	 <454A596F.8070909@namesys.com>
	 <194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>
	 <200611081015.14320.biscani@pd.astro.it>
	 <20061108102136.GS6012@schatzie.adilger.int>
	 <194f62550611080633j304b32dah8da7fb1da7146bc1@mail.gmail.com>
	 <455297E9.1070000@netvigator.com>
	 <194f62550611090457j1ec02b2bt670ed539358a9c5c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550611090457j1ec02b2bt670ed539358a9c5c@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

sorry, my last message was not really clear:

I didn't change the kernel, I just disable the preload-scripts
executed by fedora.
I first tried to inlucde the whole KDE stuff but found it to be even
slower so I disabled them completly and now everything works fine :-)

I guess this could be maybe because of the reduced space available for
caching in RAM, because compressed and uncompressed data is cached.

lg Clemens

2006/11/9, Clemens Eisserer <linuxhippy@gmail.com>:
> Hi again,
>
> Don't know what its worth:
> I disabled readahead completly and now KDE starts almost as fast as on EXT3.
>
> lg Clemens
>
