From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: implementing reiserfs in C++ for a new OS
Date: Wed, 11 Aug 2004 22:40:55 +0200
Message-ID: <411A8457.2030801@futuretg.com>
References: <71d3364904080706112e72fb6b@mail.gmail.com>	<20040809172437.GP1284@nysv.org>	<71d3364904080922267e8c14af@mail.gmail.com>	<200408101312.48888.reiserfs-list@quinnh.org>	<4119273E.1040104@namesys.com>	<20040810211951.GU1284@nysv.org>	<41194690.5050908@namesys.com>	<1365645117.20040811065416@tnonline.net>	<4119B7D1.7000705@namesys.com>	<16665.61639.659924.562747@laputa.namesys.com>	<411A4CA1.9090604@namesys.com>	<16666.20331.980571.419171@gargle.gargle.HOWL>	<411A5933.90408@namesys.com> <16666.23297.324669.957050@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16666.23297.324669.957050@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Clusterfs.COM>
Cc: Hans Reiser <reiser@namesys.com>, Spam <spam@tnonline.net>, reiserfs-list@namesys.com

Nikita Danilov wrote:

>Hans Reiser writes:
> > Nikita Danilov wrote:
> > 
> > >Hans Reiser writes:
> > > > Nikita Danilov wrote:
> > > > 
> > > > >
> > > > >Copyright to result of translation belongs to the translator. At
> > > > >least, according to Russian law.
> > > > >
> > > > >  
> > > > >
> > > > I may be completely wrong legally, esp. in Russia.  I personally think 
> > > > it should belong to the original author if the original copyright is 
> > > > still valid.
> > > > 
> > > > Otherwise harry potter can get translated and no need to pay rowling.
> > >
> > >`Otherwise' is non-sequitur. One pays royalties to get a permission to
> > >produce and/or sell derived work. But copyright to derived work lies
> > >with translator.
> > > 
> > >Otherwise, copyright to reiser4 (re-)implementation of allocate-on-flush
> > >belongs to SGI.
> > >  
> > >
> > I would feel more guilty about that if their team had not gone so far 
> > out of their way to encourage me to learn and use their most valuable 
> > innovation when I visited SGI.  I try to credit SGI on that generally, 
> > but folks are welcome to point out where an additional credit is needed 
> > (it is too easy to neglect such things).  I do think that I took their 
> > idea to the next level....
>
>That's orthogonal to the topic of this discussion. The question is:
>did you ask SGI's permission to re-implement allocate on flush idea?
>If no, why re-implementors of reiserfs in C++ should seek yours? I
>guess, that they are pretty sure that they will took your ideas to the
>next level... :-)
>
>  
>
I don't think that a simply re-implementation of the Reiser code in C++,
will offer any benefit to anyone.

They are swim in a new sea (ReiserFS) and have no idea about what is.
C++ is not the language
generally used for command based utilities.

C++ is generally used to program with objects, for example the graphical
interface where buttons, menu
bar are objects, and also a library may be extrapoled to work with MacOS
X, MS Windows or GNU/Linux, using
the same code, like did Trolltech people.

The Linux kernel had been written in C, and therefore the reiserfs code
inside the kernel have no sense in another language.

Hans, instead invent the ReiserFS, and he is not a newbie in FileSystem
architecture.

Have no sense to request some code or any authorization to anyone
because but ReiserFS 3 and 4 are GPL, at the same level
than SGI XFS.

So, I suppose that Hans choose a particular routine inside XFS that is
used to solve a particular problem that probably the employees he hire
was not capable to solve.

Because the original works are available under GPL, this is just in the
sense and in the respect of the GPL license, Use the code, modify
and release.

Instead these guys, want to close the code, they will realize without to
understand really nothing about it.

This simply have no sense and their comment is a stupid comment.

They can do in C++ ... and? They can will rewrite the ReiserFS Utilities
in C++ and? Who will use? We? I don't thing.

The Capital comments are silly comments like a boy: "I will take the bus
to back home, and don't want to be disturbed".

For us, here nothing is changed. We are more happy to use ReiserFS 4.
What is important for us, is than will be 100% error free.

Otherwise I will contrib to solve the bugs following my expertise, also
taking some code from other GPL places. This is GNU/Linux!

Thanks,
Giovanni

> > 
> > > > 
> > > > Hans
> > >
>
>Nikita.
>
> > >
> > >
> > >  
> > >
> > 
> > 
>
>  
>


-- 

-- 

--
Check FT Websites ...
http://www.futuretg.com  - ftp://ftp.futuretg.com
http://www.FTLinuxCourse.com
	http://www.FTLinuxCourse.com/Certification
http://www.rpmparadaise.org
http://GNULinuxUtilities.com
http://www.YourPersonalOperatingSystem.com

--


