From: Kelledin <kelledin@users.sourceforge.net> (by way of Kelledin <kelledin+RFS@skarpsey.dyndns.org>)
Subject: Bug in reiserfsck 3.6.5
Date: Wed, 9 Apr 2003 05:57:29 -0500
Message-ID: <200304090557.29034.kelledin+RFS@skarpsey.dyndns.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Zy/k+pLtZ2f660y"
Return-path: <reiserfs-list-return-13620-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-00=_Zy/k+pLtZ2f660y
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

(I'd send this directly to Yura, but I'm having a bit of trouble 
getting mail through.  Twice it's bounced off the 
namesys.botik.ru mailserver as suspected spam, and when I 
finally employ a mailertable trick, namesys.botik.ru no longer 
resolves.  I think some angry god is conspiring against me and 
my bug report...)

I recently found that when installing reiserfsprogs with
/sbin/fsck.reiserfs symlinked to reiserfsck, fsck.reiserfs
generates a SIGABORT when called as an fsck backend via "fsck -a
-A -C -T" (fairly common command used in some system boot
scripts).  It was quite interesting to troubleshoot, as the
problem _didn't_ occur if I turned fsck.reiserfs into a wrapper
script, or called "fsck.reiserfs -a /dev/sda14" directly from
the bash prompt...

I traced it down to this line in lib/io.c:

--
void flush_buffers (dev_t dev)
{
    if (!dev)
        die ("flush_buffers: device is not specifed");
        ^^^^^
--

I'm fairly certan what is happening is that when fsck calls the
fsck.reiserfs backend, it's closing all default stream
descriptors (stdin, stdout, stderr) before exec'ing it.  So if
fsck.reiserfs opens the device file (/dev/sda14) before anything
else, then fs->dev_t gets a descriptor value of zero.  This
eventually trickles down to flush_buffers(), which thinks
something is wrong with this and croaks.

(This is obviously incorrect thinking on the part of
flush_buffers().  Having a general-purpose file descriptor with
a value of 0 is unusual, but not really incorrect.)

When reiserfsck is called directly from the shell prompt, or is
executed via a wrapper script, it actually gets its own
stdin/stdout/stderr sitting on descriptors 0/1/2 and thus
doesn't trip over this bug.  So creating a wrapper script works
as a quick band-aid fix.

The proper solution is to change the flush_buffers() way of
thinking; the attached patch might be enough.  Or it might not 
be.  If some other bit of code is actually setting fs->fs_dev to 
0 to signify a real error condition, then a real fix is going to 
require more far-reaching changes.

--
Kelledin
"If a server crashes in a server farm and no one pings it, does
it still cost four figures to fix?"

--Boundary-00=_Zy/k+pLtZ2f660y
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiserfsprogs-3.6.5-fdzero.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="reiserfsprogs-3.6.5-fdzero.patch"

diff -Naur reiserfsprogs-3.6.5/lib/io.c reiserfsprogs-3.6.5-fdzero/lib/io.c
--- reiserfsprogs-3.6.5/lib/io.c	2003-03-12 11:34:43.000000000 -0600
+++ reiserfsprogs-3.6.5-fdzero/lib/io.c	2003-04-09 05:43:05.000000000 -0500
@@ -390,8 +390,12 @@
 
 void flush_buffers (dev_t dev)
 {
+/* Scrap this test.  A file descriptor with a value of zero is perfectly
+ * valid.
+ *                                                        --kelledin
     if (!dev)
 	die ("flush_buffers: device is not specifed");
+*/
     sync_buffers (&Buffer_list_head, dev, 0/*all*/);
     buffer_soft_limit = BUFFER_SOFT_LIMIT;
 }

--Boundary-00=_Zy/k+pLtZ2f660y--

