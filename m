From: Oleg Drokin <green@namesys.com>
Subject: Re: Performance question
Date: Mon, 6 May 2002 17:01:03 +0400
Message-ID: <20020506170103.A954@namesys.com>
References: <200205051420.g45EKKo02315@linux1.futureware.at> <20020505190739.A13452@namesys.com> <200205051644.g45GijA03908@linux1.futureware.at>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200205051644.g45GijA03908@linux1.futureware.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp G?hring <p.guehring@futureware.at>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, May 05, 2002 at 06:43:45PM +0200, Philipp G?hring wrote:

> > *glob functions are implemented by various library functions, that do full
> > readdir scans at least once, I believe.
> I thought I heard about a syscall, that makes it possible to pass the glob to 
> the filesystem, so that the filesystem can optimize globbings as it likes, 
> and pass the result back to the application, but ok.

I do not think something like that exists in Linux. But if you
come up with man page from section 2...

> > > Or should I do 2 opendir-readdir loops, one to read over the first 39
> > > results, that I do not need, and the second one to geht the results 40 to
> > > 49?
> > In fact I do not see why do you need to do 2 opendir-readdir loops.
> > One loop should be enough.
> Yeah. Sure. My mistake. One opendir, and 2 readdir loops. The first one skips 
> over unneeded results and the second one serves the data.

No. Still I think you need only one loop anyway, like this:
<pseudocode>
DIR=opendir(name);
while((result=readdir(DIR)) != NULL) {
	if ( check_filename_criteria(result->filename) ) {
		add_to_list_of_files_to_process(result->filename);
	}
}
for i in list_of_files_to_process {
	process_file(i);
}

So only one loop, and the second one does not count because it is serves
actual data.

> > > The problem here is that I have to readdir about 50000 files (40000 to
> > > get through the unneeded results, and 10000 to get the 10 results i need)
> > > But on the other hand, I do not have to remember 100 files, from which I
> > > only need 10.
> > I am completely missing the idea on where these numbers are from. Can you
> > explain in more details.
> I will try so.
> I have a table with 100000 files. A complete search would result for example 
> 100 files, which are spread across the whole directory.
> About every thousand files, there is one file, that matches the query.
> Since the client does not want to get 100 files at once, at first I return 
> only 10 results for the first page, and the user can navigate page-wise.
> So I built up the scenario where the user now wants the see results 40-49 
> from the query "001_*_1212_1", 
> which I assume as normal behaviour for my application.

Ah, I see what you mean. If you have a lot of resources, you can setup a session
and store all the search results for that session at server side.
So when second request comes in, you just read search result from the session.
Also you kill the session for 5 minutes after 5 minutes of inactivity on it or
so. Hm... This requires for cookies to be enabled, though. ;)

> > Readdir would require less iterations through 001/*, because number of
> > entries will be only 100 as you described above.
> > You get all these 100 entries and then loop 100 times trying to open
> > 001/${next_name}/1212/1 and deciding whenever you need this file or not.
> > (If it exists of course, or you might get -ENOENT and proceed to next
> > directory).
> > Also deleting directories would be an overkill.
> So the question is, how big that overkill is.

I mean that you do not need to delete directories, when they are empty.
You only need to create the directory structure once.

> Is there perhaps a benchmark that tested it already?

No, I do not think so, but feel free to compose and run your own benchmark.

> > I think this might be faster in many circumfstances.
> > Also what you've descrived looks very like to what squid does. And squid
> > people went to reiserfs-raw interface and are quite happy with it.
> I think the difference to squid is that they only need one result, not a part 
> of a search, with more than one result.

Hm. This is true.

Bye,
    Oleg
