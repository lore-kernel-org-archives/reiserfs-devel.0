From: Hans Reiser <reiser@namesys.com>
Subject: Re: Test suite?
Date: Fri, 23 Jan 2004 18:30:53 -0800
Message-ID: <4011D8DD.7050604@namesys.com>
References: <50D19C3AC815734C9E19FE4C4F6128A602A567ED@orsmsx403.jf.intel.com>	<200401212017.i0LKH9o13925@mail.osdl.org> <16399.52970.948058.252595@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16399.52970.948058.252595@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: markw@osdl.org, john.l.villalovos@intel.com, reiserfs-list@namesys.com

Nikita Danilov wrote:

>markw@osdl.org writes:
> > On 21 Jan, Villalovos, John L wrote:
> > > Is there a test suite for ReiserFS?
> > > 
> > > For regression testing and the like?
>
>We use various stress tests and benchmarks for this:
>
>bonnie   (http://www.textuality.com/bonnie/)
>bonnie++ (http://www.coker.com.au/bonnie++/)
>fsx      (http://www.zip.com.au/~akpm/linux/patches/stuff/fsx-linux.c)
>iozone   (http://www.iozone.org/)
>dbench   (http://freshmeat.net/projects/dbench/)
>mongo    (http://www.namesys.com/benchmarks/mongo_readme.html)
>cerberus (http://sourceforge.net/projects/va-ctcs/)
>fsstress (http://cvs.sourceforge.net/viewcvs.py/ltp/ltp/testcases/kernel/fs/fsstress/)
>
>And some scripts/programs that were created specifically on purpose. I
>put few of them (without any support or documentation) into
>ftp://ftp.namesys.com/pub/testtools
>
>Plus scripts to start a bunch of concurrent kernel compilations,
>bitkeeper pulls, tars, gzips, etc.
>
> > > 
> > > I am just wondering if there is something that I can run after making
> > > modifications that would help give me a warm-fuzzy feeling :)
> > > 
> > > John
> > > 
>
>Nikita.
>
>
>  
>
fsx is probably the most thorough single test

-- 
Hans


