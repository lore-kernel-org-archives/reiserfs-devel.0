From: "Michael Styer" <michael@styer.net>
Subject: RE: missing files?
Date: Mon, 7 Feb 2005 10:58:17 -0500
Message-ID: <OIEGLJIACFOPOJLLKEJIMEBHCGAA.michael@styer.net>
References: <200502071838.00396.vitaly@namesys.com>
Reply-To: <michael@styer.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502071838.00396.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Monday, 07 February, 2005 10:38 AM Vitaly Fertman wrote:
> On Saturday 05 February 2005 19:31, Michael Styer wrote:
>> OK. So I killed everything that was keeping /usr busy and unmounted it.
>> I ran debugfs.reiser4 on /dev/hdb1 unmounted. Then I mounted the
>> partition ( 'mount -t reiser 4 -o ro,noatime /dev/hdb1 /usr' ). Now
>> debugfs.reiser4 dies with this output:
>>
>>     Fatal: Can't read master super block. Error: Can't open     reiser4
>> on /usr
>>
>> and fsck.reiser4 says this:
>>
>>     Fatal: Can't read master superblock. Fatal: Failed to open the
>>     reiser4 backup. Fatal: Cannot open the FileSysten on (/usr).
>>
>>     1 fatal corruptions were detected in SuperBlock. Run with --build-sb
>>     option to fix them.
>
> what version of reiser4progs have you created this fs with?
> it looks like the version 1.0.3 cannot open the fs due to some
> changes in the format.

I'm not entirely sure when I built this filesystem, but my guess is it was
version 1.0.2.

>> Regarding the output of fsck.reiser4, it suggests to run fsck.reiser4
>> --build-sb. What's that going to do to my filesystem? Am I likely to
>> lose the contents (i.e. is it like reformatting) or will it fix the
>> structure without causing data loss? At the minute it seems I still have
>> access to the filesystem, so I could tar everything up now before
>> rebuilding the superblock if doing so would mean losing that data.
>
> backups are never useless.

Yes, a good point.

>> Do you have any suggestions or advice as to what I should do from here?
>
> it depends on the reiser4progs version you created the fs with.
> if it was 1.0.2, you can just run 'fsck.reiser4 --build-sb <device>',
> of the 1.0.3 version, it will add reiser4 backup info properly.

Do you mean, if I did create the fs with reiser4progs 1.0.2 I can now run
version 1.0.3 of fsck.reiser4 with the --build-sb option and it will do the
right thing?

> if nothing has been changed on the fs since mas.devhdb1_unmounted.bz2
> was created, you will get 2 fs corruptions that can be fixed with
> 'fsck.reiser4 --build-fs <device>' only. about 90 leaves will be cut off
> the tree and will be inserted leaf-by-leaf and after that not inserted
> item-by-item.
>
> btw, it is possible to run
>       fsck.reiser4 --build-sb --build-fs <device>
> to fix it all together.

Just to confirm, I can do this using my current version 1.0.3 of
reiser4progs even if I created the fs with version 1.0.2? And I'm assuming I
have to have the fs mounted ro to do this, correct? Or should I unmount the
fs completely before doing this?

Thanks again.

Michael

