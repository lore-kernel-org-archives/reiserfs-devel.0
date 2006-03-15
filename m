From: Andreas =?iso-8859-1?Q?Sch=E4fer?= <gentryx@gmx.de>
Subject: Re: State of the Reiser4 FS
Date: Wed, 15 Mar 2006 20:27:30 +0100
Message-ID: <20060315192730.GA11927@wintermute>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com> <1142336718.7415.55.camel@tribesman.namesys.com> <194f62550603140732j6ef10757j@mail.gmail.com> <4417BEC4.6060506@namesys.com> <20060315085745.GA21609@wintermute> <44185CEC.3010103@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44185CEC.3010103@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On 10:29 Wed 15 Mar     , Hans Reiser wrote:
> Tell the mosix guys we would be willing to cooperate with them regarding
> their problem.

If it was that easy... The problem for openMosix is that most devices
fetch data in 4k blocks via copy_from_user(). For migrated processes,
openMosix intercepts these calls and forwards them to the node which
currently hosts the process. This forwarding yields a high latency
penalty.

Obviously there are two ways to get rid of this problem: 

* modify _every_ Linux device driver to use a
  _a_lot_more_than_4k_at_a_time_ approach or

* implement a second "read ahead" buffer which fetches large blocks via
  the network in the background and answers calls to copy_from_user()
  directly from the local buffer

In my _very_ humble opinion the first approach would be much nicer,
but after you guys had so many trouble with just your filesystem, I
don't see that one coming, not at all.

So I think the long term strategy for oM will the second, double
buffering approach. At least I couldn't think of any other realistic,
feasible way.

BTW: how are you guys planning to solve this 4k issue? Will you revert
to small blocks or will you "pretend" to perform 4k transfers and
assemble those in the background to, again, process large chunks at
once? If yes, wouldn't this seriously increase CPU usage due to
(most likely) unnecessary data duplication?

Regards
-Andreas
