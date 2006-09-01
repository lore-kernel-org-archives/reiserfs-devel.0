From: "Peter" <sw98234-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: reiser4 corruption on initial copy
Date: Fri, 1 Sep 2006 11:02:58 +0000 (UTC)
Message-ID: <ed9412$2r9$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29774-reiserfs=m.gmane.org-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-help: <mailto:reiserfs-list-help-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
list-post: <mailto:reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org>
Errors-To: flx-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org
Sender: news <news-WnDAp88bSu3NLxjTenLetw@public.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list-nJ1KrdHEGnBBDgjK7y7TUQ@public.gmane.org

I recently copied over my / partition from a reiserfs to a reiser4
partition. This may be user error, but I wanted to report it anyway.

Booting off a live cd- I did the following.

mount source partition -o ro,noatime
mount destination partition -o rw,noatime

# cd source partition
# tar --one-file-system -cvf - | tar -C dest -xf -

Tar went along fine. At the end, there was a very long pause, about a
minute, after the last file (a symlink to /var) was copied. Then the
prompt returned.

On booting up, there were a stream of kernel errors, etc. So I booted
another / and fsck destination partition.

It found one error in a file, just before the last file (/var symlink)
copied. I fixed it, it removed the file (/sbin/uname). Recopied it over
from the source partition. 

After this, the partition works fine.

I wanted to know: 1) did I copy over the stuff wrong? I also used cp -ax
and had the same problems except this time the disk could not be repaired.
2) I did run badblocks on the dest, and it was clean. 3) I am using the
patch from 2.6.17.3 and in my kernel, I have full preempt and cfq
scheduling.

Any feedback appreciated! Thx and keep up the good work.

-- 
Peter
+++++
Do not reply to this email, it is a spam trap and not monitored.
I can be reached via this list, or via 
jabber: pete4abw at jabber.org
ICQ: 73676357

