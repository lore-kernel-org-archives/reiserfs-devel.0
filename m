From: Hans Reiser <reiser@namesys.com>
Subject: Re: iozone reality check: was zam, please discuss this
Date: Wed, 23 Jun 2004 22:13:04 -0700
Message-ID: <40DA62E0.2050803@namesys.com>
References: <40D8EB0D.6050109@namesys.com> <20040623063049.GA5080@backtop.namesys.com> <40DA58BC.1060203@namesys.com> <40D9C5F5.7010605@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40D9C5F5.7010605@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
> Caveat: I have not looked at the iozone test so this is purely in 
> response
> to Han's description.
>
> The examples I know of are apps that allocate an mmap'd area for garbage
> collection: ocaml, sml-nj, and I believe ghc (Haskell) do this.  While 
> these
> systems usually have generational GCs at some point major collections
> happen and then I *believe* that you will see lots of dirty pages.
>
> Note: the 'believe' is based on some experiments on an SGI ccNuma
> system with profiling tools---I was looking at local access issues and
> noticed the pattern of changes to flag objects as "marked" in a 
> mark/sweep
> collector.  I then tried ocaml as an experiment and saw something
> similar.
>
>
> I have not look at Boehm conservative collector in some time, but if
> memory serves me correctly it uses separate arrays to hold the bits;
> using mmap is an option---I don't know if it is in common use.
>
> Some 18-20 months ago I spent some time looking at the Java GC
> but I don't remember its using mmap() and I no longer have the source
> available.
>
> George Besher

When you say lots, do you mean close to or more than physical ram?
