From: Esben Stien <b0ef@esben-stien.name>
Subject: Encounter of the Bad Block Kind
Date: Tue, 08 Feb 2005 22:51:35 +0100
Message-ID: <87y8dyvhy0.fsf@quasar.esben-stien.name>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

All filesystems herein are reiserfs'ed. 

I was entering a directory called foo/ on hda1 (hda = 203Go), then bad
blocks were found.

Here's a shortened and modified sample:

end_request: I/O error, dev hda, sector z
hda:dma_intr:status=0x51{DriveReady SeekComplete Error}
hda:dma_intr:error=0x40{UncorrectableError},LBAsect=x,high=17,low=y,sector=z
ide: failed opcode was: unknown

#umount /dev/hda1
#dd_rescue -l hda1.dd.p1.log -A -B 4096 -b 1M /dev/hda1 /mnt/fs2/hda1.img

I umount'ed the partition, called up shop, ordered a new 200Go hd and
transferred hda1.img to a filesystem on the new hd.

Because the partition I was transferring hda1.img to was smaller I had
to cancel the dd_rescue operation. This was because hda itself was
about 203Go and the new hd I had was 199Go. I had to cancel dd_rescue
several Go before the job was complete. 

#losetup /dev/loop0 /mnt/hda1.img 
#reiserfsck --logfile hda1.fsck.p1.log /dev/loop0
#reiserfsck --logfile hda1.fsck.p1.rsb.log --rebuild-superblock /dev/loop0
#reiserfsck --logfile hda1.fsck.p1.rt.log --rebuild-tree /dev/loop0

I then losetup'ed the image and ran reiserfsck on it. Because the
hda1.img was smaller in size, the superblock holding the information
on the partition size was wrong. I then --rebuild-sb and ran
reiserfsck again, which adviced me to run --rebuild-tree; ..and so I
did.

#mount /dev/loop0 /mnt/image

When it was finished, I mounted the hda1.img only to find about 90% of
the files fubar'ed. My hda1 was only containing movies in several
directories and I was unable to play most fubar'ed files and those
borken files I managed to play were very annoying to look at. The
remaining 10% which were intact, played fine. There were also many
files missing; f.ex I had part 1 of one movie and part 2 of
another. 

#dd_rescue -l hda1.dd.p2.log -A -B 4096 -b 1M /dev/hda1 /mnt/fs2/hda1.img
#losetup /dev/loop0 /mnt/hda1.img 
#reiserfsck --logfile hda1.fsck.p2.log /mnt/image

I then decided to get a bigger hd, so I bought a 250Go hd. I then
dd_rescue'ed the whole image to the new filesystem and losetup'ed
it. I noted that dd_rescue found 52 errors in 208kio of data. I
proceeded with reiserfsck which told me to run --rebuild-tree.

#mount /dev/loop0 /mnt/image
#cp -a /mnt/image/* /mnt/fs4/muhaha

I was sceptic this time around to run --rebuild-tree since the last
time I ran it, it destroyed 90% of my files so I just mounted the
hda1.img without --rebuild-tree'ing it. All my files except foo/ and
bar.mtk were intact. I cp'ed all these files to another filesystem.

#reiserfsck --logfile hda1.fsck.p2.rt.log --rebuild-tree /mnt/image
#mount /dev/loop0 /mnt/image

I then --rebuild-tree as reiserfsck adviced me to; just to see what
happened. It ran until it was finished, then I mounted it. All my
files except foo/ and bar.mtk were intact. Now they were found in
lost_and_found, as expected. Some files that were in foo/ I could also
play;), but bar.mtk is gone forever it seems.

Guess we can't work on incomplete images..!

-- 
Esben Stien is b0ef@esben-stien.name
http://www.esben-stien.name
irc://irc.esben-stien.name/%23contact
[sip|iax]:b0ef@esben-stien.name
