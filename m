From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4progs 1.0.4
Date: Mon, 21 Mar 2005 16:30:36 +0300
Message-ID: <200503211630.37078.vitaly@namesys.com>
References: <200502201344.41656.vitaly@namesys.com> <200503191723.49457.vitaly@namesys.com> <423C6967.6090604@kmlinux.fjfi.cvut.cz>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_9xsPCE7HWCWF/Lf"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <423C6967.6090604@kmlinux.fjfi.cvut.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jindrich Makovicka <makovick@kmlinux.fjfi.cvut.cz>
Cc: reiserfs-list@namesys.com

--Boundary-00=_9xsPCE7HWCWF/Lf
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 19 March 2005 21:03, Jindrich Makovicka wrote:
> Vitaly Fertman wrote:
> > On Friday 18 March 2005 21:59, Jindrich Makovicka wrote:
> > 
> >>Vitaly Fertman wrote:
> >>
> >>>>so 1.0.3 & 1.0.4 bail out. Using fsck.reiser4 --build-sb from
> >>>>reiser4progs 1.0.3 rendered the filesystem created under 1.0.0 unusable,
> >>>
> >>>
> >>>fsck.reiser4 --build-sb is supposed to fix evth. what goes wrong?
> >>
> >>sorry I didn't replied earlier, but I didn't have a spare disk
> >>available. here it goes. 40GB partition was mkfs'ed with 1.0.0,
> >>populated somehow (about 32k files, 400MB), then fsck --build-sb from
> >>1.0.4 was run:
> 
> I think I didn't run mkfs 1.0.4. I once tried debugfs.reiser4 -C on the 

which progs version debugfs was from?

> test partition before fsck, as I had run it on one of my live partitions 
> previously, because I originally thought it does the migration (the 
> partition seems to have survived). Can this be the cause too? Is it 

it should not, there were found fs super block backups of some previous 
fs on the device you were fscking.

> still possible to migrate such partition to 1.0.4 or I should do full 
> backup & dd if=/dev/zero /dev/hdXX & mkfs & restore?

the patch should be able to fix fs metadata. Run
	fsck.reiser4 --build-fs --nomkid <device>

-- 
Thanks,
Vitaly Fertman

--Boundary-00=_9xsPCE7HWCWF/Lf
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4progs-nomkid.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4progs-nomkid.patch"

===== progs/fsck/fsck.c 1.160 vs edited =====
--- 1.160/progs/fsck/fsck.c	2005-02-10 13:18:59 +03:00
+++ edited/progs/fsck/fsck.c	2005-03-21 14:36:06 +03:00
@@ -148,6 +148,7 @@ static errno_t fsck_init(fsck_parse_t *d
 		{"bitmap", required_argument, 0, 'B'},
 		{"unused", no_argument, NULL, 'u'},
 		{"oldfs", no_argument, NULL, 'O'},
+		{"nomkid", no_argument, NULL, 'N'},
 		{0, 0, 0, 0}
 	};
 
@@ -161,7 +162,7 @@ static errno_t fsck_init(fsck_parse_t *d
 		return USER_ERROR;
 	}
 
-	while ((c = getopt_long(argc, argv, "L:VhnqafU:b:r?dB:plo:c:uyO", 
+	while ((c = getopt_long(argc, argv, "L:VhnqafU:b:r?dB:plo:c:uyON", 
 				options, &option_index)) >= 0) 
 	{
 		switch (c) {
@@ -238,6 +239,9 @@ static errno_t fsck_init(fsck_parse_t *d
 		case 'O':
 			aal_set_bit(&data->options, FSCK_OPT_OLD);
 			break;
+		case 'N':
+			aal_set_bit(&data->options, FSCK_OPT_OLD);
+			break;
 		}
 	}
 	
@@ -534,6 +538,7 @@ int main(int argc, char *argv[]) {
 		fsck_opt(&parse_data, FSCK_OPT_WHOLE) << REPAIR_WHOLE |
 		fsck_opt(&parse_data, FSCK_OPT_OLD) << REPAIR_WHOLE |
 		fsck_opt(&parse_data, FSCK_OPT_OLD) << REPAIR_NO_MKID |
+		fsck_opt(&parse_data, FSCK_OPT_NOMKID) << REPAIR_NO_MKID |
 		fsck_opt(&parse_data, FSCK_OPT_YES) << REPAIR_YES;
 		
 	repair.bitmap_file = parse_data.bitmap_file;
===== progs/fsck/fsck.h 1.28 vs edited =====
--- 1.28/progs/fsck/fsck.h	2005-01-17 14:57:42 +03:00
+++ edited/progs/fsck/fsck.h	2005-03-21 14:33:42 +03:00
@@ -40,7 +40,8 @@ typedef enum fsck_options {
     FSCK_OPT_RO		= 0x3,
     FSCK_OPT_DEBUG	= 0x4,
     FSCK_OPT_WHOLE	= 0x5,
-    FSCK_OPT_OLD	= 0x6
+    FSCK_OPT_OLD	= 0x6,
+    FSCK_OPT_NOMKID	= 0x7
 } fsck_options_t;
 
 typedef struct fsck_parse {

--Boundary-00=_9xsPCE7HWCWF/Lf--
