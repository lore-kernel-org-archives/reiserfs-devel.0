From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-4.1
Date: Fri, 04 Sep 2015 09:23:00 +0200
Message-ID: <55E946D4.8040902@gmail.com>
References: <55C49E4A.5000803@gmail.com> <1441325851.12422.5.camel@gmail.com> <55E945B6.9050709@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030901090301040803080605"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type;
        bh=QXMOg1zopmqZ2XzXrGj05zI2az9AebFlrHjqotXYERI=;
        b=jDb4SlaBN2dWAOWHuincSe7tTE7a3c34FBDOvCg0dl4v1CCH4sM3C1Q8NHEABd1Wed
         EIxMKSSUuqRobDo7KewygcWezjtiqHBgXZCdhVR9Xj+5+emnB+J8XXMgYWcED7YG1cpK
         eO70eiPWZ8gNFelup1pup7TGPB9zWZRLLUbpaFp/XNjIK7XAFJ0Bq+GW8ez75b6OUbBK
         yAlKtgJmmaEG8DZDM9g8FjVcn3kPQK5R+tI+UUxGtcg5jXc31hF45RGJM1fJ5HSBXPOg
         DyvjOJzDCfbS7pX7VuEx5IWYi6Pgf/lLpGo/x/lXRscorLjg7cUiV/uR3OBs4E1E+xUA
         ZkPw==
In-Reply-To: <55E945B6.9050709@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ivan Shapovalov <intelfx100@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030901090301040803080605
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/04/2015 09:18 AM, Edward Shishkin wrote:
>
>
> On 09/04/2015 02:17 AM, Ivan Shapovalov wrote:
>> On 2015-08-07 at 14:02 +0200, Edward Shishkin wrote:
>>> Changes since Reiser4 for Linux-4.0.4:
>>>
>>> Fixed a problem appearing when running under "no space left on
>>> device". It also could be the reason of sporadic silent non
>>> -reproducible
>>> data corruptions, that were reported periodically.
>>>
>>> The fixup was backported to Linux-4.0 (see reiser4-for-4.0.9).
>>> If you need a backport for older kernel, then let me know.
>>>
>>> Please, find at
>>> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/
>> Hi Edward,
>>
>> could you please send the fixup in a separate patch/mail (git-format)?
>>
>> /* btw, I did not forget about finishing discard support etc. I've
>> found myself to be slightly overwhelmed with various things since a
>> month ago, so it's just no time currently. */
>>
>> Thanks,
>
> Hello Ivan,
>
> Attached.

Oops,
forgot the last one..


--------------030901090301040803080605
Content-Type: text/x-patch;
 name="reiser4-change-default-behavior-on-error.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-change-default-behavior-on-error.patch"

Change default behavior on IO errors to "remount readonly";
Improve compatibility warnings.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/init_super.c                       |    2 -
 fs/reiser4/plugin/disk_format/disk_format40.c |   31 +++++++++++++++-----------
 2 files changed, 19 insertions(+), 14 deletions(-)

--- a/fs/reiser4/init_super.c
+++ b/fs/reiser4/init_super.c
@@ -533,7 +533,7 @@ int reiser4_init_super_data(struct super
 			.oneof = {
 				.result = &sbinfo->onerror,
 				.list = {
-					"panic", "remount-ro", NULL
+					"remount-ro", "panic", NULL
 				},
 			}
 		}
--- a/fs/reiser4/plugin/disk_format/disk_format40.c
+++ b/fs/reiser4/plugin/disk_format/disk_format40.c
@@ -91,12 +91,12 @@ static int update_backup_version(const f
 
 static int update_disk_version_minor(const format40_disk_super_block * sb)
 {
-	return (get_format40_version(sb) < PLUGIN_LIBRARY_VERSION);
+	return (get_format40_version(sb) < get_release_number_minor());
 }
 
 static int incomplete_compatibility(const format40_disk_super_block * sb)
 {
-	return (get_format40_version(sb) > PLUGIN_LIBRARY_VERSION);
+	return (get_format40_version(sb) > get_release_number_minor());
 }
 
 static format40_super_info *get_sb_info(struct super_block *super)
@@ -321,10 +321,14 @@ static int try_init_format40(struct supe
 	       super->s_id,
 	       get_format40_version(sb_copy));
 	if (incomplete_compatibility(sb_copy))
-		printk("reiser4: Warning: The last completely supported "
-		       "version of disk format40 is %u. Some objects of "
-		       "the semantic tree can be unaccessible.\n",
-		       PLUGIN_LIBRARY_VERSION);
+		printk("reiser4: %s: format version number (4.0.%u) is "
+		       "greater than release number (4.%u.%u) of reiser4 "
+		       "kernel module. Some objects of the volume can be "
+		       "inaccessible.\n",
+		       super->s_id,
+		       get_format40_version(sb_copy),
+		       get_release_number_major(),
+		       get_release_number_minor());
 	/* make sure that key format of kernel and filesystem match */
 	result = check_key_format(sb_copy);
 	if (result) {
@@ -371,9 +375,8 @@ static int try_init_format40(struct supe
 	kfree(sb_copy);
 
 	if (update_backup_version(sb_copy))
-		printk("reiser4: Warning: metadata backup is not updated. "
-		       "Please run 'fsck.reiser4 --fix' on %s.\n",
-		       super->s_id);
+		printk("reiser4: %s: use 'fsck.reiser4 --fix' "
+		       "to complete disk format upgrade.\n", super->s_id);
 
 	sbinfo->fsuid = 0;
 	sbinfo->fs_flags |= (1 << REISER4_ADG);	/* hard links for directories
@@ -617,12 +620,14 @@ int version_update_format40(struct super
 	if (super->s_flags & MS_RDONLY)
  		return 0;
 
-	if (get_super_private(super)->version >= PLUGIN_LIBRARY_VERSION)
+	if (get_super_private(super)->version >= get_release_number_minor())
 		return 0;
 
-	printk("reiser4: Updating disk format to 4.0.%u. The reiser4 metadata "
-	       "backup is left unchanged. Please run 'fsck.reiser4 --fix' "
-	       "on %s to update it too.\n", PLUGIN_LIBRARY_VERSION, super->s_id);
+	printk("reiser4: %s: upgrading disk format to 4.0.%u.\n",
+	       super->s_id,
+	       get_release_number_minor());
+	printk("reiser4: %s: use 'fsck.reiser4 --fix' "
+	       "to complete disk format upgrade.\n", super->s_id);
 
 	/* Mark the uber znode dirty to call log_super on write_logs. */
 	init_lh(&lh);

--------------030901090301040803080605--
