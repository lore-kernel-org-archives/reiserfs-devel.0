From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Wed, 8 Nov 2006 15:33:06 +0100
Message-ID: <194f62550611080633j304b32dah8da7fb1da7146bc1@mail.gmail.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>
	 <454A596F.8070909@namesys.com>
	 <194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>
	 <200611081015.14320.biscani@pd.astro.it>
	 <20061108102136.GS6012@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30117-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20061108102136.GS6012@schatzie.adilger.int>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi again,

> > I think the slow performance you're experiencing are caused by the fsync()
> > call not being well-optimized in reiser4. I've commented out the function in
> > fs/buffer.c, and I'm having much better performance on my / partition.
>
> I don't think this can be advocated as a real solution to performance
> problems.  This can mean data loss for some applications like email that
> expect "fsync return" to mean "this data is safely on disk".  May as well
> say "I improved the performance of my backups by writing to /dev/null".

To be honest I don't really know what fsync does (I guess it forces
something to be written or something like this) and if yes - why it
gets called that often.
However am I wrong or is fsync mostly calles by applications writing
data, whereas starting xorg+kde is mostly a read job?

Thank you for your patience, lg Clemens
