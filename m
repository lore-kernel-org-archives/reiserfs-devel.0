From: Ookhoi <ookhoi@humilis.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:33:55 +0100
Message-ID: <20030228143354.M24291@humilis>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281513.49045.liviu.voicu@huji.ac.il> <20030228142630.K24291@humilis> <200302281533.02318.liviu.voicu@huji.ac.il>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281533.02318.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Voicu Liviu wrote (ao):
> > > This is my .config file of the kernel 2.4.20..,maybe you can find some
> > > wrong in here..........
> > >
> > > # CONFIG_MPENTIUMIII is not set
> > > # CONFIG_MPENTIUMIII31 is not set
> > > # CONFIG_MPENTIUM4 is not set
> > > CONFIG_MPENTIUM431=y
> >
> > What cpu is this? This is not in a 2.4.20 kernel. Are you sure this is
> > the right .config?
> > You should use CONFIG_MPENTIUM4 I think.
>
> i have applyed 13_gcc31-compile-optimizations patch
> (this gives me specific march for the cpu i want)
> 
> +ifdef CONFIG_MPENTIUM431
> +CFLAGS += -march=pentium4 -mmmx -msse -msse2 -falign-functions=4 
> - -fprefetch-loop-arrays -maccumulate-outgoing-args
> +endif
> 
> see?

Jup, ok.

> > > CONFIG_BLK_DEV_IDEDISK=y
> > > CONFIG_IDEDISK_MULTI_MODE=y
> >
> > Why this one?
> 
> well, not sure about these...these are my patches........
> 
> # ls
> 001_o1_pe_ll_021215_ck_2.4.20.patch.bz2  
> 005_supermount_021215_ck_2.4.20.patch.bz2  
> 010_tune_021217_ck_2.4.20.patch.bz2
> 002_aavm_021215_ck_2.4.20.patch.bz2      007_acpi_021215_ck_2.4.20.patch.bz2        
> 011_vt_021217_ck_2.4.20.patch.bz2
> 003_rl2_021215_ck.2.4.20.patch.bz2       008_vh_021217_ck_2.4.20.patch.bz2          

Ok, now please try again with the latest 2.4.21-preX
