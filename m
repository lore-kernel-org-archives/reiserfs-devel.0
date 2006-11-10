From: "Roger Lucas" <roger@planbit.co.uk>
Subject: reiserfsck with LVM read-only snapshot
Date: Fri, 10 Nov 2006 14:02:00 -0000
Message-ID: <20061110140000.16B3F12EE1@bluewhale.planbit.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am sure that this question must have been asked before, but I have searched the lists and googled with no success.

I have a system that uses Reiser and LVM.  I would like to be able to take a snapshot of the system, verify the snapshot is correct,
then save the snapshot elsewhere.  I take SHA1 checksums of the backed up images so it is important that the snapshot is read-only.

My test script is:

lvcreate --snapshot -p r --size 128M --name snaptest1 /dev/serverstore/test1
reiserfsck --check -q -y /dev/serverstore/snaptest1
dd if=/dev/serverstore/snaptest1 bs=16M | openssl sha1 > copyImageSHA1
dd if=/dev/serverstore/snaptest1 of=copyimage bs=16M

In this situation, reiserfsck always fails with error

Trans replayed: mountid 10, transid 10, desc 18, len 199, commit 218, next trans offset 201
bwrite: write 4096 bytes returned -1 (block=16, dev=3): Operation not permitted

I have tried adding the "--no-journal-available" option to tell it *not* to replay the journal, but it insists on trying to replay
the journal, even though I have told it not to.  When it does this, the same error occurs.

I understand that Reiser3 is a journalling file system and you would normally replay the journal, but I want to check my read-only
copy of the snapshot so that I know it is valid.  I don't want to change the snapshot in any way (e.g. such as writing the journal
changes to it) so that I know the checksum and image data match.  If I take a R/W snapshot then run reiserfsck, it writes changes to
the snapshot.  Sometimes these changes take time to propagate down to the LVM image.  When this happens, the SHA1 checksum may be
done on the old data whilst the copy is done using the new data.  I don't want to take the SHA1 checksum on the destination of the
copy - in the real system, this is a remote machine, and I want the SHA1 checksum done locally to detect any link errors (yes, I am
paranoid).

Is there any way to get reiserfsck to analyse a read-only LVM snapshot, even if the journal isn't replayed, etc etc?

Thanks,

Roger

