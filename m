From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: bug+fix in reiserfsck - reiserfscore/journal.c
Date: Sat, 28 Feb 2004 15:26:15 +0300
Message-ID: <200402281502.49784.vitaly@namesys.com>
References: <004301c3fcdf$b3932f60$e91ba8c0@thk.local> <200402271553.13461.vitaly@namesys.com> <010501c3fd9c$2da32d20$e91ba8c0@thk.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16976-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <010501c3fd9c$2da32d20$e91ba8c0@thk.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thorsten Kohfeldt <thorsten.kohfeldt@gmx.de>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Vladimir Saveliev <vs@namesys.com>

Hello,

On Saturday 28 February 2004 04:41, Thorsten Kohfeldt wrote:
> ----- Original Message -----
> From: "Vitaly Fertman" <vitaly@namesys.com>
> To: "Thorsten Kohfeldt" <thorsten.kohfeldt@gmx.de>;
> <reiserfs-list@namesys.com>
> Sent: Friday, February 27, 2004 1:53 PM
> Subject: Re: bug+fix in reiserfsck - reiserfscore/journal.c
>
> > On Friday 27 February 2004 06:13, Thorsten Kohfeldt wrote:
>
> ...
>
> > > The fix was extensively tested by copying mounted reiser filesystems to
> > > (XOR- !) loop devices and then reiserfsck-ing them.
> > > The fixed reiserfsck version always created the same results or, when
> > > the bugged version did replay 0 transactions, the fixed version
> > > replayed the correct amount of transactions.
>
> ...
>
> > yes, there is the bug in replaying, thank you for hitting it. After some
> > simplifications and tests I got the following patch, would you test it
> > also please.
> > --
> > Thanks,
> > Vitaly Fertman
>
> Hans,
>
> I would really be interrested in your opinion to my topic 5) down below.
>
>
> Vitaly,
>
> I tested your patch and for MY test data set it created the same results
> like the patch that I provided.

good.

> I have a few comments to your patch though:
>
> 1)
> I considered restructuring the main loop like you did but decided against
> it in favour of a "minimum invasion" strategy. We don't want to modify
> more than necessary in production software, don't we ?
> I guess verifying the correctness of your mods would require more testing.

Even trivial changes in code need proper testing. And we will perform 
some more tests with the end code before releasing anyway. But I think 
that having a necessity to change some part of the code we should change 
it as much as needed to make it correct, simple and clear to avoid other 
later changes.

> 2)
> You changed the behaviour of the function next_transaction().
> You removed the possible return code TRANS_LAST (=2).
> If I interpret the source right, then this function is kinda exported.
> Check the following excerpt:
>
> /* this is provided for anybody who wants to deal with journal */
> int replay_one_transaction (reiserfs_filsys_t *, reiserfs_trans_t *);
> void for_each_transaction (reiserfs_filsys_t *, action_on_trans_t);
> void for_each_block (reiserfs_filsys_t *, reiserfs_trans_t *,
> action_on_block_t);
> int get_boundary_transactions (reiserfs_filsys_t *, reiserfs_trans_t *,
>     reiserfs_trans_t *);
> int next_transaction (reiserfs_filsys_t *, reiserfs_trans_t *,
>     reiserfs_trans_t);
>
> I understand that functions should only be changed at will if they are
> local to one module (static). All external references by "anybody
> who wants to deal with journal" would have to be adapted.

Yes, but I would like to get rid of the LAST return code anyway. It was 
added some time ago to solve some urgent problems and now looks like 
a good time for refactoring. Nobody seems to use next_transaction though ...

> 3)
> An additional issue:
> The comment in front of the function next_transaction() states the
> following:
>
> /* trans is a valid transaction. Look for valid transaction with smallest
>    trans id which is greater than the id of the current one */
>
> Well, the function does not exactly behave like that. The test inside it
> does check something completely different. It checks wether the trans
> id is <= break_trans.trans_id. I guess that comment should be adapted.

ok.

> AND: See also 5)
>
> 4)
> I tried to find a reason for the test against
>
>     (control.mount_id == cur.mount_id && control.trans_id == 0 &&
>        control.desc_blocknr == 0)
>
> in the original source. I didn't find a reason but I didn't dare to remove
> it in order NOT to break any special case that was formerly encountered
> and fixed.

Probably someone can tell about such special cases and they will be 
documented but I do not know about any yet. Looks like this check
supposed that the trans id allocated for the first transaction after 
mounting is 1 and params in the journal header were zeroed at that 
time. This turned out to be different. Having this explanation the 
check 'control.desc_blocknr == 0' looks excessive and getting the 
first/next transaction greater then the last replayed and replaying it 
only if its transid == last replayed transid + 1 looks correct.

> Are you positively sure that you know why it can be removed ?
> Probably that implies knowing why it was written that way in first
> place . . .
>
> 5)
> Your new loop code looks quite straight forward but it (again, like in
> several other places) does NOT take account for the second discussion
> topic in my original mail, the wrap-around problem (of the trans id):
>
>     /* Looking to the first valid not replayed transaction. */
>     while (1) {
>          if (cur.mount_id == control.mount_id &&
>                  cur.trans_id > control.trans_id)
>              break;
>
> It seems the reiser team has decided NOT to allow a wrap-around of
> the transaction id ?

no decision yet, I answered on the first problem only.

> In that case there should be tools (automatically) taking care of a reset
> of the journal (CLEAN it) in case the wrap around is near . . .
>
> IS that problem taken care of in REISER 4 ?
> As I stated before, I'd suggest a 64-bit transaction id in the journal.

yes, it is 64 bits in Reiser4.

-- 
Thanks,
Vitaly Fertman
