From: "Tobias Oberstein" <Tobias.Oberstein@gmx.de>
Subject: v4 transaction design
Date: Mon, 9 Sep 2002 01:31:54 +0200
Message-ID: <EGECJPMPCPJFHJIBBCJMEEFCCKAA.Tobias.Oberstein@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11405-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have a couple of questions regarding the v4 design. In particular
with respect to transaction support.

The quotes are take from this document http://www.namesys.com/txn-doc.html

OK, .. regarding syntax:

1. how will the filesystem API extended to support user controlled
   transaction management?

     * with new syscalls?
     * with ioctl()'s?

2. will the new API also provide for 2 phase commits
   (so that the filesystem can act as a XA resource)?

   Note: even if there is not initial implementation, already
   defining or planning the hooks might be a good idea


.. and the semantics:

"Persons familiar with the database literature will note that these
definitions [transcrash] do not imply isolation or serializability
between processes. Isolation requires the ability to undo a sequence
of operations when lock conflicts cause a deadlock to occur."
   
Let me first give a personal impression: IMHO the term "transcrash"
is misleading and may easily distract people not looking behind the
words. crash is evil. but I suppose you chose that one because
transcrashes aren't transactions semantically? I admit, naming the
"stuff" transaction could also be misleading therefor.


But now the real question:

Have you considered multi-version concurrency control
(maintaining multiple versions of an object) to provide
some level ("READ COMMITTED") of isolation? This would be
enough for many apps. It's also the default level in Oracle.

Anyway, in database terminlogy .. what's the isolation level
you indend to support: "READ UNCOMMITTED"?


"Rollback is the ability to abort and undo the effects of the operations
in an uncommitted transcrash. Transcrashes do not provide isolation,
which is needed to support separate rollback of separate transcrashes.
We only support unified rollback of all transcrashes in progress at the
time of crash recovery."

Does this mean an application cannot abort_tx() at it's will, but
transactions will only be (automatically) rolled back during recovery
(and then all uncommitted transactions will be undone)?

"However, our architecture is designed to support
separate, concurrent atoms so that it can be expanded to implement fully
isolated transactions in the future."

Are you referring to the interface?

greets,
Tobias.
