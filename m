From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Mon, 23 Sep 2013 21:01:31 +0200
Message-ID: <5240900B.90800@gmail.com>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080109060106020704090500"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type;
        bh=gP3xwUfQ1cktIRU4ZOLB+YAwYJbj5MWojFn0FzIebGY=;
        b=Em/xLFq5+apbNhZH1dSw+840nyJN6w/oCRIKxi5xmucDzuFpXtqsm3Y0wS7Kyx8cfr
         45rv4mhj0E5jFAdUh3tucvFmTH8ih1/YH/ClIeV8xpKjnKYcR7zF05s4O1y4B+/LJjEk
         mMrTA+sOeJ8YfRah1dRbyGfjVtjIIAEcsU62q1gD4m1q8ZqdQYi94tr3ij36D1LZ0xLq
         yv4ZalY76DTDcDj+ysSVlO8g5N4q2ZAQ85M5ZGYGWN1xH6mYDtbeBa2DA6aURtENQvTo
         2DZRWQIp4qJZJXotiywODqAFe2m/mERixSyCYyriBfjF1+kdAJbEn2R6CJrvlrGSZcAr
         QftA==
In-Reply-To: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: m@thieu.so
Cc: Chris Gentile <cnjgentile@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080109060106020704090500
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2013 05:14 PM, m@thieu.so wrote:
[...]
>
> For the undeletable directory bug, i was able to reproduce it with 
> 3.10 simply by copying portage on a r4 partition, do ctrl-c during 
> copy and rm -rf it right after.


Unfortunately, I can not reproduce this.
Could you please try the attached patch? Does it help?
Better, on not important data...

Thanks,
Edward.

--------------080109060106020704090500
Content-Type: text/x-patch;
 name="reiser4-fix-create-unlink-race.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-create-unlink-race.patch"

Make reiser4_link(), reiser4_unlink() return error,
when REISER4_IMMUTABLE inode flag is set.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/inode_ops.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

--- linux-3.11.1.orig/fs/reiser4/plugin/inode_ops.c
+++ linux-3.11.1/fs/reiser4/plugin/inode_ops.c
@@ -151,8 +151,11 @@ int reiser4_link_common(struct dentry *e
 	assert("nikita-1434", object != NULL);
 
 	/* check for race with create_object() */
-	reiser4_check_immutable(object);
-
+	if (reiser4_inode_get_flag(object, REISER4_IMMUTABLE)) {
+		context_set_commit_async(ctx);
+		reiser4_exit_context(ctx);
+		return RETERR(-E_REPEAT);
+	}
 	parent_dplug = inode_dir_plugin(parent);
 
 	memset(&entry, 0, sizeof entry);
@@ -876,7 +879,8 @@ static int unlink_check_and_grab(struct
 	fplug = inode_file_plugin(child);
 
 	/* check for race with create_object() */
-	reiser4_check_immutable(child);
+	if (reiser4_inode_get_flag(child, REISER4_IMMUTABLE))
+		return RETERR(-E_REPEAT);
 
 	/* object being deleted should have stat data */
 	assert("vs-949", !reiser4_inode_get_flag(child, REISER4_NO_SD));

--------------080109060106020704090500--
