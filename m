From: Andreas Sundstrom <sunkan@zappa.cx>
Subject: Re: Problem - reiser4(2004.08.13), apache(2.0.50) and "AllowOverride
 All"
Date: Tue, 24 Aug 2004 21:00:10 +0200
Message-ID: <412B903A.8010209@zappa.cx>
References: <412B71F6.6020603@zappa.cx> <412B8C23.7050208@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20488-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412B8C23.7050208@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hans Reiser wrote:
> Thanks, I think you just diagnosed one of our support requests. flx, can 

Great, it's always nice to be able to help out in some way ;)

> you write and send in a patch to the apache maintainers?  (Zam has a 

If a patch is created I would very much like to get hold of it so I can
revert to my normal setup on apache.

> huge backlog of tasks....)  Zam, can you send the support requestor this 
> diagnosis?
> 
> So, we now have 0 bug reports resulting from going into -mm.
> Could be that we ask to go into it next week.....:)
> 
> Hans
> 
> Andreas Sundstrom wrote:
> 
>> If I enable "AllowOverride All" in apache it can no longer serve files
>> from reiser4 filesystems.
>>
>> Here's an error from apache:
>>
>> (13)Permission denied: /var/www/htdocs/valid-xhtml11.png/.htaccess 
>> pcfg_openfile: unable to check htaccess file, ensure it is readable, 
>> referer: http://zappa.cx/
>>
>> Some info about the file:
>> sunkan@zappa:~$ ls -il /var/www/htdocs/valid-xhtml11.png
>> 72832 -rw-r--r--  1 root root 1917 Sep 14  2001 
>> /var/www/htdocs/valid-xhtml11.png
>>
>> sunkan@zappa:~$ file /var/www/htdocs/valid-xhtml11.png
>> /var/www/htdocs/valid-xhtml11.png: PNG image data, 88 x 31, 8-bit 
>> colormap, non-interlaced
>>
>> I found this post to be interesting:
>> http://marc.theaimsgroup.com/?l=reiserfs&m=109114584717552&w=2
>>
>> I used this patch to get reiser4 support in my kernel:
>> http://linux.mjh.name/kernel/patches/reiser4/2004.08.13_2.6.8.1/
>>
>> So I'm running vanilla 2.6.8.1 except for reiser4.
>>
>> sunkan@zappa:~/kernel/linux-2.6.8.1-reiser4$ grep REISER .config
>> CONFIG_REISER4_FS=y
>> CONFIG_REISER4_LARGE_KEY=y
>> # CONFIG_REISER4_CHECK is not set
>> CONFIG_REISERFS_FS=y
>> # CONFIG_REISERFS_CHECK is not set
>> # CONFIG_REISERFS_PROC_INFO is not set
>> CONFIG_REISERFS_FS_XATTR=y
>> CONFIG_REISERFS_FS_POSIX_ACL=y
>> # CONFIG_REISERFS_FS_SECURITY is not set
>>
>> sunkan@zappa:~/kernel/linux-2.6.8.1-reiser4$ grep 4KSTACK .config
>> # CONFIG_4KSTACKS is not set
>>
>> My guess is that apache tries to open every file as an directory and
>> if that works it checks wether an .htaccess file is present but that
>> fails in my case beacause it isn't an directory but a file.
>>
>> Who's to blame? ;)
>>
>> Let me know if I need to gather more information about this.
>>
>> I'm currently not on the list so please CC me if you want fast
>> responses. (otherwise I read the archives)
>>
>> Thanks for any help..
>> /Andreas Sundstrom
>>
>>
