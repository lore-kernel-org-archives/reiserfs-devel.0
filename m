From: Eric Whiting <ewhiting@amis.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 07:37:40 -0700
Sender: ewhiting@amis.com
Message-ID: <3E071FB4.A8FA94D6@amis.com>
References: <3E06F360.7000708@namesys.com> <20021223120357.GC13460@hvs.envisage.co.za> <20021223151045.A7697@namesys.com> <3E06FDC1.5040907@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12215-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Hendrik Visage <hvisage@envisage.co.za>, ReiserFS <reiserfs-list@namesys.com>

Hans Reiser wrote:

> >>Another slowness (especially with reiserfs3 without the notails option)
> >>is "dd if=/dev/zero of=/swapfile bs=1k count=1024k"
>
> I suppose I shouldn't ask Hendrik how often he does this in the course
> of his usual usage patterns....;-)

The above dd command (with different values of bs) is one of the first tests I
do when I bring up a RAID array -- under solaris9 or linux. It is a good way to
measure streaming throughput. 

As for other ways to artificially stress the filesystem I sometimes run multiple
concurrent 'while(true);do bonnie -s N;done' loops with different values for N. 

As far as real life stressing of the filesystem -- I think kernel compiles and
just letting the users hit the filesystem are the main high stress fs loads. My
filesystems get a lot of rsync activity as well. 

eric
