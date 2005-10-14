From: Wiktor Wandachowicz <wiktorw@people.pl>
Subject: Re: Could reiserfsprogs display volume labels when doing fsck upon boot?
Date: Fri, 14 Oct 2005 10:57:16 +0000 (UTC)
Message-ID: <loom.20051014T124736-950@post.gmane.org>
References: <434F7D17.1030203@people.pl> <200510141309.27854.rmeijer@internet.gr> <1129285824.434f88c0c00b4@imp1-g19.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

<jp.guillemin <at> free.fr> writes:

> I think the idea is "basically" great , and I would like to see such a feature
> in reiser3 & reiser4...
> 
> Just IMHO ;)
> 
> JP

Well, I've checked the source and actually all the needed data were already in
place. I mean: the reiserfs_super_block structure contains the needed s_label
field. So I've changed a bit one source file and voila! Now the volume label is
shown exactly as I would like it to see.

The whole point is to change the print_super_block function in the
reiserfscore/prints.c file, as following:

=== QUOTE BEGIN ===
/* return 1 if this is not super block */
int print_super_block (FILE * fp, reiserfs_filsys_t * fs, char * file_name,
                              struct buffer_head * bh, int short_print)
{
    struct reiserfs_super_block * sb =
                                    (struct reiserfs_super_block *)(bh->b_data);
    dev_t rdev;
    int format = 0;
    __u16 state;

    if (!does_look_like_super_block (sb))
        return 1;

    rdev = misc_device_rdev(file_name);

    /* Print volume label if it is non-empty. */
    if (sb->s_label[0]) {
        reiserfs_warning (fp, "%s: ", sb->s_label);
    }
    reiserfs_warning (fp, "Reiserfs super block in block %lu on 0x%x of ",
                      bh->b_blocknr, rdev);
    switch (get_reiserfs_format (sb)) {
=== QUOTE END ===

For reiserfs-3.6.19, .18 & .17 I just needed to add the following test
(I don't have older versions, but I suppose it's also applicable):

    /* Print volume label if it is non-empty. */
    if (sb->s_label[0]) {
        reiserfs_warning (fp, "%s: ", sb->s_label);
    }

I think I'll send that as a patch to the Namesys, like they say on their
website: http://namesys.com/code.html, with all the needed legal mambo-jumbo
from: http://namesys.com/legalese.html

Vote for this feature enhancement and maybe they will incorporate it mainstream.
IMHO it's quick, easy, sane and adds some value at the same time.

I can't say if the same is possible for ReiserFS v.4 because I don't use it.

Friendly,
Wiktor

