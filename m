From: Hans Reiser <reiser@namesys.com>
Subject: Re: v4 transaction design
Date: Mon, 09 Sep 2002 15:08:48 +0400
Message-ID: <3D7C8140.3070703@namesys.com>
References: <EGECJPMPCPJFHJIBBCJMEEFCCKAA.Tobias.Oberstein@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tobias Oberstein <Tobias.Oberstein@gmx.de>
Cc: reiserfs-list@namesys.com

Tobias Oberstein wrote:

>I have a couple of questions regarding the v4 design. In particular
>with respect to transaction support.
>
>The quotes are take from this document http://www.namesys.com/txn-doc.html
>
>OK, .. regarding syntax:
>
>1. how will the filesystem API extended to support user controlled
>   transaction management?
>
>     * with new syscalls?
>
sys_reiser4(), a new system call.

>     * with ioctl()'s?
>
That would be uglier.

>
>2. will the new API also provide for 2 phase commits
>
yes.

>   (so that the filesystem can act as a XA resource)?
>
what is that?

>
>   Note: even if there is not initial implementation, already
>   defining or planning the hooks might be a good idea
>
>
>.. and the semantics:
>
>"Persons familiar with the database literature will note that these
>definitions [transcrash] do not imply isolation or serializability
>between processes. Isolation requires the ability to undo a sequence
>of operations when lock conflicts cause a deadlock to occur."
>   
>Let me first give a personal impression: IMHO the term "transcrash"
>is misleading and may easily distract people not looking behind the
>words. crash is evil. but I suppose you chose that one because
>transcrashes aren't transactions semantically? I admit, naming the
>"stuff" transaction could also be misleading therefor.
>
In the paper I am writing I just use the term atomic transaction.  Look 
for the docs on this to change a lot between now and January....

>
>
>But now the real question:
>
>Have you considered multi-version concurrency control
>(maintaining multiple versions of an object) to provide
>some level ("READ COMMITTED") of isolation? This would be
>enough for many apps. It's also the default level in Oracle.
>
Yes, it is appropriate to have that.  We don't have someone implementing 
it yet though....

>
>Anyway, in database terminlogy .. what's the isolation level
>you indend to support: "READ UNCOMMITTED"?
>
>
>"Rollback is the ability to abort and undo the effects of the operations
>in an uncommitted transcrash. Transcrashes do not provide isolation,
>which is needed to support separate rollback of separate transcrashes.
>We only support unified rollback of all transcrashes in progress at the
>time of crash recovery."
>
>Does this mean an application cannot abort_tx() at it's will, but
>transactions will only be (automatically) rolled back during recovery
>(and then all uncommitted transactions will be undone)?
>
There will be atomic transactions, and isolated transactions, and only 
isolated transactions will offer independent rollback.  Only isolated 
transactions will be suitable for untrusted users.  

Atomic transactions are implemented except for the API.  Isolated 
transactions are farther away.

>
>"However, our architecture is designed to support
>separate, concurrent atoms so that it can be expanded to implement fully
>isolated transactions in the future."
>
>Are you referring to the interface?
>
No, the infrastructure.

>
>greets,
>Tobias.
>
>
>  
>



