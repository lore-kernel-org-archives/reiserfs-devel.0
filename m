From: Chris Mason <mason@suse.com>
Subject: Re: Data-logging and md as / fs bug
Date: 08 May 2003 09:35:35 -0400
Message-ID: <1052400935.14616.493.camel@tiny.suse.com>
References: <3EB30852.6090402@netscape.net>
	 <200305071641.37361.christian.mayrhuber@gmx.net>
	 <1052318606.14616.394.camel@tiny.suse.com>
	 <200305071652.00627.christian.mayrhuber@gmx.net>
	 <1052321005.14616.407.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1052321005.14616.407.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Wed, 2003-05-07 at 11:23, Chris Mason wrote:

[ md complains about busy devices on reboot ]

> Ok, it's probably because of the way the journal relocation code grabs
> the journal device.  Since root doesn't really get fully unmounted we've
> probably got a reference open and that is upsetting the md code.
> 
> The right fix is probably to skip the bdget when the journal device is
> not external , and just set journal->j_dev_bd to super->s_bdev.

Hopefully 03-relocation-8.diff fixes this.  The incremental is below if
you'd like to give it a try, but use with caution as I haven't tested on
an md root device here.

diff -Nru a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
--- a/fs/reiserfs/journal.c	Thu May  8 09:38:49 2003
+++ b/fs/reiserfs/journal.c	Thu May  8 09:38:49 2003
@@ -2294,7 +2294,7 @@
     
     result = 0;
 	
-    if( journal -> j_dev_bd != NULL ) {
+    if( journal -> j_dev_bd != NULL && journal->j_dev_bd != super->s_bdev) {
 	result = blkdev_put( journal -> j_dev_bd, BDEV_FS );
 	journal -> j_dev_bd = NULL;
     }
@@ -2330,6 +2330,14 @@
 
 	if( ( !jdev_name || !jdev_name[ 0 ] ) ) {
 
+		/* don't add an extra reference to the device when 
+		 * the log is on the same disk as the FS.  It makes the
+		 * raid code unhappy
+		 */
+		if (jdev == super->s_dev) {
+		    journal->j_dev_bd = super->s_bdev;
+		    return 0;
+		}
 		journal -> j_dev_bd = bdget( kdev_t_to_nr( jdev ) );
 		if( journal -> j_dev_bd ) {
 			result = blkdev_get( journal -> j_dev_bd, 



