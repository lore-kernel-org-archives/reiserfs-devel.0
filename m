From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/6] reiser4progs: Limit printing of label to the maximum
 of 16 chars
Date: Fri, 03 May 2013 22:39:06 +0200
Message-ID: <5184206A.4000100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090306070703010006000003"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=RC85ncOGrf9FSz7VWV5GFWRzMNwcTN7b+Uvw9AK0pPo=;
        b=NDlpD+3iuw+t082jqqhE0bcYjhPXeXgohBjQT43u8hG0+LfYovwubjBdMLLgAqYuDD
         PE2TYDX+On+vclYTl5nxBh5YjKmcgujVAJ7NYIoI9LH6jPt2PlY3Zi7o8hku2PDHcBS5
         2dWFbj2PYbBGhZhP7DWYdmmOmsBCdMVRRPMrPsjm3o6yEor1tzOD2gN9pF9eXDE4W+Cc
         p3S5GzcvBNMMOpUwM3cPaSrCFBo0NY0DYsodwefX+vxbjRZXfvBWkkyPjlgqNuLZkXhe
         abW5E2BJTQTHSV6hLV2tlYfeoOfn7+cgCPlQbD0WUdPfKzy7oDCFZm/8/E+GJSPShBcx
         0uIA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090306070703010006000003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------090306070703010006000003
Content-Type: text/x-patch;
 name="reiser4progs-limit-printing-of-label-to-the-maximum-of-16-chars.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="reiser4progs-limit-printing-of-label-to-the-maximum-of-16-ch";
 filename*1="ars.patch"

From:	Mike Fleetwood <mike.fleetwood@googlemail.com>

For a reiser4 file system with exactly the maximum size 16 character
label, debugfs.reiser4 prints junk from memory at the end of the label.
This is because the label is read into a 16 character array and is
printed as a string, but there isn't a nul terminating character.

    # mkfs.reiser4 --yes --label abcdefghij123456 /dev/sda13
    # debugfs.reiser4 /dev/sda13 2> /dev/null | grep label:
    label:          abcdefghij123456!

Print at most 16 characters of the label.

Signed-off-by: Mike Fleetwood <mike.fleetwood@googlemail.com>
Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

---
 librepair/master.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- reiser4progs-1.0.7.orig/librepair/master.c
+++ reiser4progs-1.0.7/librepair/master.c
@@ -356,7 +356,7 @@ void repair_master_print(reiser4_master_
 #endif
 	
 	if (*master->ent.ms_label != '\0') {
-		aal_stream_format(stream, "label:\t\t%s\n",
+		aal_stream_format(stream, "label:\t\t%.16s\n",
 				  reiser4_master_get_label(master));
 	} else {
 		aal_stream_format(stream, "label:\t\t<none>\n");

--------------090306070703010006000003--
