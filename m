From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Reiser4 module and 2.6.29-x-default kernel
Date: Fri, 22 May 2009 12:13:15 -0400
Message-ID: <4A16CF1B.30509@suse.com>
References: <13991.202.168.22.19.1242997798.squirrel@webmail.velocity.net.au> <4A16AAA5.9040105@suse.com> <4A16C922.1090700@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A16C922.1090700@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: doiggl@velocitynet.com.au, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Edward Shishkin wrote:
> Jeff Mahoney wrote:
> doiggl@velocitynet.com.au wrote:
>  
>>>> Hello,
>>>> How can I manually create a installable reiser4 rpm module for a new
>>>> kernel, because the opensuse build service seems stuck on a older
>>>> kernel .
>>>> I need all of the steps please, (commands please) so I can create the
>>>> installable rpm module.
>>>>     
> 
> Hi Glenn -
> 
>   
> 
>> Hello everyone.
> 
> I'm afraid it's not as simple as a series of commands. I do need to
> update the patch to the 2.6.29 version
> 
>> ah, you maintain 2.6.small_nr + series of patches..?

I'm one of the maintainers of the SUSE kernels. For current Factory,
that means 2.6.30-rc6-git3 plus about 270 patches.

In this case, though, I just meant that I take the patch from your FTP
repo and turn it into a tarball for use in building an RPM. I take the
bits that aren't under fs/reiser4/ and apply them to our kernel tree so
users trying to use reiser4 aren't stuck having to rebuild their entire
kernel just to use it.

>  which doesn't have the
> ->commit_write and ->prepare_write hooks that have been removed.
> 
>> this goes here:
>> http://userweb.kernel.org/~akpm/mmotm/broken-out/reiser4-adjust-to-the-new-aops.patch

Yes, and as far as I saw, the current patch in the repo doesn't use them
either.


>  The
> other thing is that it needs more support in the kernel itself.
> Previously it was limited to exports and adding a new hook, which I
> could accept without much worry. I'm concerned about whether
> set_buffers_dirty_notag() will make it upstream and I'm uncertain of the
> interactions.
>   
> 
>> I think it'll be pushed to upstream simultaneously with reiser4,
>> unless someone needs to not tag every dirty page in the radix tree..
> 
> Edward - What's the reasoning behind it?
> 
>> The reason is to reduce a cost of maintenance.
> 
>> Since reiser4_set_page_internal() is not in vfs library
>> bad things are bound to happen. For example, set_page_dirty()
>> and friends were modified by vfs folks to update dirty pages
>> accounting and of course nobody knew that there are other
>> "friends" in reiser4 code, so I have spent a lot of time to figure
>> out why oom kills processes of dbench 190...
> 
>  Has it been submitted upstream
> yet?
> 
>> Nup, this is in -mm


Ok, if that's the goal, I can just track it when I update the reiser4 patch.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkoWzxsACgkQLPWxlyuTD7KBqACgnERKLvlHHK7Tzhu/QSdQZBfE
CpkAnjge3xN0v0qGH35s/A67caQ4G90K
=Djsu
-----END PGP SIGNATURE-----
