From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:35:37 -0700
Message-ID: <412E73C9.6020104@namesys.com>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>	<200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>	<20040826193617.GA21248@arlut.utexas.edu>	<20040826201639.GA5733@mail.shareable.org>	<1093551956.13881.34.camel@leto.cs.pocnet.net>	<16686.23053.559951.815883@thebsh.namesys.com>	<1093556917.13881.78.camel@leto.cs.pocnet.net> <16686.25191.635556.817958@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16686.25191.635556.817958@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Christophe Saout <christophe@saout.de>, Jamie Lokier <jamie@shareable.org>, Jonathan Abbey <jonabbey@arlut.utexas.edu>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Nikita Danilov wrote:

>Christophe Saout writes:
> > Am Freitag, den 27.08.2004, 01:45 +0400 schrieb Nikita Danilov:
> > 
> > >  > At least in reiser4 they don't have, or at least you can't access them.
> > > 
> > > They do.
> > > 
> > >  > ln -s foo bar; cd bar/metas shows me the content of foo/metas.
> > > 
> > > That's because lookup for "bar" performs symlink resolution.
> > 
> > So I can't access them and it is pointless. ;-)
> > 
> > BTW, I can do a cd metas/metas/metas/metas/plugin/metas... I don't think
> > this makes sense. :)
>
>Why? foo/metas is a file system object just like foo. It has owner,
>permission bits, so access to its meta-data should be provided, and
>uniform way to provide access to the file system object meta-data is to
>have these little magic files inside metas directory, which is a file
>system object just like metas. It has owner^@^@^@^@*** - Lisp stack
>overflow. RESET
>
>Nikita.
>
> > 
>-
>To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>Please read the FAQ at  http://www.tux.org/lkml/
>
>
>  
>
I think Christophe is a bit right here.  While in general having 
meta-meta objects makes sense, in this particular instance, I don't see 
the functional need for it.  Can you supply an example of where it would 
be useful?
