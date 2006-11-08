From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Wed, 8 Nov 2006 08:21:49 +0100
Message-ID: <194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>
	 <4533D788.3000406@namesys.com>
	 <194f62550611010524t6d2b9e40n422e63de1e9a48b1@mail.gmail.com>
	 <45495858.6020507@namesys.com>
	 <194f62550611020109x7733dff0ic475414afbf783af@mail.gmail.com>
	 <454A2AB9.3060103@namesys.com>
	 <194f62550611021143n2fe17b33k6d28b23664e6983b@mail.gmail.com>
	 <454A596F.8070909@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30112-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <454A596F.8070909@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello again,

Thanks a lot for all the help, well ... I now use reiser4 as root-partition :-)

Everything works ok and I haven't seen any crashes or compatibility
problems, simply wonderful :-). If something bad happens I'll let you
know ;)

However performance is so-and-so, the system was faster with ext3,
although I compiled the kernel with "-O3 -march=pentium4
-mtune=pentium4 -mno-sse -mno-sse3". Booting the system into KDE takes
about twice the time, although I have to admit I was using another
harddrive - I now use a 60GB/4200RPM instead an 40GB/4200RPM which
both show quite the same hdparm-results,
I use the lzo1 plugin (default ccreg40).

Are there some settings (or ext3 optimizations) in FC6, or could it be
that some of my kernel-settings slow things down for FC6 (the same
compiled kernel-binary was already used for ext3). The
reiser4-partition is mounted with "noatime".

These are some features I could imagine causing problems:
* Inotify
* Adaptive file readahead + hit feedback + fine grained readahead aging
* Timer with 1kHz
* Readahead-script of the distribution

Thanks a lot, lg Clemens
