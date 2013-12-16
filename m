From: Wang Sheng-Hui <shhuiw@gmail.com>
Subject: [PATCH] reiserfsprogs: remove description of unsupported long options
 in the usage of mkreiserfs
Date: Mon, 16 Dec 2013 15:39:26 +0800
Message-ID: <52AEAE2E.8020902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=Hv8ca6SRP90Oy1we9PZToCw75S+/YioisnyBH4xLxgs=;
        b=SzKbeAp6DGOBzgd2Szrq0Nf1MseosYd8DPVpbwktYwQiUHHxXR9ug6dQCSEeF24A6/
         xdS5vSdBqrNf8rBH0EV/Z4TgolwUJyImlCYJlChNGBJR2h+oskcRuyQ405NEy1/R2CoY
         faqRUO8HHKg3FP3O0d23Pm1YDKxUy7nSwoUSb4vdxrc7MiWJWkst3BYffmWRcH+43u6Y
         Ea+9vVbFOrApLS4WCYdRCNEaJDTbdEbj42vnDsAcxCfZbxZabuU9f4mCpFWWQmk5OhKx
         GVVZDOmMtkuOsqZ3siGuAtmfQ/CsW9x/JL8Fc/QR2XqJ8fkK7cgaLx4V+AWCKmKekXun
         GsGg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


The options --debug, --quiet, --force are not supported. Update the description.

Signed-off-by: Wang Sheng-Hui <shhuiw@gmail.com>
---
 mkreiserfs/mkreiserfs.8.in | 13 ++++++-------
 mkreiserfs/mkreiserfs.c    |  6 +++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/mkreiserfs/mkreiserfs.8.in b/mkreiserfs/mkreiserfs.8.in
index ae867e3..850854f 100644
--- a/mkreiserfs/mkreiserfs.8.in
+++ b/mkreiserfs/mkreiserfs.8.in
@@ -6,13 +6,12 @@
 mkreiserfs \- The create tool for the Linux ReiserFS filesystem.
 .SH SYNOPSIS
 .B mkreiserfs
-[ \fB-dfV\fR ]
+[ \fB-dfqV\fR ]
 [ \fB-b\fR | \fB--block-size \fIN\fR ]
 [ \fB-h\fR | \fB--hash \fIHASH\fR ]
 [ \fB-u\fR | \fB--uuid \fIUUID\fR ]
 [ \fB-l\fR | \fB--label \fILABEL\fR ]
 [ \fB--format \fIFORMAT\fR ]
-[ \fB-q\fR | \fB--quiet\fR ]
 [ \fB-j\fR | \fB--journal-device \fIFILE\fR ]
 [ \fB-s\fR | \fB--journal-size \fIN\fR ]
 [ \fB-o\fR | \fB--journal-offset \fIN\fR ]
@@ -58,11 +57,6 @@ Sets  the  volume  label  of  the filesystem. \fILABEL\fR can at most be 16
 characters long; if it is longer than 16 characters, \fBmkreiserfs\fR will
 truncate it.
 .TP
-\fB-q\fR | \fB--quiet \fR
-Sets \fBmkreiserfs\fR to work quietly without producing messages, progress or
-questions. It is useful, but only for use by end users, if you run \fBmkreiserfs\fR
-in a script.
-.TP
 \fB-j\fR | \fB--journal-device \fIFILE\fR
 \fIFILE\fR is the name of the block device on which is to be places the
 filesystem journal.
@@ -95,6 +89,11 @@ Forces \fBmkreiserfs\fR to continue even when the device is the whole disk,
 looks mounted, or is not a block device. If \fB-f\fR is specified more than
 once, it allows the user to avoid asking for confirmation.
 .TP
+\fB-q\fR
+Sets \fBmkreiserfs\fR to work quietly without producing messages, progress or
+questions. It is useful, but only for use by end users, if you run \fBmkreiserfs\fR
+in a script.
+.TP
 \fB-d\fR
 Sets \fBmkreiserfs\fR to print debugging information during \fBmkreiserfs\fR.
 .TP
diff --git a/mkreiserfs/mkreiserfs.c b/mkreiserfs/mkreiserfs.c
index 21fd92d..6739850 100644
--- a/mkreiserfs/mkreiserfs.c
+++ b/mkreiserfs/mkreiserfs.c
@@ -71,13 +71,13 @@ static void print_usage_and_exit(void)
                "  -u | --uuid UUID                 store UUID in the superblock\n"
                "  -l | --label LABEL               store LABEL in the superblock\n"
                "  --format 3.5|3.6                 old 3.5 format or newer 3.6\n"
-               "  -f | --force                     specified once, make mkreiserfs the whole\n"
+               "  -f                               specified once, make mkreiserfs the whole\n"
                "                                   disk, not block device or mounted partition;\n"
                "                                   specified twice, do not ask for confirmation\n"
-               "  -q | --quiet                     quiet work without messages, progress and\n"
+               "  -q                               quiet work without messages, progress and\n"
                "                                   questions. Useful if run in a script. For use\n"
                "                                   by end users only.\n"
-               "  -d | --debug                     print debugging information during mkreiser\n"
+               "  -d                               print debugging information during mkreiser\n"
                "  -V                               print version and exit\n",
                program_name);
        exit(1);
-- 
1.8.3.2

