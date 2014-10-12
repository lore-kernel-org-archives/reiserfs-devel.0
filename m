From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations
 has been left out?
Date: Sun, 12 Oct 2014 11:37:29 +0200
Message-ID: <543A4BD9.9090103@gmail.com>
References: <10671542.MCAVDCHSND@intelfx-laptop> <53F52195.1020900@gmail.com> <2194734.MaT6DR3706@intelfx-laptop> <2652463.xKkjd4Oans@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020705020805060600070506"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type;
        bh=lR24ZrQYJ1OeF6uUW/7GCuUU1ZwbiNjFPapTJYT/Axo=;
        b=p/P+JpITiWMaAGs7kY0dPp8IcYGj+8DqkU1Yx7LNCWKKDpMWCHQh3B4EtbR23AZB6v
         dysDsr2V+K9I/GGHZi0yBHSyJIim03XKxTqM6wtcFYmEAWlioZpXOSPld/3jsePAoSQQ
         MUZS25/iPdhIGN39x/GkVp+sqTpsVpqzKTV+yz5V++GBKDG2kw+gEQr9dcKz9vHf+xGb
         TwtadRhbsla+pWKsVcs1gjVsnxqKTJSxAnu2gineSTaGBBUIpmIJeNPtUwHPSVELFcRq
         Zq1l4MgfebRPpPPBarCOhozqddBhDzPvUovzVDKSu81+MdgceKo171n6NnEx4iVlEmjF
         6iDA==
In-Reply-To: <2652463.xKkjd4Oans@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------020705020805060600070506
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 10/09/2014 08:55 PM, Ivan Shapovalov wrote:
> On Thursday 21 August 2014 at 19:05:32, Ivan Shapovalov wrote:	
>> On Thursday 21 August 2014 at 00:30:45, Edward Shishkin wrote:	
>>> On 08/20/2014 10:34 PM, Ivan Shapovalov wrote:
>>>> On Wednesday 20 August 2014 at 01:39:42, Edward Shishkin wrote:	
>>>>> On 08/20/2014 12:32 AM, Ivan Shapovalov wrote:
>>>>>>    From `git log` I've seen that VFS people intend to replace ->aio_read() and
>>>>>> ->aio_write() of struct file_operations with new methods ->read_iter() and
>>>>>> ->write_iter().
>>>>>>
>>>>>> (Along with a couple of related new helpers, differing from previous just in
>>>>>> calling _iter methods instead of aio_ ones.)
>>>>>>
>>>>>>    From other filesystems it seems that these are simple drop-in replacements
>>>>>> (however, well, I have zero familiarity with VFS). So here is a question:
>>>>>> is there any intentional reason that generic_file_aio_write() is not used
>>>>>> in reiser4?
>>>>> Currently reiser4 is a set of two filesystems which differ in methods
>>>>> of handling regular files. For VFS we provide "dispatchers", which pass
>>>>> management to appropriate plugin (UNIX_FILE or CRYPTCOMPRESS).
>>>>>
>>>>> UNIX_FILE plugin doesn't use generic write for performance reasons
>>>>> (I'll try to find the respective mailing thread). CRYPTCOMPRESS doesn't
>>>>> use it for compatibility reasons: I don't know how how to rewrite it
>>>>> gracefully using the generic write method.
>>>>>
>>>>> Edward.
>>>> Thanks for explanation! So, does this patch make any sense?
>>>
>>> I haven't looked at this carefully yet, but likely it is correct.
>>>
>>> Thanks,
>>> Edward.
>> Turned out it isn't.. The iter_file_splice_write() requires ->write_iter
>> to be set, or a NULL dereference happens.
>>
>> At first I've thought that we're out of luck and will need to use the fallback
>> splice implementation (default_file_splice_write), but just setting
>> ->write_iter to generic_file_write_iter strangely worked.
>>
>> (By "it works" I mean "splice finishes successfully and does not cause data
>> corruptions").
> ...aand... it doesn't. At least on reg40 (sic, NOT ccreg40):
> 1) `kde-cp` and FF 32.0.3's downloader produce empty files;
> 2) some applications (at least two games: luftrausers and x-plane 10, both
> proprietary) deadlock somewhere inside of generic_file_write_iter().
>
> Removing ".splice_write = iter_file_splice_write" and
> ".write_iter = generic_file_write_iter" fixes the described cases.


Thanks for the observation,
so the final port will look like this (attached)


>
> Unfortunately, no time to dig deeper (MIPT is evil). Hopefully you will
> look into it someday... :)


Yup, sure, study is the first deal.

Thanks,
Edward.

--------------020705020805060600070506
Content-Type: text/x-patch;
 name="reiser4-port-for-3.16.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-port-for-3.16.patch"

Only in linux-3.15/fs/reiser4/: context.h~
diff -u -r linux-3.15/fs/reiser4/plugin/file/cryptcompress.c linux-3.16.1/fs/reiser4/plugin/file/cryptcompress.c
--- linux-3.15/fs/reiser4/plugin/file/cryptcompress.c	2014-08-24 14:10:36.186139150 +0200
+++ linux-3.16.1/fs/reiser4/plugin/file/cryptcompress.c	2014-09-25 11:43:01.000000000 +0200
@@ -2964,7 +2964,7 @@
 		reiser4_exit_context(ctx);
 		return result;
 	}
-	result = do_sync_read(file, buf, size, off);
+	result = new_sync_read(file, buf, size, off);
 
 	context_set_commit_async(ctx);
 	reiser4_exit_context(ctx);
diff -u -r linux-3.15/fs/reiser4/plugin/file/file.c linux-3.16.1/fs/reiser4/plugin/file/file.c
--- linux-3.15/fs/reiser4/plugin/file/file.c	2014-08-24 14:10:36.188139156 +0200
+++ linux-3.16.1/fs/reiser4/plugin/file/file.c	2014-09-25 11:43:01.000000000 +0200
@@ -1752,7 +1752,7 @@
 	switch (uf_info->container) {
 	case UF_CONTAINER_EXTENTS:
 		if (!reiser4_inode_get_flag(inode, REISER4_PART_MIXED)) {
-			result = do_sync_read(file, buf, read_amount, off);
+			result = new_sync_read(file, buf, read_amount, off);
 			break;
 		}
 	case UF_CONTAINER_TAILS:
diff -u -r linux-3.15/fs/reiser4/plugin/object.c linux-3.16.1/fs/reiser4/plugin/object.c
--- linux-3.15/fs/reiser4/plugin/object.c	2014-08-24 14:10:36.200139193 +0200
+++ linux-3.16.1/fs/reiser4/plugin/object.c	2014-09-25 11:43:01.000000000 +0200
@@ -127,7 +127,7 @@
 	.llseek = generic_file_llseek,
 	.read = reiser4_read_dispatch,
 	.write = reiser4_write_dispatch,
-	.aio_read = generic_file_aio_read,
+	.read_iter = generic_file_read_iter,
 	.unlocked_ioctl = reiser4_ioctl_dispatch,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl = reiser4_ioctl_dispatch,
@@ -137,7 +138,6 @@
 	.release = reiser4_release_dispatch,
 	.fsync = reiser4_sync_file_common,
 	.splice_read = generic_file_splice_read,
-	.splice_write = generic_file_splice_write
 };
 static struct address_space_operations regular_file_a_ops = {
 	.writepage = reiser4_writepage,

--------------020705020805060600070506--
