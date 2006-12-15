From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Rescue cds for fsck'ing reiser4?
Date: Fri, 15 Dec 2006 23:03:59 +0100
Message-ID: <194f62550612151403h20e5de7x55bc2149f2a236b9@mail.gmail.com>
References: <194f62550612151028m1e006131w38d3f941e6e2e39e@mail.gmail.com>
	 <4582F0CB.6030703@namesys.com>
	 <194f62550612151221s648e80e8q570a7e1934adf3e1@mail.gmail.com>
	 <4583166D.60709@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30329-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4583166D.60709@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>, reiserfs-list@namesys.com

Hi again,

> Something was wrong with the system, or you just decided to check your fs?
Well I missed some files from time to time but did not further care.
And then suddenly X11 crashed when starting an OpenGL app (I changed
nothing), but reinstalling the driver helped. So I guess, yes, the
filesystem seemed to be a little inconsistent - therefor I decided to
run fsck.

However I never agreed that fsck should change oder alter anything, I
just wanted to know wether there are corruptions. Now I cannot even
mount it :-/

Is it a good idea to let fsck rebuild the fs?

Thank you in advance, lg Clemens

>
> > I
> > decided not to do anything further because I already lost data with
> > reiser3's fsck.reiser.
> >
> > When rebooting mount claims that it will only load reiser4 read-only
> > because it contains errors but it ends up that it can't be mounted at
> > all.
> >
> > Now I tried to re-run with exactly the options you gave me (I had a
> > disk with the same kernel / toolset laying arround) gut it bails out
> > with "1 fatal corruption was found". It says the storage tree does not
> > exist.
> >
> > Any options to get my data back without rebuilding the filesystem. How
> > likely is it to get my data back if I choose to rebuild it. I wrote
> > some quite tricky pieces of code lately ... would be sad to loose them
> > :-/
> >
> > Thank you in advance, lg Clemens
> >
> >
>
>
