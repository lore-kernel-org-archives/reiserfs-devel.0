From: Joe Orton <jorton@redhat.com>
Subject: EACCESS vs ENOENT for nonexistent files-within-files
Date: Mon, 13 Sep 2004 15:06:37 +0100
Message-ID: <20040913140637.GB29591@redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: jorton@redhat.com

Hi, we had a bug report that Apache httpd logs a spurious error for
every file served from a reiser4 filesystem, because httpd assumes that
/path/to/file/.htaccess (where /path/to/file is a normal file) returns
ENOENT or ENOTDIR, but reiser4 returns EACCES in this case.

Can someone explain the justification behind reiser4's behaviour? 
httpd's assumption does not seem unreasonable, and EACCES seems to make
little sense for this error case.

Regards,

joe
