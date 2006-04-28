From: Daniel Kasak <dkasak@nusconsulting.com.au>
Subject: reiser4 problem deleting files / directories
Date: Fri, 28 Apr 2006 12:16:20 +1000
Message-ID: <44517AF4.9010405@nusconsulting.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28538-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi all.

I just ran out of space while compiling, and went to delete everything 
in /var/tmp/portage. I get the error:

rm: reading directory 
`/var/tmp/portage/nautilus-2.12.2//work/nautilus-2.12.2/cut-n-paste-code': 
Input/output error
rm: cannot remove directory 
`/var/tmp/portage/nautilus-2.12.2//work/nautilus-2.12.2': Directory not 
empty

This is with:
rm -rf /var/tmp/portage/*

Also, I've got the following in my kernel messages:

reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6903045: 0 of 2: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6903045)
reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6903078: 0 of 4: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6903078)
reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6903089: 0 of 3: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6903089)
reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6903079: 0 of 3: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6903079)
reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6903062: 0 of 4: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6903062)
reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6903093: 0 of 3: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6903093)
reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6903095: 0 of 4: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6903095)
reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6909813: 0 of 3: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6909813)
reiser4[emerge(11397)]: extent2tail 
(fs/reiser4/plugin/file/tail_conversion.c:733)[nikita-2282]:
WARNING: Partial conversion of 6909812: 0 of 4: -28
reiser4[emerge(11397)]: release_unix_file 
(fs/reiser4/plugin/file/file.c:2637)[nikita-3233]:
WARNING: Failed to convert in release_unix_file (6909812)

These warning seem to be produced at the point where I ran out of space 
( I see the 'emerge' process mentioned ).

After rebooting, I no longer get these kernel messages, however I am 
still unable to delete the nautilus folder. I still get:

rm: reading directory 
`/var/tmp/portage/nautilus-2.12.2//work/nautilus-2.12.2/cut-n-paste-code': 
Input/output error
rm: cannot remove directory 
`/var/tmp/portage/nautilus-2.12.2//work/nautilus-2.12.2': Directory not 
empty

I'd very much prefer it if I didn't have to run fsck.reiser4 on this 
partition, as it's the root partition on my laptop, and I've had *bad* 
experiences with data loss after using fsck.resier4 before. Is this my 
only option?

-- 
Daniel Kasak
IT Developer
NUS Consulting Group
Level 5, 77 Pacific Highway
North Sydney, NSW, Australia 2060
T: (+61) 2 9922-7676 / F: (+61) 2 9922 7989
email: dkasak@nusconsulting.com.au
website: http://www.nusconsulting.com.au
