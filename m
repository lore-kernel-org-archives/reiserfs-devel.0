From: "Thorsten Kohfeldt" <thorsten.kohfeldt@gmx.de>
Subject: Re: bug+fix in reiserfsck - reiserfscore/journal.c
Date: Sat, 28 Feb 2004 02:41:48 +0100
Message-ID: <010501c3fd9c$2da32d20$e91ba8c0@thk.local>
References: <004301c3fcdf$b3932f60$e91ba8c0@thk.local> <200402271553.13461.vitaly@namesys.com>
Reply-To: "Thorsten Kohfeldt" <thorsten.kohfeldt@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>

----- Original Message -----
From: "Vitaly Fertman" <vitaly@namesys.com>
To: "Thorsten Kohfeldt" <thorsten.kohfeldt@gmx.de>;
<reiserfs-list@namesys.com>
Sent: Friday, February 27, 2004 1:53 PM
Subject: Re: bug+fix in reiserfsck - reiserfscore/journal.c


> On Friday 27 February 2004 06:13, Thorsten Kohfeldt wrote:
...
> > The fix was extensively tested by copying mounted reiser filesystems to
> > (XOR- !) loop devices and then reiserfsck-ing them.
> > The fixed reiserfsck version always created the same results or, when
> > the bugged version did replay 0 transactions, the fixed version replayed
> > the correct amount of transactions.
...
> yes, there is the bug in replaying, thank you for hitting it. After some
> simplifications and tests I got the following patch, would you test it
> also please.
> --
> Thanks,
> Vitaly Fertman


Hans,

I would really be interrested in your opinion to my topic 5) down below.


Vitaly,

I tested your patch and for MY test data set it created the same results
like the patch that I provided.

I have a few comments to your patch though:

1)
I considered restructuring the main loop like you did but decided against
it in favour of a "minimum invasion" strategy. We don't want to modify
more than necessary in production software, don't we ?
I guess verifying the correctness of your mods would require more testing.

2)
You changed the behaviour of the function next_transaction().
You removed the possible return code TRANS_LAST (=2).
If I interpret the source right, then this function is kinda exported.
Check the following excerpt:

/* this is provided for anybody who wants to deal with journal */
int replay_one_transaction (reiserfs_filsys_t *, reiserfs_trans_t *);
void for_each_transaction (reiserfs_filsys_t *, action_on_trans_t);
void for_each_block (reiserfs_filsys_t *, reiserfs_trans_t *,
action_on_block_t);
int get_boundary_transactions (reiserfs_filsys_t *, reiserfs_trans_t *,
    reiserfs_trans_t *);
int next_transaction (reiserfs_filsys_t *, reiserfs_trans_t *,
    reiserfs_trans_t);

I understand that functions should only be changed at will if they are
local to one module (static). All external references by "anybody
who wants to deal with journal" would have to be adapted.

3)
An additional issue:
The comment in front of the function next_transaction() states the
following:

/* trans is a valid transaction. Look for valid transaction with smallest
   trans id which is greater than the id of the current one */

Well, the function does not exactly behave like that. The test inside it
does check something completely different. It checks wether the trans
id is <= break_trans.trans_id. I guess that comment should be adapted.
AND: See also 5)

4)
I tried to find a reason for the test against

    (control.mount_id == cur.mount_id && control.trans_id == 0 &&
       control.desc_blocknr == 0)

in the original source. I didn't find a reason but I didn't dare to remove
it in order NOT to break any special case that was formerly encountered
and fixed.
Are you positively sure that you know why it can be removed ?
Probably that implies knowing why it was written that way in first
place . . .

5)
Your new loop code looks quite straight forward but it (again, like in
several other places) does NOT take account for the second discussion
topic in my original mail, the wrap-around problem (of the trans id):

    /* Looking to the first valid not replayed transaction. */
    while (1) {
         if (cur.mount_id == control.mount_id &&
                 cur.trans_id > control.trans_id)
             break;

It seems the reiser team has decided NOT to allow a wrap-around of
the transaction id ?
In that case there should be tools (automatically) taking care of a reset
of the journal (CLEAN it) in case the wrap around is near . . .

IS that problem taken care of in REISER 4 ?
As I stated before, I'd suggest a 64-bit transaction id in the journal.

Thorsten



