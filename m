From: "Sachin Durge" <sachindurge@hotmail.com>
Subject: Error  in compiling  application program  including reiserfs  header files
Date: Mon, 13 Sep 2004 17:48:27 +0530
Message-ID: <BAY16-DAV17lVrnoMUT0008bc02@hotmail.com>
Reply-To: "Sachin Durge" <sachindurge@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

Hi All
I  am  new  to  this list
I  am  writting  a  user application .
In my application i  have  included

reiserfs_fs.h
reiserfs_fs_sb.h
reiserfs_fs_i.h

It is giving  lots  of errors
Any one has any clue

Thanks  &  Regards
     Sachin .
The errors are as follows

/usr/include/linux/reiserfs_fs.h: In function `is_reiserfs_magic_string':
/usr/include/linux/reiserfs_fs.h:133: dereferencing pointer to incomplete
type
/usr/include/linux/reiserfs_fs.h:135: dereferencing pointer to incomplete
type
/usr/include/linux/reiserfs_fs.h: In function `entry_length':
/usr/include/linux/reiserfs_fs.h:1028: dereferencing pointer to incomplete
type
/usr/include/linux/reiserfs_fs.h: In function `max_reiserfs_offset':
/usr/include/linux/reiserfs_fs.h:1262: dereferencing pointer to incomplete
type
/usr/include/linux/reiserfs_fs.h: At top level:
/usr/include/linux/reiserfs_fs.h:1610: syntax error before
"reiserfs_commit_thread_tq"
/usr/include/linux/reiserfs_fs.h:1611: syntax error before
"reiserfs_commit_thread_wait"
/usr/include/linux/reiserfs_fs.h: In function `reiserfs_buffer_prepared':
/usr/include/linux/reiserfs_fs.h:1687: `BH_JPrepared' undeclared (first use
in this function)
/usr/include/linux/reiserfs_fs.h:1687: (Each undeclared identifier is
reported only once
/usr/include/linux/reiserfs_fs.h:1687: for each function it appears in.)
/usr/include/linux/reiserfs_fs.h:1687: dereferencing pointer to incomplete
type
/usr/include/linux/reiserfs_fs.h: In function `buffer_journal_dirty':
/usr/include/linux/reiserfs_fs.h:1696: `BH_JDirty_wait' undeclared (first
use in this function)
/usr/include/linux/reiserfs_fs.h:1696: dereferencing pointer to incomplete
type
/usr/include/linux/reiserfs_fs.h: In function
`mark_buffer_notjournal_dirty':
/usr/include/linux/reiserfs_fs.h:1702: `BH_JDirty_wait' undeclared (first
use in this function)
/usr/include/linux/reiserfs_fs.h:1702: dereferencing pointer to incomplete
type
/usr/include/linux/reiserfs_fs.h: In function `mark_buffer_notjournal_new':
/usr/include/linux/reiserfs_fs.h:1707: `BH_JNew' undeclared (first use in
this function)
/usr/include/linux/reiserfs_fs.h:1707: dereferencing pointer to incomplete
type
/usr/include/linux/reiserfs_fs.h: At top level:
/usr/include/linux/reiserfs_fs.h:1907: syntax error before "read_proc_t"
/usr/include/linux/reiserfs_fs.h:1910: syntax error before "read_proc_t"
/usr/include/linux/reiserfs_fs.h: In function `reiserfs_get_journal_block':
/usr/include/linux/reiserfs_fs.h:2173: invalid type argument of `->'
/usr/include/linux/reiserfs_fs.h: In function
`reiserfs_get_journal_orig_size':
