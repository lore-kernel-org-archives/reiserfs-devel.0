From: David Greaves <david@dgreaves.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Fri, 23 Sep 2005 07:21:25 +0100
Message-ID: <43339EE5.9030202@dgreaves.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl>	 <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz>	 <20050921000425.GF6179@thunk.org> <e692861c05092018017ceef484@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26252-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c05092018017ceef484@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gmaxwell@gmail.com
Cc: Theodore Ts'o <tytso@mit.edu>, Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Gregory Maxwell wrote:

>Very interesting indeed, although it almost seems silly to tackle the
>difficult problem of making filesystems highly robust against oddball
>failure modes while our RAID subsystem falls horribly on it's face in
>the fairly common (and conceptually easy to handle) failure mode of a
>raid-5 where two disks have single unreadable blocks on differing
>parts of the disk. (the current raid system hits one bad block, fails
>the whole disk, then you attempt a rebuild and while reading hits the
>other bad block and downs the array).
>  
>
who's not keeping up with the linux-raid list then ;)

David
PS I'm sure assistance would be appreciated in testing and reviewing
this few day old feature - or indeed the newer 'add a new disk to the
array' feature.

