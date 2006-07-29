From: "Jesper Juhl" <jesper.juhl@gmail.com>
Subject: Re: possible recursive locking detected - while running fs operations in loops - 2.6.18-rc2-git5
Date: Sun, 30 Jul 2006 00:18:50 +0200
Message-ID: <9a8748490607291518m59573244wac00486a64f6385b@mail.gmail.com>
References: <9a8748490607251516j1433306ek9c64cc84c0838f7b@mail.gmail.com>
	 <20060725232924.GU6452@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29256-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060725232924.GU6452@schatzie.adilger.int>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jesper Juhl <jesper.juhl@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Reiser <reiser@namesys.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Al Viro <viro@ftp.linux.org.uk>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com

On 26/07/06, Andreas Dilger <adilger@clusterfs.com> wrote:
> On Jul 26, 2006  00:16 +0200, Jesper Juhl wrote:
> > What I did to provoke it was to run 6 different xterms (with a bash
> > shell) with the following loops in them in a test directory that was
> > initially empty :
> >
> > xterm1:   while true; do mkdir a; done
> > xterm2:   while true; do rmdir a; done
> > xterm3:   while true; do touch a/foo; done
> > xterm4:   while true; do find .; done
> > xterm5:   while true; do sync; sleep 1; done
> > xterm6:   while true; do rm -r a; done
>
> See racer test at ftp.lustre.org/pub/benchmarks/racer-lustre.tar.gz
>
> It does the above, but a bunch more things and is a truly pathalogical
> test script that does lots of "stupid user tricks", unlike normal tests
> which are only doing operations that expect to be successful.
>
> PS - during the racer.sh test run "rm" is known to segfault after hitting
>      an internal assertion, nobody is sure why.
> PPS- I don't know who wrote this program, it was originally posted by
>      someone not the author to linux-fsdevel or something.
>

Thanks. That's a nice little test suite.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
