From: Philipp =?koi8-r?q?G=3Fhring?= <p.guehring@futureware.at>
Subject: Re: Performance question
Date: Sun, 5 May 2002 18:43:45 +0200
Message-ID: <200205051644.g45GijA03908@linux1.futureware.at>
References: <200205051420.g45EKKo02315@linux1.futureware.at> <20020505190739.A13452@namesys.com>
Reply-To: p.guehring@futureware.at
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10254-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020505190739.A13452@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello!

Thank you Oleg for your answers.

> *glob functions are implemented by various library functions, that do full
> readdir scans at least once, I believe.

I thought I heard about a syscall, that makes it possible to pass the glob to 
the filesystem, so that the filesystem can optimize globbings as it likes, 
and pass the result back to the application, but ok.

> > Or should I do 2 opendir-readdir loops, one to read over the first 39
> > results, that I do not need, and the second one to geht the results 40 to
> > 49?
>
> In fact I do not see why do you need to do 2 opendir-readdir loops.
> One loop should be enough.

Yeah. Sure. My mistake. One opendir, and 2 readdir loops. The first one skips 
over unneeded results and the second one serves the data.

> You just compare each filename returned against your query and and if it
> matched remember it in separate list. So at the end of readdir loop you
> have a list of all names in a directory that match your query. And you can
> apply any additional check in place just not to remember unnecesary files.
>
> > The problem here is that I have to readdir about 50000 files (40000 to
> > get through the unneeded results, and 10000 to get the 10 results i need)
> > But on the other hand, I do not have to remember 100 files, from which I
> > only need 10.
>
> I am completely missing the idea on where these numbers are from. Can you
> explain in more details.

I will try so.
I have a table with 100000 files. A complete search would result for example 
100 files, which are spread across the whole directory.
About every thousand files, there is one file, that matches the query.
Since the client does not want to get 100 files at once, at first I return 
only 10 results for the first page, and the user can navigate page-wise.

So I built up the scenario where the user now wants the see results 40-49 
from the query "001_*_1212_1", 
which I assume as normal behaviour for my application.

> Binary tree is only helps when you know filename, I believe. 

Ok.

> Readdir would require less iterations through 001/*, because number of
> entries will be only 100 as you described above.
> You get all these 100 entries and then loop 100 times trying to open
> 001/${next_name}/1212/1 and deciding whenever you need this file or not.
> (If it exists of course, or you might get -ENOENT and proceed to next
> directory).
> Also deleting directories would be an overkill.

So the question is, how big that overkill is.
Is there perhaps a benchmark that tested it already?

> I think this might be faster in many circumfstances.
> Also what you've descrived looks very like to what squid does. And squid
> people went to reiserfs-raw interface and are quite happy with it.

I think the difference to squid is that they only need one result, not a part 
of a search, with more than one result.
But I am thinking about using reiserfs-raw too ...
(At the moment flexibility has still more priority for me than raw 
performance)

Many greetings,
- -- 
~ Philipp G?hring              p.guehring@futureware.at
~ http://www.livingxml.net/       ICQ UIN: 6588261
~ <xsl:value-of select="file:/home/philipp/.sig"/>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE81WFGlqQ+F+0wB3oRAtYSAJsGgaHnsohasbrjnJEQWAhi4tatSwCfQXDB
dGlKoxKq0vcB0jHMOV6AEWQ=
=heIa
-----END PGP SIGNATURE-----
