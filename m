From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: link/unlink problem gone?
Date: 9 Feb 2003 00:16:49 -0500
Message-ID: <b24o81$hiv$1@satsuki.furryterror.org>
References: <20030129164906.A8320@namesys.com> <b1unpa$bmb$1@satsuki.furryterror.org> <b1unpa$bmb$1@satsuki.furryterror.org> <20030207091933.A6256@namesys.com>
Return-path: <reiserfs-list-return-12678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030207091933.A6256@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>I noticed that with newer 2.4.21-pre kernels first I see processes die because
>of OOM and only after that I see direntries pointing to nowhere.
>I reproduced this much more than once, so I believe there is some correlation
>between these.

This may explain why the rsyncs seem to be necessary.  When I was
trying to build a bug demonstrator, I initially tried a bunch of
processes doing link()/unlink() on a handful of files, and then tried
the concurrent 'cp -al's and 'rm -rf's, but neither of those worked
(I let it run all weekend).  I then added the rsyncs just to add some
churn to the filesystem and at that point the errors started appearing.
I was so happy that I could reproduce the problem at all that the next
thing I did was post to the list.  ;-)

So maybe rsync itself is irrelevant, except as a process that forces the
system to swap.  If you replace the rsync in the script with a process
that eats memory but doesn't touch the filesystem (or alternatively,
reduce the amount of RAM in the system so severely that cp will be
swapping), does the script still demonstrate errors?

Meanwhile, in the field I've rearranged various software so that it
tries to avoid concurrently linking or unlinking the same files at the
same time in order to work around this bug.  I can't entirely prevent
concurrent links or unlinks, but I'm pretty sure they're now happening
much less often--tasks that were scheduled at the same time each day
now occur 12 hours apart, jobs that worked on different parts of the
directory concurrently now run sequentially, etc.  Unfortunately, this
bug's manifestations are still appearing at about the same rate they
were before...  :-P

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
