From: David Masover <ninja@slaphack.com>
Subject: Re: snapshot, checkpoints
Date: Fri, 04 Jun 2004 23:39:56 -0500
Message-ID: <40C14E9C.4000706@slaphack.com>
References: <20040527065259.99429.qmail@web51306.mail.yahoo.com> <1085641393.1915.199.camel@tribesman.namesys.com> <20040527092727.GO4990@nysv.org>            <20040604131005.hmvps8wcw4sccgcs@www.wagland.net> <200406041925.i54JPZgp025255@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406041925.i54JPZgp025255@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Paul Wagland <paul@kungfoocoder.org>, Markus TXrnqvist <mjt@nysv.org>, Vladimir Saveliev <vs@namesys.com>, tdwebste2@yahoo.com, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Valdis.Kletnieks@vt.edu wrote:
| On Fri, 04 Jun 2004 13:10:05 +0200, Paul Wagland said:
|
|
|>Can't the same functionality be created with device mapper though? At
least
|>under linux anyway?

[...]

| 2) You also need a suitable write-barrier interlock to the filesystem, to
| basically force a flush-to-disk of all the incore data buffers, etc
(basically,
| you need to ensure that at the instant the snapshot is taken, the
on-disk copy
| is "clean" by fsck standards).


My main problem with this is that it seems to literally be a snapshot --
that is, a complete backup to another partition.  I think we should have
something like a version control system -- blocks (or files, or
clusters, or whatever granularity is best/easiest) which change after
the snapshot must be rewritten to somewhere else in the same partition.

This means that the original filesystem is recoverable (in case of
software trouble), and that the recovery takes very little time.  It
also means that things which don't change much don't get copies made.

This is even an advantage when you do want a separate partition/drive to
guard against disk failures, because you can now store many more
versions on a single partition.  I currently do something like this with
hardlinks -- every new backup is a hardlink farm of the latest backup,
which I then rsync with the live filesystem.  (rsync unlinks files
before it overwrites them.)  But that's hardlinks -- it'd be nice to be
able to do it at finer granularity (if there'd be no performance loss)
and on live partitions (without an actual "backup").

Of course, the necessity of a full snapshot is still there, and with
that, I'd rather have the files copied a la "cp" -- less disk activity.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQMFOnHgHNmZLgCUhAQLN5BAAilxfG4Cs+49SFgE3T//L9Iss6nH2Lz2Y
LEZft4uElLRLkGoreAeEMJew1Tz4GV5bGajLSkNZingeefwMawhUKXLYq9z6jO9O
YYhoQYEGBrvQeHhe8rqCSQ+rqOqmk8PZrXZsNbNJJ25RCdCTPTuRw/VTkTvUYCOY
N9MSv2ihJDzWvy58/gfwY6zGYmqYoLowttzRm+CrxIH/KBtFcxhu7bbs5cWXgJ6P
/MDO1BbkdCaK0FV/HZljsk12d38LKAriCmInmp6ZuDQiWmL9Waq/dFu6sYhb9q3P
0RTWURM9eBV/I8E2Xh8VcEuCSLJMHnxjTqCcWU8d17rALrZbdwSPyXNS8zuzsndI
O4EZRbXrWrDlXfWoO7vkA+upkaLKkraYUjEPdx/KQAdgflFHbq0ta76Vc+LMaLfE
Id8+MaDug71cQsngQSujr6FEbKZOfAhIf3VBFf7T5irciaOzsKJeSQxE7Ceo8tME
vz0D1j7d4LDQWtmxpCHXiJuFXVbPR0EbDGJuFz6YKQcRk4gPoUXKntuY3QN8e59n
39Q5zJGw++1SrQkAG9/Bvjq2nvgqIxuxv2WH8nWOmDeQKDlaKq3o9+wxWJYiq8kj
MvFo2CJA1DzRQ510zgsu3k+Mk4RQyXeGG/HdaE3xuT1PnB2BlGug8jCtyrk4i1Bu
xZNBiflMqZw=
=7rR5
-----END PGP SIGNATURE-----
