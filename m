From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [xfstests/generic/081] Kernel panic with reg40 plugin and R4-for-4.1.5.patch
Date: Thu, 10 Sep 2015 21:20:09 +0200
Message-ID: <55F1D7E9.2000209@gmail.com>
References: <CADW=+3=x+ajq+N4QqwmRQ-4uEAPEpr5xopV+31zz2HQonMc_UA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030209090203020003070501"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type;
        bh=RkyBrsTMQSQR6/Y6FyT/tZ2+Xy68OtnnJe0UTqNo350=;
        b=dkELKA1zSfdZ11dear+n46d4a7lhaUb1FC/3q0xrqZ/ZmTCEVd73vxmtawQ3ydHYwD
         f1549sLT17I0HPYPuIHHbYFQdthecUoCHjqZmRpfYv3nEp+7EVtl89vU0yXrPl395Nsv
         lZ1ZDd2LPSj/u19IWivvgC77DzAHjE4TqSl6YaTLcpg+9Wbw4FPGUi4teWfpeUsHq3fe
         f8MjJYGM+v02Vn77RGOIZS95guMHogNdKgPhpnS2QAY/1Vt8iV/RsEE+FhDD98fUCX9S
         dmOIt0AK2GlFXecx2JUvofIQgHO4ZPoDp3A+WkiZjllLLV+uXXmkBeRhbZSP5DhADwWh
         BmyA==
In-Reply-To: <CADW=+3=x+ajq+N4QqwmRQ-4uEAPEpr5xopV+31zz2HQonMc_UA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030209090203020003070501
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Actually, this is not a regression.
The attached patch prevents the panic.
By default on IO errors reiser4 partition will be remounted as "readonly".

No ideas why accessing /dev/dm-X causes IO error.
Reiser4 is not the culprit ;) You can narrow down this, if interesting.
I think that something is wrong with LVM settings...

Thanks,
Edward.


On 09/04/2015 09:35 AM, Dušan Čolić wrote:
> Kernel: 4.1.6
> R4 patch: 4.1.5
> Test: xfstests/generic/081 "Test I/O error path by fully filling an dm
> snapshot."
>
> Test passes cleanly with ccreg40 but kernel panics with reg40 plugin.
> Picture of the panic, as I had no other means of capturing it, is in attachment.
>
> xfstests local.config section:
>
> [r4Hybrid]
> MKFS_OPTIONS="-o create=reg40"
> MOUNT_OPTIONS="-o noatime"
>
> Have a nice day.
>
> Dushan


--------------030209090203020003070501
Content-Type: text/x-patch;
 name="reiser4-change-default-behavior-on-error-fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-change-default-behavior-on-error-fixup.patch"

Don't panic by default on IO errors, remount ro instead 

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/vfs_ops.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/fs/reiser4/vfs_ops.c
+++ b/fs/reiser4/vfs_ops.c
@@ -232,9 +232,8 @@ void reiser4_handle_error(void)
 	reiser4_status_write(REISER4_STATUS_DAMAGED, 0,
 			     "Filesystem error occured");
 	switch (get_super_private(sb)->onerror) {
-	case 0:
-		reiser4_panic("foobar-42", "Filesystem error occured\n");
 	case 1:
+		reiser4_panic("foobar-42", "Filesystem error occured\n");
 	default:
 		if (sb->s_flags & MS_RDONLY)
 			return;

--------------030209090203020003070501--
