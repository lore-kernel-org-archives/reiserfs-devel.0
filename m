From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: HELP !!!!!!!! Cant  compile the application  including reiserfs
 .h files
Date: Thu, 16 Sep 2004 13:02:20 -0400
Message-ID: <4149C71C.5010205@suse.com>
References: <BAY16-DAV81DdQcp0Tk00000c52@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAY16-DAV81DdQcp0Tk00000c52@hotmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sachin Durge <sachindurge@hotmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Sachin Durge wrote:
| Hi ALL
| I want  write a  application  which  will  read  the reiserfs files even
| when the file system  is not  mounted  directly  from the Hard disk
| I tried to  include the   headerfiles
|     reiserfs_fs_sb.h
|     reiserfs_fs_i.h
|     reiserfs_fs.h
| I get  lots of error and warning messages
| Can any  one tell  me how should i  proceed  ......................
|
| Thanks & Regards
|     Sachin

| Sachin Durge wrote:
| | Hi All
| | I  am  new  to  this list
| | I  am  writting  a  user application .
| | In my application i  have  included
| |
| | reiserfs_fs.h
| | reiserfs_fs_sb.h
| | reiserfs_fs_i.h
| |
| | It is giving  lots  of errors
| | Any one has any clue
|
| Including kernel headers in userspace programs is unsupported. There are
| examples of userspace headers available in reiserfsprogs.
|
| -Jeff
|

Asking again doesn't change the answer.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBScccLPWxlyuTD7IRAtkXAJ9azNAxZ4JvhCMB6VcqMQyBoUjQ8wCgkWan
/JPZF6wYudZwpfaVEnKSRyw=
=zEwY
-----END PGP SIGNATURE-----
