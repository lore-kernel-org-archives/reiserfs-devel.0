From: Guilherme Covolo <smyows@youare.not.br>
Subject: Re: reiser4 experimental patch
Date: Fri, 10 Nov 2006 14:10:40 -0200
Message-ID: <200611101410.40248.smyows@youare.not.br>
References: <200611091723.20881.smyows@youare.not.br> <200611101059.30441.smyows@youare.not.br> <200611101442.kAAEghne006274@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200611101442.kAAEghne006274@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

i change my patch, now is equals of the  
Johannes Hirte's patch .. only difference is my patch have the comment /* 
change */ in the source. 

run on x86_64 fine! :)

my patch and the Johannes Hirte's patch is linked in my site, 
www.youare.not.br 

thanks to all!

Em Sexta 10 Novembro 2006 12:42, Valdis.Kletnieks@vt.edu escreveu:
> On Fri, 10 Nov 2006 10:59:30 -0200, Guilherme Covolo said:
> > the diference between my an  Johannes Hirte's patch is:
> > *********************************************************
> >
> > /fs/reiser4/super_ops.c
> >
> > 290c290
> > < static int reiser4_statfs(struct dentry *dentry, struct kstatfs
> > *statfs) ---
> >
> > > static int reiser4_statfs(struct super_block *super, struct kstatfs
> > > *statfs
>
> diff -c or diff -u please.  That way, if some unrelated thing moves the
> lines up or down 1 or 2, it still applies.  Also, it's easier to look at a
> 'diff -u' and understand what's going on, because you get to see 3-4 lines
> either side of the changed lines.
>
> > i change my super_ops.c but why you alter te int to ssize_t on item.h?
>
> ssize_t isn't an int on some architectures, it's a 'long'.  As a result if
> you reference a 32 bit value where you should use 64, you'll certainly
> end up with something unexpected (probably an oops).
