From: sergey ivanov <seriv@parkheights.dyndns.org>
Subject: an incident with reiser4
Date: Tue, 15 Mar 2005 10:41:20 -0500
Message-ID: <42370220.7060103@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

This night I had an incident with reiser4 at IMAP mailserver (dovecot).
It was /home, mounted with fstab line:
/dev/evms/home /home reiser4 defaults 1 2
/dev/evms/home is an md3 mirror, contains 3 parts 16,0 Gb each, residing 
on 3 different IDE disks.
There was not anything interesting in logs before the incident.
The incident begin with the following messages:
------------------
Mar 15 02:20:24 parkheights kernel: reiser4[maildrop-ldap(7465)]: 
cbk_level_lookup (fs/reiser4/search.c:1033)[vs-3533]:
Mar 15 02:20:24 parkheights kernel: WARNING: Keys are inconsistent. Fsck?
Mar 15 02:20:24 parkheights kernel: reiser4[maildrop-ldap(7465)]: 
cbk_level_lookup (fs/reiser4/search.c:1033)[vs-3533]:
Mar 15 02:20:24 parkheights kernel: WARNING: Keys are inconsistent. Fsck?
Mar 15 02:20:24 parkheights kernel: reiser4[maildrop-ldap(7465)]: 
cbk_level_lookup (fs/reiser4/search.c:1033)[vs-3533]:
Mar 15 02:20:24 parkheights kernel: WARNING: Keys are inconsistent. Fsck?
Mar 15 02:20:24 parkheights kernel: reiser4[maildrop-ldap(7465)]: 
cut_tree_object (fs/reiser4/tree.c:1747)[nikita-2861]:
Mar 15 02:20:24 parkheights kernel: WARNING: failure: -5
Mar 15 02:20:24 parkheights kernel: reiser4[maildrop-ldap(7465)]: 
delete_inode_common (fs/reiser4/plugin/object.c:1003)[
vs-1216]:
Mar 15 02:20:24 parkheights kernel: WARNING: Failed to delete file body 
1279844
Mar 15 02:20:24 parkheights kernel: reiser4[maildrop-ldap(7465)]: 
cbk_level_lookup (fs/reiser4/search.c:1033)[vs-3533]:
Mar 15 02:20:24 parkheights kernel: WARNING: Keys are inconsistent. Fsck?
Mar 15 02:20:24 parkheights kernel: reiser4[maildrop-ldap(7465)]: 
cut_tree_object (fs/reiser4/tree.c:1747)[nikita-2861]:
Mar 15 02:20:24 parkheights kernel: WARNING: failure: -5
Mar 15 02:20:36 parkheights kernel: reiser4[maildrop-ldap(7480)]: 
cbk_level_lookup (fs/reiser4/search.c:1033)[vs-3533]:
Mar 15 02:20:36 parkheights kernel: WARNING: Keys are inconsistent. Fsck?
Mar 15 02:20:36 parkheights kernel: reiser4[maildrop-ldap(7480)]: 
cbk_level_lookup (fs/reiser4/search.c:1033)[vs-3533]:
Mar 15 02:20:36 parkheights kernel: WARNING: Keys are inconsistent. Fsck?
Mar 15 02:20:36 parkheights kernel: reiser4[maildrop-ldap(7480)]: 
cbk_level_lookup (fs/reiser4/search.c:1033)[vs-3533]:
Mar 15 02:20:36 parkheights kernel: WARNING: Keys are inconsistent. Fsck?
Mar 15 02:20:36 parkheights kernel: reiser4[maildrop-ldap(7480)]: 
cut_tree_object (fs/reiser4/tree.c:1747)[nikita-2861]:
Mar 15 02:20:36 parkheights kernel: WARNING: failure: -5
Mar 15 02:20:36 parkheights kernel: reiser4[maildrop-ldap(7480)]: 
delete_inode_common (fs/reiser4/plugin/object.c:1003)[
vs-1216]:
------------------
And so on,  5603 lines till 06:14 AM.
Then I came to the server and saw the problem. I switched to runlevel 1, 
tried to unmount /home, and waited about 10 minutes, the system looks 
hanged up, without reaction to the Ctrl+Alt+Del.
After 10 minutes I have reset the system, booted to runlevel 1, and 
tried fsck.reiser4 /dev/evms/home. Got answer that the filesystem has 
major problems and I should use --build-fs. Sorry, I have not recorded 
this message. Then I run
# fsck.reiser4 --build-fs /dev/evms/home |tee /root/reiser4.log, and 
after some minutes the filesystem is consystent.
But alas, all the messages was not directed to stdout, but stderr, so 
the file /root/reiser4.log was empty.
Now I have mounted filesystem, and all looks good. But I'm not sure if I 
had lost some data.

I'd like to ask questions:
1) Do people using reiser4 experience such incidents, and if do, how 
often? (I personally use reiser4fs about half a year and all the 
problems I have encountered were of my own mistakes)
2) Is it possible to check information at this filesystem, by reiser4 
tools or some another way, - or I should wait if some of mail users 
complain about corrupted or missing information?
3) Is it possible to identify the problem, or it is gone since I have 
not redirected output of fsck.reiser4 right way?

   With best regards,
       Sergey Ivanov

