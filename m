From: Matthew Bloch <matthew@bytemark.co.uk>
Subject: How to recover data with a dead journal?
Date: Fri, 6 Sep 2002 13:13:24 +0100
Message-ID: <200209061313.24892.matthew@bytemark.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11384-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Here's a problem; my drive is on its way out but the latest corrupt sector is 
the ReiserFS journal (from the ReiserFS in kernel 2.4.18):

factotum:/home/mattbee# mount /dev/hdb3 /old/
reiserfs: checking transaction log (device 03:43) ...
hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
hdb: read_intr: error=0x40 { UncorrectableError }, LBAsect=733664, 
sector=40160
end_request: I/O error, dev 03:43 (hdb), sector 40160
hdb: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
hdb: read_intr: error=0x40 { UncorrectableError }, LBAsect=750560, 
sector=57056
end_request: I/O error, dev 03:43 (hdb), sector 57056
journal-1212: REPLAY FAILURE fsck required! buffer write failed
Replay Failure, unable to mount
reiserfs_read_super: unable to initialize journal space
mount: wrong fs type, bad option, bad superblock on /dev/hdb3,
       or too many mounted file systems

Of course I've fscked it while telling it to ignore the journal, and it found 
a few errors but it still doesn't change the fact that mount won't mount 
without a journal.  mount's nolog option doesn't seem to be implemented yet-- 
is there a later version that does implement it, and is this the only way to 
get at what's left of my data?  

I've tried:

  dd if=/dev/hdb3 of=deaddrive conv=noerror
  mount deaddrive /old/ -t reiserfs -o loop

but mount reports, somewhat cryptically that /old isn't a directory, which it 
plainly is :)

I only want to read the remnants off once then discard the drive; any 
suggestions for the quicket solution?

-- 
Matthew Bloch         Bytemark Computer Consulting Limited
                                http://www.bytemark.co.uk/
                                  tel. +44 (0) 8707 455026

