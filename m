From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 und LZO compression
Date: Wed, 30 Aug 2006 05:45:53 -0500
Message-ID: <44F56C61.1000905@slaphack.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <20060828173721.GA11332@hello-penguin.com> <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net> <20060829045937.GA9181@localhost.hsdv.com> <op.te1sixuycigqcu@apollo13> <20060829143814.GA21868@hello-penguin.com> <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com> <44F4880C.3050507@slaphack.com> <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com> <44F4914A.1010005@slaphack.com> <44F4979E.9020101@namesys.com> <44F49D7F.3010403@slaphack.com> <0954BE4F-E3A4-4A59-B275-10C1D8DB5101@smartgames.ca> <44F4C2C9.3070101@slaphack.com> <op.te3aq1uwcigqcu@apollo13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.te3aq1uwcigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: PFC <lists@peufeu.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

PFC wrote:
> 
>> Maybe, but Reiser4 is supposed to be a general purpose filesystem
>> talking about its advantages/disadvantages wrt. gaming makes sense,
> 
>     I don't see a lot of gamers using Linux ;)

There have to be some.  Transgaming seems to still be making a 
successful business out of making games work out-of-the-box under Wine. 
  While I don't imagine there are as many who attempt gaming on Linux, 
I'd guess a significant portion of Linux users, if not the majority, are 
at least casual gamers.

Some will have given up on the PC as a gaming platform long a go, tired 
of its upgrade cycle, crashes, game patches, and install times.  These 
people will have a console for games, probably a PS2 so they can watch 
DVDs, and use their computer for real work, with as much free software 
as they can manage.

Others will compromise somewhat.  I compromise by running the binary 
nVidia drivers, keeping a Windows partition around sometimes, and 
enjoying many old games which have released their source recently, and 
now run under Linux -- as well as a few native Linux games, some Cedega 
games, and some under straight Wine.

Basically, I'll play it on Linux if it works well, otherwise I boot 
Windows.  I'm migrating away from that Windows dependency by making sure 
all my new game purchases work on Linux.

Others will use some or all of the above -- stick to old games, use 
exclusively stuff that works on Linux (one way or the other), or give up 
on Linux gaming entirely and use a Windows partition.

Anything Linux can do to become more game-friendly is one less reason 
for gamers to have to compromise.  Not all gamers are willing to do 
that.  I know at least two who ultimately decided that, with dual boot, 
they end up spending most of their time on Windows anyway.  These are 
the people who would use Linux if they didn't have a good reason to use 
something else, but right now, they do.  This is not the fault of the 
filesystem, but taking the attitude of "There aren't many Linux gamers 
anyway" -- that's a self-fulfilling prophecy, gamers WILL leave because 
of it.

>     Also, as you said, gamers (like many others) reinvent filesystems 
> and generally use the Big Zip File paradigm, which is not that stupid 
> for a read only FS (if you cache all file offsets, reading can be pretty 
> fast). However when you start storing ogg-compressed sound and JPEG 
> images inside a zip file, it starts to stink.

I don't like it as a read-only FS, either.  Take an MMO -- while most 
commercial ones load the entire game to disk from install DVDs, there 
are some smaller ones which only cache the data as you explore the 
world.  Also, even with the bigger ones, the world is always changing 
with patches, and I've seen patches take several hours to install -- not 
download, install -- on a 2.4 ghz amd64 with 2 gigs of RAM, on a striped 
RAID.  You can trust me when I say this was mostly disk-bound, which is 
retarded, because it took less than half an hour to install in the first 
place.

Even simple multiplayer games -- hell, even single-player games can get 
fairly massive updates relatively often.  Half-Life 2 is one example -- 
they've now added HDR to the engine.

In these cases, you still need as fast access as possible to the data 
(to cut down on load time), and it would be nice to save on space as 
well, but a zipfile starts to make less sense.  And yet, I still see 
people using _cabinet_ files.

Compression at the FS layer, plus efficient storing of small files, 
makes this much simpler.  While you can make the zipfile-fs transparent 
to a game, even your mapping tools, it's still not efficient, and it's 
not transparent to your modeling package, Photoshop-alike, audio 
software, or gcc.

But everything understands a filesystem.

>     It depends, you have to consider several distinct scenarios.
>     For instance, on a big Postgres database server, the rule is to have 
> as many spindles as you can.
>     - If you are doing a lot of full table scans (like data mining etc), 
> more spindles means reads can be parallelized ; of course this will mean 
> more data will have to be decompressed.

I don't see why more spindles means more data decompressed.  If 
anything, I'd imagine it would be less reads, total, if there's any kind 
of data locality.  But I'll leave this to the database experts, for now.

>     - If you are doing a lot of little transactions (web sites), it 
> means seeks can be distributed around the various disks. In this case 
> compression would be a big win because there is free CPU to use ; 

Dangerous assumption.  Three words:  Ruby on Rails.  There goes your 
free CPU.  Suddenly, compression makes no sense at all.

But then, Ruby makes no sense at all for any serious load, unless you 
really have that much money to spend, or until the Ruby.NET compiler is 
finished -- that should speed things up.

> besides, it would virtually double the RAM cache size.

No it wouldn't, not the way Reiser4 does it.  Currently, 
compression/decompression, as well as encryption/decryption, happens 
where the data hits the disk.  The idea is, at that point, your storage 
medium is likely a bottleneck, and storing the compressed data in RAM is 
going to slow you down a lot, unless you're short on RAM.  It would be 
nice to make this tunable (even be able to choose a % of cache to leave 
compressed and a % to decompress), for machines which have spare CPU, 
but not as much spare RAM.

I don't know if the architecture can be changed that easily, though. 
The place the cryptocompress plugin operates makes perfect sense for 
crypto, because it's 1:1 as far as space goes -- all that caching the 
encryption version does is make you waste cycles decrypting it every 
time.  But keeping data compressed in RAM, while not generally a great 
idea, was once a valid technique on memory-starved machines -- I 
remember seeing some Mac software that claimed to double your RAM by 
compressing it.

But then, this made sense on a Mac no matter how much performance it 
cost you, because this predated virtual memory on a Mac.  When you ran 
out of physical RAM, you got an "out of memory" dialog, and your program 
crashed.  Some programs couldn't be run at all without a memory upgrade 
-- or this program.

>     However my compression benchmarks mean nothing because I'm 
> compressing whole files whereas reiser4 will be compressing little 
> blocks of files. We must therefore evaluate the performance of 
> compressors on little blocks, which is very different from 300 megabytes 
> files.
>     For instance, the setup time of the compressor will be important 
> (wether some huffman table needs to be constructed etc), and the 
> compression ratios will be worse.

Hmm.  To what extent are modern compressors based on a "dictionary" 
concept?  I believe that's why we compress tarballs, instead of the 
files inside, and why zipfiles are generally worse than compressed 
tarballs for space.

If the dictionary could be shared, that would negate the setup time of 
the compressor and much of the loss of efficiency when compressing small 
blocks instead of huge files.  The obvious disadvantage is potentially 
having to hit both the dictionary and the file.
