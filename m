From: Hans Reiser <reiser@namesys.com>
Subject: Re: Linux Gazette benchmark Reiser 4
Date: Mon, 09 Jan 2006 10:22:16 -0800
Message-ID: <43C2A9D8.80103@namesys.com>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com> <13dbb67f0601070441q559b156ep@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <13dbb67f0601070441q559b156ep@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrea Gelmini <dislessico@gmail.com>, ReiserFS List <reiserfs-list@namesys.com>

Andrea Gelmini wrote:

>
>
> 2006/1/6, Robert Hulme <rob@robhulme.com <mailto:rob@robhulme.com>>:
>
>     http://linuxgazette.net/122/TWDT.html#piszcz
>
>     It seems to come off fairly badly in most of the tests.
>
>
> I really did not understand  this kind of benchmark. I don't care
> which filesystem is faster creating 10.000 files (something I never
> have to do). I care about which filesystem fits better with my
> everyday use of my data.
> Days ago I wrote a few script trying to simulate a tipical desktop
> session, *my* tipical desktop session. With different filesystem I've
> got difference of minutes. That's a benchmark that mean something to me.
> Why I'm trying/looking at reiser4?
> Because:
> a) seeks are the real problem of hd (they kill performance);
> b) journal in a fixed position creates a lot of seeks;
> c) I love ext2, but my laptop crash a lot of time in a day (tests,
> battery and so on).
>
> Testing reiser4 is giving to me a good feeling with wondering logs.
> You know... less seek, less HD stress... so more responsiveness.
> Well, it's too early to express an opinion about R4 (I'm using it
> since last week), but the only way to test a FS is to use it for a
> long time.
>
> Sorry for my bad english,
> gelma
>
reiser4 is normally very fast in creating 10,000 files.  I suspect that
there was simply error in how he did the test, and when the guys get
back i will have someone try to reproduce his results.

Justin made so many errors, I  suspect he got something wrong here also.

I encourage you guys to run your own tests, and you will see that we do
fairly well I think.  Advice when benchmarking is:

make sure your fileset is much larger than RAM

make sure the benchmark takes a while to run

create your tarballs on the same fs you use them to benchmark (readdir
order matters)

Assume a 3% noise level.
