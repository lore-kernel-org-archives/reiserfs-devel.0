From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [ANNOUNCE] Reiserfs/kill-bkl tree v2
Date: Fri, 31 Jul 2009 19:46:43 +0200
Message-ID: <20090731174642.GA6539@nowhere>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:mime-version:content-type:content-disposition
         :user-agent;
        bh=RecwaUQouLk2ONGQnHai5ZGl/kHL1A+c+U7wr4Ctx8A=;
        b=PQdypD9A2oyFvDt/ldQYmRIjRblkhshhnDJDF9kBZXl5Fcd0eu3+Eh3OQ5czCbX7ql
         Os5OuqkJcCLVv4m7KOTVjtSt6f5bN2TNTnVQ8qIBQyfiy45IjL6R5ovJi/cN3G3QpjdG
         8Yhx+FXeoF+/T2IDLOtyfv9ndyP2MCqPgDkns=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Andi Kleen <andi@firstfloor.org>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>

Hi everyone,

I'm pleased to announce the v2 of the reiserfs/kill-bkl tree.
(Has there been a v1 actually...I'm not sure).

This work was first borned and hosted in the tip:kill-the-bkl tree
and has then been detached as a seperate branch.

This patchset consists in dropping the bkl locking scheme from
reiserfs 3 and replacing it with a per superblock mutex.


I) Deal with the BKL scheme

The first obstacle was to deal with the bkl based locking scheme
in which the whole reiserfs code is based on:

Bkl behaviour:

- disables preemption
- is relaxed while scheduling
- can be acquired recursively by a task

The resulting reiserfs code:

- some callsites acquire the lock, sometimes recursively. In
  the latter case, it's often hard to fix
- after every calls to functions that might sleep, reiserfs
  performs checks to ensure the tree hasn't changed and compute
  fixups in the latter case.

These properties have resulted in the creation of an ad-hoc locking
primitive based on a mutex but that can be acquired recursively.
Also most might-sleep-callsites have been explicitly surrounded
with a relax of the lock.


II) Deal with performance regressions

The bkl is based on a spinlock whereas the new lock is based
on a mutex. We couldn't safely make it a spinlock because the
code locked by the bkl can sleep, and such conversion would
have needed a lot of rewrites.

There are a lot of reasons that can make a spinlock more efficient
than a mutex.
But still we have now two nice properties:

- the mutexes have the spin on owner features, making them closer to a
 spinlock behaviour.
- the bkl is *forced* to be relaxed on schedule(). And sometimes this
  is a weakness. After a simple kmalloc, we have to check the filesystem
  hasn't changed behind us and to fixup in that case. That can be very
  costly. Sometimes this is something we want, sometimes not. At least
  with a mutex, we can choose.


III) Benchmarks

Comparisons have been made using dbench between vanilla throughput
(bkl based) and the head of the reiserfs/kill-bkl tree (mutex based).
Both kernel had the same config (CONFIG_PREEMPT=n, CONFIG_SMP=y)

- Dbench with 1 thread during 600 seconds (better with the mutex):

  Lock                   Throughput in the end
  
  Bkl                    232.54 MB/sec
  Mutex                  237.71 MB/sec

Complete trace:

  Bkl: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/bkl-600-1.log
  Mutex: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/mut-600-1.log

Graphical comparison:

  http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/dbench-1.pdf


- Dbench with 30 threads during 600 seconds (better with the bkl):

  Lock                   Throughput in the end

  Bkl			 92.41 MB/sec
  Mutex			 82.25 MB/sec

Complete trace:

  Bkl: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/bkl-600-30.log
  Mutex: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/mut-600-30.log

Graphical comparison:

  http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/dbench-30.pdf


- Dbench with 100 threads during 600 seconds (better with the mutex):

  Lock                   Throughput in the end

  Bkl                    37.89 MB/sec
  Mutex                  40.58 MB/sec

Complete trace:

  Bkl: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/bkl-600-100.log
  Mutex: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/mut-600-100.log

Graphical comparison:

  http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/dbench-100.pdf

- Dbench with two threads, writing on a seperate partition simultaneoulsy,
  during 600 seconds (better with the mutex):

  Lock                   Thread #1         Thread #2

  Bkl			 199.95 MB/sec     186.16 MB/sec
  Mutex                  213.91 MB/sec     203.84 MB/sec

Complete trace:

  Bkl, thread #1: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/dual-bkl-600-1.log
  Bkl, thread #2: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/dual2-bkl-600-1.log
  Mutex, thread #1: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/dual-mut-600-1.log
  Mutex, thread #2: http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/dual2-mut-600-1.log

Graphical comparison:

http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/dbench-dual.pdf


IV) Testing and review

You can fetch the git tree, this one will keep being the most up to date:

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git reiserfs/kill-bkl

Or you can either apply the raw diff:
http://www.kernel.org/pub/linux/kernel/people/frederic/bench-3107/reis_full.diff

Tests/reviews/any kind of contributions are very welcome!

Thanks,
Frederic.

